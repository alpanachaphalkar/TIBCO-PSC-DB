DROP TYPE IF EXISTS T_RELEXTRACTOR_REC CASCADE;
DROP TYPE IF EXISTS T_COLUMNNAMES CASCADE;
DROP TYPE IF EXISTS T_EXTRACT_REC CASCADE;

CREATE TYPE T_RELEXTRACTOR_REC AS (
    relid NUMERIC(19),
	reltype NUMERIC(19)
);

CREATE TYPE T_COLUMNNAMES AS(
	columnName VARCHAR(30)
);

CREATE TYPE T_EXTRACT_REC AS(
	productKeyId BIGINT,
	catalogId BIGINT,
	modVersion BIGINT
);

CREATE OR REPLACE FUNCTION fc_del_from_dbe_relationship(orgid bigint, reltablename character varying, mastertablename character varying, fromtimestamp character varying, totimestamp character varying)
  RETURNS void AS
$BODY$
	DECLARE 
		parent_id RELATIONSHIP.PARENTID%TYPE;
		parent_Version RELATIONSHIP.PARENTVERSION%TYPE;
		child_id RELATIONSHIP.CHILDID%TYPE;
		child_Version RELATIONSHIP.CHILDVERSION%TYPE;
		mod_date RELATIONSHIP.MODDATE%TYPE;
		
		previousModDate RELATIONSHIP.MODDATE%TYPE;
		previousRelationId DECIMAL(38) = NULL;
		
		rctTableName CATALOG.TABLENAME%TYPE;
		childCatalogId RELATIONSHIPDEFINITION.OWNERID%TYPE;
		parentCatalogId RELATIONSHIPDEFINITION.OWNERID%TYPE;
		
		columnDataCount SMALLINT;
		
		l_relextractor T_RELEXTRACTOR_REC;
		l_columnanmes T_COLUMNNAMES;
		
		to_delete T_EXTRACT_REC [];
		to_retain T_EXTRACT_REC [];
	
		to_delete_counter INTEGER := 1;
		to_retain_counter INTEGER := 1;
	
		retain_flag BOOLEAN :=false;
		delete_flag BOOLEAN :=true;
  
		counter INTEGER := 0;

		to_delete_rec T_EXTRACT_REC;
		to_retain_rec T_EXTRACT_REC;
		
		hasDataChanged varchar(1);
		
	BEGIN
		FOR l_relextractor IN EXECUTE  'SELECT RELID, TYPE FROM ' || relTablename LOOP
			BEGIN
				hasDataChanged := 'N';
				delete_flag := false;
      
				
				SELECT DISTINCT 'rct_' || RELATIONSHIPCATALOGID  FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = orgId AND TYPE = l_relextractor.reltype  AND ACTIVE = 'Y'  INTO rctTableName;
					
				SELECT 
					CASE
						WHEN TEMP.TARGETCATALOGID = -1 THEN TEMP.OWNERID
							ELSE TEMP.TARGETCATALOGID 
						END INTO childCatalogId FROM (SELECT DISTINCT OWNERID, TARGETCATALOGID FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = orgId AND TYPE =  l_relextractor.reltype AND ACTIVE = 'Y') TEMP;

				SELECT DISTINCT OWNERID INTO parentCatalogId FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = orgId AND TYPE =  l_relextractor.reltype AND ACTIVE = 'Y';

				SELECT PARENTID, PARENTVERSION, CHILDID, CHILDVERSION ,MODDATE INTO parent_id, parent_Version, child_id, child_Version,mod_date FROM RELATIONSHIP WHERE RELATIONID = l_relextractor.relid;
				IF mod_date >= to_timestamp(fromtimestamp,'YYYY-MM-DD HH24:mi:ss:MS') AND mod_date <= to_timestamp(totimestamp,'YYYY-MM-DD HH24:mi:ss:MS') THEN
				
					EXECUTE 'SELECT MAX(MODDATE) FROM RELATIONSHIP,(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE ACTIVE = ''Y'' AND STATE = ''CONFIRMED'') PARENT,(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE ACTIVE = ''Y'' AND STATE = ''CONFIRMED'') CHILD        WHERE PARENTID = ' || parent_id || ' AND CHILDID = ' || child_id || ' AND TYPE = ' || l_relextractor.reltype || ' AND MODDATE < to_timestamp(''' || mod_date || ''',''YYYY-MM-DD HH24:mi:ss:MS'') AND ACTIVE = ''Y'' AND PARENTID = PARENT.PRODUCTKEYID AND PARENTVERSION = PARENT.MODVERSION AND CHILDID = CHILD.PRODUCTKEYID AND CHILDVERSION = CHILD.MODVERSION' INTO previousModDate;	

					RAISE NOTICE 'previousModDate--%',previousModDate;
					
					IF previousModDate IS NOT NULL THEN
					
						EXECUTE 'SELECT RELATIONSHIP.RELATIONID FROM RELATIONSHIP,(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE ACTIVE = ''Y'' AND STATE = ''CONFIRMED'') PARENT,(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE ACTIVE = ''Y'' AND STATE = ''CONFIRMED'') CHILD        WHERE PARENTID = ' || parent_id || ' AND CHILDID = ' || child_id || ' AND TYPE = ' || l_relextractor.reltype || ' AND MODDATE = to_timestamp(''' || previousModDate || ''',''YYYY-MM-DD HH24:mi:ss:MS'') AND ACTIVE = ''Y'' AND PARENTID = PARENT.PRODUCTKEYID AND PARENTVERSION = PARENT.MODVERSION AND CHILDID = CHILD.PRODUCTKEYID AND CHILDVERSION = CHILD.MODVERSION' INTO previousRelationId;
					
						RAISE NOTICE 'previousRelationId--%',previousRelationId;
					
					
						IF previousRelationId IS NOT NULL THEN
							FOR l_columnanmes IN EXECUTE  'SELECT COLUMN_NAME FROM information_schema.columns WHERE TABLE_NAME = ''' || rctTableName || '''' LOOP
								BEGIN
									IF l_columnanmes.columnName != 'CRELATIONID' AND l_columnanmes.columnName != 'crelationid'  THEN
										
										EXECUTE  'SELECT COUNT(*) FROM (SELECT DISTINCT ' || l_columnanmes.columnName || ' FROM ' || rctTableName || ' WHERE CRELATIONID IN (' || l_relextractor.relid || ',' || previousRelationId || ')) COLUMNNAMEALIAS' INTO columnDataCount;
            
										IF columnDataCount > 1 THEN
											RAISE NOTICE 'l_columnanmes.columnName%',l_columnanmes.columnName;
											hasDataChanged := 'Y';
										END IF;
									END IF;
								END;
							END LOOP;
						
							IF hasDataChanged = 'N' THEN
								RAISE NOTICE 'Deleting relationid--%',  l_relextractor.relid;
								EXECUTE  'DELETE FROM ' || relTablename || ' WHERE RELID = ' || l_relextractor.relid;

								to_delete_rec.productKeyId := parent_id;
								to_delete_rec.catalogId := parentCatalogId;
								to_delete_rec.modVersion := parent_Version;
								
								to_delete[to_delete_counter] := to_delete_rec;
								to_delete_counter := to_delete_counter+1;
							       
								to_delete_rec.productKeyId := child_id;
								to_delete_rec.catalogId := childCatalogId;
								to_delete_rec.modVersion := child_Version;
								
								to_delete[to_delete_counter] := to_delete_rec;
								to_delete_counter := to_delete_counter+1;

								delete_flag := true;
							END IF;
						END IF;
					
					
						IF not found then
							raise notice 'No data found';
						END IF;
					END IF;
				
				ELSE
					RAISE NOTICE 'deleting relationid--%',  l_relextractor.relid;
					
					EXECUTE  'DELETE FROM ' || relTablename || ' WHERE RELID = ' || l_relextractor.relid;
		   
					to_delete_rec.productKeyId := parent_id;
					to_delete_rec.catalogId := parentCatalogId;
					to_delete_rec.modVersion := parent_Version;
								
					to_delete[to_delete_counter] := to_delete_rec;
					to_delete_counter := to_delete_counter+1;
								
					to_delete_rec.productKeyId := child_id;
					to_delete_rec.catalogId := childCatalogId;
					to_delete_rec.modVersion := child_Version;

					to_delete[to_delete_counter] := to_delete_rec;
					to_delete_counter := to_delete_counter+1;
								
					delete_flag := true;
				END IF;
			
				IF NOT delete_flag THEN 
					to_retain_rec.productKeyId := parent_id;
					to_retain_rec.catalogId := parentCatalogId;
					to_retain_rec.modVersion := parent_Version;

					to_retain[to_retain_counter] := to_retain_rec;
					to_retain_counter := to_retain_counter+1;

					
					to_retain_rec.productKeyId := child_id;
					to_retain_rec.catalogId := childCatalogId;
					to_retain_rec.modVersion := child_Version;
					
					to_retain[to_retain_counter] := to_retain_rec;
					to_retain_counter := to_retain_counter+1;
				END IF;
			END;
		END LOOP;

		IF to_delete[1] IS NOT NULL THEN
		
			FOR j IN 1..array_upper(to_delete, 1) LOOP
				BEGIN       
					IF to_retain[1] IS NOT NULL THEN
						FOR k IN 1..array_upper(to_retain, 1) LOOP
							BEGIN
								IF to_delete[j].productKeyId = to_retain[k].productKeyId  AND to_delete[j].catalogId = to_retain[k].catalogId THEN
									retain_flag :=true;
									EXIT WHEN retain_flag;
								END IF;
							END;
						END LOOP;
					END IF;
	
      
					IF NOT retain_flag THEN
						Raise notice 'masterTableName--%--%',masterTableName,to_delete[j];
						EXECUTE  'DELETE FROM ' || masterTableName || to_delete[j].catalogId || ' WHERE PRODUCTKEYID = ' ||  to_delete[j].productKeyId || ' AND MODVERSION = ' || to_delete[j].modVersion|| ' AND PRODUCTKEYID NOT IN (SELECT PRODUCTKEYID FROM PRINCIPALKEY WHERE PRODUCTKEYID = ' || to_delete[j].productKeyId || ' AND ACTIVE = ''Y'' AND STATE = ''CONFIRMED'' AND MODDATE BETWEEN to_timestamp(''' || fromtimestamp || ''', ''YYYY-MM-DD HH24:mi:ss:MS'') AND to_timestamp(''' || totimestamp || ''', ''YYYY-MM-DD HH24:mi:ss:MS''))';
					END IF;
         
					retain_flag :=false; 
				END;
			END LOOP;
		END IF;
	END;	
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
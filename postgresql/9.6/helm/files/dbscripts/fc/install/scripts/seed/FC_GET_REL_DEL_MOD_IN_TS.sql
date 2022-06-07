DROP TYPE IF EXISTS T_RELS CASCADE;

CREATE TYPE T_RELS AS(
	parentId VARCHAR(255),
	parentIdExt VARCHAR(255),
	parentVersion bigint,
	parentCatalogName VARCHAR(80),
	childId VARCHAR(255),
	childIdExt VARCHAR(255),
	childVersion bigint,
	childCatalogName VARCHAR(80),
	relationshipName VARCHAR(80)
);

CREATE OR REPLACE FUNCTION FC_GET_REL_DEL_MOD_IN_TS(IN orgid bigint, IN fromtimestamp character varying, IN totimestamp character varying,IN catalogId bigint, OUT rels t_rels[])
  RETURNS t_rels[] AS
$BODY$
DECLARE

	parentid RELATIONSHIP.PARENTID%TYPE;
	childid RELATIONSHIP.CHILDID%TYPE;
	
	childCatalogId RELATIONSHIPDEFINITION.OWNERID%TYPE;
	parentCatalogId RELATIONSHIPDEFINITION.OWNERID%TYPE;
	
	parentCatalogName CATALOG.NAME%TYPE;
	childCatalogName CATALOG.NAME%TYPE;
  
	productId varchar(255);
	productIdExt varchar(255);
  
	relationshipName RELATIONSHIPDEFINITION.NAME%TYPE;
  
	columnDataCount SMALLINT;
	sQuery text;
	l_Relationships RELATIONSHIP%ROWTYPE;
	rel T_RELS;
	k integer := 1;
BEGIN

    rel.parentId :='parentId';
	rel.parentIdExt :='parentIdExt';
	rel.parentVersion:=1;
	rel.parentCatalogName :='parentCatalogName';
	rel.childId :='childId';
	rel.childIdExt :='childIdExt';
	rel.childVersion :=1;
	rel.childCatalogName :='childCatalogName';
	rel.relationshipName :='relationshipName';
	rels[k] :=rel;
	k := k+1;
	
	IF fromtimestamp = NULL OR TRIM(fromtimestamp) = '' THEN
		sQuery := 'SELECT RELATIONSHIP.* FROM RELATIONSHIP, 
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') PARENT,
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') CHILD
		
		WHERE RELATIONSHIP.MODDATE <= to_timestamp(''' || totimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'') 
		AND RELATIONSHIP.PARENTID = PARENT.PRODUCTKEYID
		AND RELATIONSHIP.PARENTVERSION = PARENT.MODVERSION
		AND RELATIONSHIP.CHILDID = CHILD.PRODUCTKEYID
		AND RELATIONSHIP.CHILDVERSION = CHILD.MODVERSION
		AND TYPE IN (SELECT DISTINCT TYPE FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = ' || orgId || ' AND ACTIVE = ''Y'' AND OWNERID='|| catalogId ||')';
	ELSE
		sQuery := 'SELECT RELATIONSHIP.* FROM RELATIONSHIP, 
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') PARENT,
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') CHILD
		
		WHERE RELATIONSHIP.MODDATE BETWEEN to_timestamp(''' || fromtimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'') AND to_timestamp(''' || totimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'')
		AND RELATIONSHIP.PARENTID = PARENT.PRODUCTKEYID
		AND RELATIONSHIP.PARENTVERSION = PARENT.MODVERSION
		AND RELATIONSHIP.CHILDID = CHILD.PRODUCTKEYID
		AND RELATIONSHIP.CHILDVERSION = CHILD.MODVERSION
		AND TYPE IN (SELECT DISTINCT TYPE FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = ' || orgId || ' AND ACTIVE = ''Y'' AND OWNERID = '|| catalogId ||' )';
	END IF;
	
	FOR l_relationships IN EXECUTE sQuery LOOP
		BEGIN
			RAISE NOTICE '%',k;
			SELECT DISTINCT RELATIONSHIPDEFINITION.OWNERID, CATALOG.NAME INTO parentCatalogId, parentCatalogName FROM RELATIONSHIPDEFINITION, CATALOG 
			WHERE RELATIONSHIPDEFINITION.ORGANIZATIONID = orgId AND RELATIONSHIPDEFINITION.TYPE = l_relationships.TYPE AND RELATIONSHIPDEFINITION.ACTIVE = 'Y'
			AND RELATIONSHIPDEFINITION.OWNERID = CATALOG.ID AND CATALOG.ACTIVE = 'Y';

			RAISE NOTICE '%',parentCatalogId;
			RAISE NOTICE '%',l_relationships.PARENTID;
			RAISE NOTICE '%',l_relationships.PARENTVERSION;
			
			EXECUTE 'SELECT CPRODUCTID as varchar FROM MCT_' || parentCatalogId || ' WHERE CPRODUCTKEYID = ' || l_relationships.PARENTID  || ' AND CMODVERSION = ' || l_relationships.PARENTVERSION INTO productId ;
			EXECUTE 'SELECT CPRODUCTIDEXT as varchar FROM MCT_' || parentCatalogId || ' WHERE CPRODUCTKEYID = ' || l_relationships.PARENTID || ' AND CMODVERSION = ' || l_relationships.PARENTVERSION  INTO productIdExt ;
			

		
			RAISE NOTICE '%',productId;
			RAISE NOTICE '%',productIdExt;
			rel.parentId := productId;
			rel.parentIdExt := productIdExt;
			rel.parentVersion := l_relationships.PARENTVERSION;
			rel.parentCatalogName := parentCatalogName;

				SELECT DISTINCT TEMP1.CATID, CATALOG.NAME INTO childCatalogId, childCatalogName FROM CATALOG, 
			(SELECT 
					CASE
						WHEN TEMP.TARGETCATALOGID = -1 THEN TEMP.OWNERID
						ELSE TEMP.TARGETCATALOGID 
					END CATID FROM (SELECT DISTINCT OWNERID, TARGETCATALOGID FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = orgId AND TYPE =  l_relationships.TYPE AND ACTIVE = 'Y') TEMP) TEMP1
			WHERE TEMP1.CATID = CATALOG.ID AND CATALOG.ACTIVE = 'Y';

			EXECUTE 'SELECT CPRODUCTID as varchar FROM MCT_' || childCatalogId || ' WHERE CPRODUCTKEYID = ' || l_relationships.CHILDID  || ' AND CMODVERSION = ' || l_relationships.CHILDVERSION INTO productId ;
			EXECUTE 'SELECT CPRODUCTIDEXT as varchar FROM MCT_' || childCatalogId || ' WHERE CPRODUCTKEYID = ' || l_relationships.CHILDID || ' AND CMODVERSION = ' || l_relationships.CHILDVERSION  INTO productIdExt ;
			
			rel.childId := productId;
			rel.childIdExt := productIdExt;
			rel.childVersion := l_relationships.CHILDVERSION;
			rel.childCatalogName := childCatalogName;

			SELECT NAME INTO relationshipName FROM RELATIONSHIPDEFINITION WHERE TYPE = l_relationships.TYPE AND ACTIVE = 'Y';

			rel.relationshipName := relationshipName;
			rels[k]=rel;
			k:=k+1;
		END; 
		     
	END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
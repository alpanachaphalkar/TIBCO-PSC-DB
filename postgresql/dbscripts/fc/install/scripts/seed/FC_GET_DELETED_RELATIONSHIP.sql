DROP TYPE IF EXISTS T_DELETED_RELS CASCADE;

CREATE  TYPE T_DELETED_RELS AS(
	parentId VARCHAR(255),
	parentIdExt VARCHAR(255),
	parentCatalogName VARCHAR(80),
	childId VARCHAR(255),
	childIdExt VARCHAR(255),
	childCatalogName VARCHAR(80),
	relationshipName VARCHAR(80)
);

CREATE OR REPLACE FUNCTION fc_get_deleted_relationship(IN orgid bigint, IN fromtimestamp character varying, IN totimestamp character varying, OUT deletedrels t_deleted_rels[])
  RETURNS t_deleted_rels[] AS
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
	l_deletedRelationships RELATIONSHIP%ROWTYPE;
	deletedRel T_DELETED_RELS;
	k integer := 1;
BEGIN

    deletedRel.parentId :='parentId';
	deletedRel.parentIdExt :='parentIdExt';
	deletedRel.parentCatalogName :='parentCatalogName';
	deletedRel.childId :='childId';
	deletedRel.childIdExt :='childIdExt';
	deletedRel.childCatalogName :='childCatalogName';
	deletedRel.relationshipName :='relationshipName';
	deletedrels[k] :=deletedRel;
	k := k+1;
	
	IF fromtimestamp = NULL OR TRIM(fromtimestamp) = '' THEN
		sQuery := 'SELECT RELATIONSHIP.* FROM RELATIONSHIP, 
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') PARENT,
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') CHILD
		
		WHERE RELATIONSHIP.MODDATE <= to_timestamp(''' || totimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'')
		AND RELATIONSHIP.ACTIVE = ''N'' 
		AND RELATIONSHIP.PARENTID = PARENT.PRODUCTKEYID
		AND RELATIONSHIP.PARENTVERSION = PARENT.MODVERSION
		AND RELATIONSHIP.CHILDID = CHILD.PRODUCTKEYID
		AND RELATIONSHIP.CHILDVERSION = CHILD.MODVERSION
		AND TYPE IN (SELECT DISTINCT TYPE FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = ' || orgId || ' AND ACTIVE = ''Y'')';
	ELSE
		sQuery := 'SELECT RELATIONSHIP.* FROM RELATIONSHIP, 
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') PARENT,
		(SELECT PRODUCTKEYID, MODVERSION FROM PRINCIPALKEY WHERE STATE = ''CONFIRMED'') CHILD
		
		WHERE RELATIONSHIP.MODDATE BETWEEN to_timestamp(''' || fromtimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'') AND to_timestamp(''' || totimestamp || ''', ''YYYY-MM-DD HH24:mi:ss'')
		AND RELATIONSHIP.ACTIVE = ''N'' 
		AND RELATIONSHIP.PARENTID = PARENT.PRODUCTKEYID
		AND RELATIONSHIP.PARENTVERSION = PARENT.MODVERSION
		AND RELATIONSHIP.CHILDID = CHILD.PRODUCTKEYID
		AND RELATIONSHIP.CHILDVERSION = CHILD.MODVERSION
		AND TYPE IN (SELECT DISTINCT TYPE FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = ' || orgId || ' AND ACTIVE = ''Y'')';
	END IF;
	
	FOR l_deletedRelationships IN EXECUTE sQuery LOOP
		BEGIN
			RAISE NOTICE '%',k;
			SELECT DISTINCT RELATIONSHIPDEFINITION.OWNERID, CATALOG.NAME INTO parentCatalogId, parentCatalogName FROM RELATIONSHIPDEFINITION, CATALOG 
			WHERE RELATIONSHIPDEFINITION.ORGANIZATIONID = orgId AND RELATIONSHIPDEFINITION.TYPE = l_deletedRelationships.TYPE AND RELATIONSHIPDEFINITION.ACTIVE = 'Y'
			AND RELATIONSHIPDEFINITION.OWNERID = CATALOG.ID AND CATALOG.ACTIVE = 'Y';

			RAISE NOTICE '%',parentCatalogId;
			RAISE NOTICE '%',l_deletedRelationships.PARENTID;
			RAISE NOTICE '%',l_deletedRelationships.PARENTVERSION;
			
			EXECUTE 'SELECT CPRODUCTID as varchar FROM MCT_' || parentCatalogId || ' WHERE CPRODUCTKEYID = ' || l_deletedRelationships.PARENTID  || ' AND CMODVERSION = ' || l_deletedRelationships.PARENTVERSION INTO productId ;
			EXECUTE 'SELECT CPRODUCTIDEXT as varchar FROM MCT_' || parentCatalogId || ' WHERE CPRODUCTKEYID = ' || l_deletedRelationships.PARENTID || ' AND CMODVERSION = ' || l_deletedRelationships.PARENTVERSION  INTO productIdExt ;
			

		
			RAISE NOTICE '%',productId;
			RAISE NOTICE '%',productIdExt;
			deletedRel.parentId := productId;
			deletedRel.parentIdExt := productIdExt;
			deletedRel.parentCatalogName := parentCatalogName;

				SELECT DISTINCT TEMP1.CATID, CATALOG.NAME INTO childCatalogId, childCatalogName FROM CATALOG, 
			(SELECT 
					CASE
						WHEN TEMP.TARGETCATALOGID = -1 THEN TEMP.OWNERID
						ELSE TEMP.TARGETCATALOGID 
					END CATID FROM (SELECT DISTINCT OWNERID, TARGETCATALOGID FROM RELATIONSHIPDEFINITION WHERE ORGANIZATIONID = orgId AND TYPE =  l_deletedRelationships.TYPE AND ACTIVE = 'Y') TEMP) TEMP1
			WHERE TEMP1.CATID = CATALOG.ID AND CATALOG.ACTIVE = 'Y';

			EXECUTE 'SELECT CPRODUCTID as varchar FROM MCT_' || childCatalogId || ' WHERE CPRODUCTKEYID = ' || l_deletedRelationships.CHILDID  || ' AND CMODVERSION = ' || l_deletedRelationships.CHILDVERSION INTO productId ;
			EXECUTE 'SELECT CPRODUCTIDEXT as varchar FROM MCT_' || childCatalogId || ' WHERE CPRODUCTKEYID = ' || l_deletedRelationships.CHILDID || ' AND CMODVERSION = ' || l_deletedRelationships.CHILDVERSION  INTO productIdExt ;
			
			deletedRel.childId := productId;
			deletedRel.childIdExt := productIdExt;
			deletedRel.childCatalogName := childCatalogName;

			SELECT NAME INTO relationshipName FROM RELATIONSHIPDEFINITION WHERE TYPE = l_deletedRelationships.TYPE AND ACTIVE = 'Y';

			deletedRel.relationshipName := relationshipName;
			deletedRels[k]=deletedRel;
			k:=k+1;
		END; 
		     
	END LOOP;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
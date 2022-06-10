-- Copyright (c) 2000-2009 TIBCO Software Inc. All Rights Reserved.

--  This work is subject  to  U.S. and  international  copyright  laws  and
--     treaties. No part  of  this  work may be  used,  practiced,  performed
--     copied, distributed, revised, modified, translated,  abridged, condensed,
--     expanded,  collected,  compiled,  linked,  recast, transformed or adapted
--     without the prior written consent of TIBCO Software Inc. any use or
--     exploitation of this work without authorization could subject the
--     perpetrator to criminal and civil liability.
--
-- Note   : Please DO NOT edit the script.

--
-- FUNCTION TIB_TO_DATE
--
CREATE OR REPLACE FUNCTION TIB_TO_DATE (DATE VARCHAR(29), FORMAT VARCHAR(29)) RETURNS TIMESTAMP AS 
$$
    DECLARE
        modDate TIMESTAMP WITHOUT TIME ZONE;
        yyyy1 varchar(4);
        mm varchar(2);
        dd varchar(2);
		hh varchar(2);
        mi varchar(2);
        ss varchar(2);
        ms varchar(6);

        mod1 varchar(2);
        mod2 varchar(2);
        yyyy2 varchar(4);
        dd11 varchar(26);
    
    BEGIN 

        format:=upper(format);			
        yyyy1:=SUBSTRING (DATE, 1, 4);
        mm:=SUBSTRING(DATE, 6, 2);
        dd:=SUBSTRING(DATE, 9, 2);

        hh:=SUBSTRING(DATE, 12, 2);
        mi:=SUBSTRING(DATE, 15, 2);
        ss:=SUBSTRING(DATE, 18, 2);
        ms:=SUBSTRING(DATE, 21, 6);

        mod1:=SUBSTRING(DATE, 1, 2);
        mod2:=SUBSTRING(DATE, 4, 2);
        yyyy2:=SUBSTRING(DATE, 7, 4);
      

        SELECT
            CASE
                WHEN ((format = 'YYYY-MM-DD HH:MI:SS.MS') OR (format = 'YYYY-MM-DD HH24:MI:SS.MS'))
                THEN 

                    to_timestamp (yyyy1 || '-' ||mm || '-' ||dd || ' ' ||hh || ':' ||mi || ':' ||ss || '.' ||ms,'YYYY-MM-DD HH24:MI:SS.MS')

                WHEN ((format = 'YYYY-MM-DD HH24:MI:SS')
                OR (format = 'YYYY/MM/DD HH24:MI:SS')
                OR (format = 'YYYY-MM-DD HH:MI:SS AM')
                OR (format = 'YYYY/MM/DD HH:MI:SS AM')
                OR (format = 'YYYY-MM-DD HH:MI:SS')
                OR (format = 'YYYY/MM/DD HH:MI:SS'))
                THEN 

                    to_timestamp (
                    yyyy1 || '-' ||
                    mm || '-' ||
                    dd || ' ' ||
                    hh || ':' ||
                    mi || ':' ||
                    ss || '.999' ,'YYYY-MM-DD HH24:MI:SS.MS')
                    

                WHEN ((format = 'MM-DD-YYYY HH24:MI:SS')
                OR (format = 'MM/DD/YYYY HH24:MI:SS')
                OR (format = 'MM-DD-YYYY HH:MI:SS AM')
                OR (format = 'MM/DD/YYYY HH:MI:SS AM')
                OR (format = 'MM-DD-YYYY HH:MI:SS')
                OR (format = 'MM/DD/YYYY HH:MI:SS'))
                THEN 

                    to_timestamp(
                    yyyy2 || '-' ||
                    mod1 || '-' ||
                    mod2 || ' ' ||
                    hh || ':' ||
                    mi || ':' ||
                    ss || '.999','YYYY-MM-DD HH24:MI:SS.MS')
            

                WHEN ((format = 'DD-MM-YYYY HH24:MI:SS')
                OR (format = 'DD/MM/YYYY HH24:MI:SS')
                OR (format = 'DD-MM-YYYY HH:MI:SS AM')
                OR (format = 'DD/MM/YYYY HH:MI:SS AM')
                OR (format = 'DD-MM-YYYY HH:MI:SS')
                OR (format = 'DD/MM/YYYY HH:MI:SS'))
                THEN
                
                    to_timestamp(
                    yyyy2 || '-' ||
                    mod2 || '-' ||
                    mod1 || ' ' ||
                    hh || ':' ||
                    mi || ':' ||
                    ss || '.999','YYYY-MM-DD HH24:MI:SS.MS')

                WHEN ((format = 'YYYY-MM-DD')
                OR (format = 'YYYY/MM/DD'))
                THEN 
                
                    to_timestamp(
                    yyyy1 || '-' ||
                    mm || '-' ||
                    dd || ' 00:00:00.999','YYYY-MM-DD HH24:MI:SS.MS')
 
                WHEN ((format = 'MM-DD-YYYY')
                OR (format = 'MM/DD/YYYY'))
                THEN 
                
                    to_timestamp(
                    yyyy2 || '-' ||
                    mod1 || '-' ||
                    mod2 || ' 00:00:00.999','YYYY-MM-DD HH24:MI:SS.MS')
             

                WHEN ((format = 'DD-MM-YYYY')
                OR (format = 'DD/MM/YYYY'))
                THEN
                
                    to_timestamp(
                    yyyy2 || '-' ||
                    mod2 || '-' ||
                    mod1 || ' 00:00:00.999','YYYY-MM-DD HH24:MI:SS.MS')
            
        END
        INTO modDate ;
        RETURN modDate ;
    END;
$$
LANGUAGE plpgSQL VOLATILE
COST 100;

--
-- FUNCTION TO_NUMBER
--
CREATE OR REPLACE FUNCTION TO_NUMBER(TEXTDATA CHARACTER VARYING) RETURNS NUMERIC AS
$$
    DECLARE 
        DEC_NUM DECIMAL(19);
    BEGIN
        SELECT CAST (TEXTDATA AS DECIMAL) INTO DEC_NUM;
        RETURN DEC_NUM;
    END;
$$
LANGUAGE PLPGSQL VOLATILE
COST 100;


--
-- FUNCTION GET_INT
--
CREATE OR REPLACE FUNCTION GET_INT(TEXTDATA CHARACTER VARYING) RETURNS NUMERIC AS
$$
    DECLARE 
        DEC_NUM DECIMAL(19);
    BEGIN
    
        SELECT CASE
            WHEN TRIM(TRANSLATE(TEXTDATA, '111111111', '234567890')) = REPEAT('1', LENGTH(TRIM(TEXT)))
            THEN
                CAST (TEXTDATA AS DECIMAL)
            ELSE NULL
        END
        
        INTO DEC_NUM;
        RETURN DEC_NUM;
    END;
$$
LANGUAGE PLPGSQL VOLATILE
COST 100;

--
-- FUNCTION NUMBERTOVARCHAR
--
CREATE OR REPLACE FUNCTION NUMBERTOVARCHAR(INVALUE BIGINT) RETURNS TEXT AS
$$
    DECLARE
        STRRESULT TEXT;
    BEGIN
        STRRESULT := '';
        STRRESULT := TO_CHAR(INVALUE,'9999999999999999999'); 
        RETURN STRRESULT;
    END;
$$
LANGUAGE PLPGSQL IMMUTABLE
COST 100;


--
-- FUNCTION INSTRTBL
--
CREATE OR REPLACE FUNCTION INSTRTBL(TEXT) RETURNS TABLE(COL1 TEXT) AS
$$
    SELECT TRIM(VAL) FROM REGEXP_SPLIT_TO_TABLE($1, ',') AS VAL;
$$
LANGUAGE SQL VOLATILE
COST 100;
--
-- FUNCTION CONCAT (3 ARGUMENTS)
--
CREATE OR REPLACE FUNCTION CONCAT(TEXT, TEXT, TEXT) RETURNS TEXT AS
$$
    SELECT TEXTCAT(TEXTCAT($1, $2), $3); 
$$
LANGUAGE SQL VOLATILE
COST 100;

--
-- FUNCTION CONCAT (2 ARGUMENTS)
--
CREATE OR REPLACE FUNCTION CONCAT(TEXT, TEXT) RETURNS TEXT AS
$$
    SELECT  TEXTCAT($1, $2); 
$$
LANGUAGE SQL VOLATILE
COST 100;

--
-- FUNCTION getDelimSharedMultiValue(5 ARGUMENTS)
--

CREATE OR REPLACE FUNCTION getDelimSharedMultiValue(CPRODUCTKEYID BIGINT, CMODVERSION INTEGER, TABLENAME TEXT, CATALOGATTRIBUTEID BIGINT, DELIMETER TEXT)
  RETURNS TEXT AS
$BODY$
DECLARE
QUERY           TEXT;
ROW             RECORD;
COLUMNVALUESET  TEXT;

BEGIN

COLUMNVALUESET := '';  -- initialize it with empty string
QUERY := 'SELECT VALUE FROM ' || TABLENAME  || $$ WHERE CPRODUCTKEYID = '$$ || CPRODUCTKEYID || $$'$$ || $$ AND CMODVERSION = '$$ || CMODVERSION || $$'$$ || $$ AND CATALOGATTRIBUTEID = '$$ || CATALOGATTRIBUTEID || $$'$$;

FOR ROW IN EXECUTE QUERY LOOP

COLUMNVALUESET := COLUMNVALUESET || DELIMETER || ROW.VALUE;

END LOOP;

RETURN COLUMNVALUESET;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
  
--
-- getDelimDateMultiValue (5 ARGUMENTS)
--  
  
CREATE OR REPLACE FUNCTION getDelimDateMultiValue(cproductkeyid bigint, cmodversion integer, tablename text, columnname text, delimeter text)
  RETURNS text AS
$BODY$
DECLARE
QUERY           TEXT;
ROW             RECORD;
TEMP01          TEXT;
COLUMNVALUESET  TEXT;

BEGIN

COLUMNVALUESET := '';  -- initialize it with empty string

QUERY := 'SELECT TO_CHAR('|| COLUMNNAME ||',''YYYY-MM-DD'') FROM ' || TABLENAME  || $$ WHERE CPRODUCTKEYID = '$$ || CPRODUCTKEYID || $$'$$ || $$ AND CMODVERSION = '$$ || CMODVERSION || $$'$$;


FOR ROW IN EXECUTE QUERY LOOP
TEMP01 := ROW;
COLUMNVALUESET := COLUMNVALUESET || DELIMETER || SUBSTR(TEMP01, 2, LENGTH(TEMP01)-2);

END LOOP;

RETURN COLUMNVALUESET;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;  
  
--
-- FUNCTION getDelimMultiValue(5 ARGUMENTS)
--

CREATE OR REPLACE FUNCTION getDelimMultiValue(cproductkeyid bigint, cmodversion integer, tablename text, columnname text, delimeter text)
  RETURNS text AS
$BODY$
DECLARE
QUERY           TEXT;
ROW             RECORD;
TEMP01          TEXT;
COLUMNVALUESET  TEXT;

BEGIN

COLUMNVALUESET := '';  -- initialize it with empty string

QUERY := 'SELECT ' || COLUMNNAME ||' FROM ' || TABLENAME  || $$ WHERE CPRODUCTKEYID = '$$ || CPRODUCTKEYID || $$'$$ || $$ AND CMODVERSION = '$$ || CMODVERSION || $$'$$;


FOR ROW IN EXECUTE QUERY LOOP
TEMP01 := ROW;
COLUMNVALUESET := COLUMNVALUESET || DELIMETER || SUBSTR(TEMP01, 2, LENGTH(TEMP01)-2);

END LOOP;

RETURN COLUMNVALUESET;

END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;


CREATE OR REPLACE FUNCTION ROLLBACK_DBLOADER(pLogID BIGINT, repoID BIGINT, pageSize integer default 10000) RETURNS VOID AS $$
DECLARE
      repo_table_name VARCHAR(80);  
	  deleted_cnt INTEGER := 0;
      productKey_cnt INTEGER := 0;
      goldenCopy_cnt INTEGER := 0;
      mct_cnt INTEGER := 0;
      principalKey_cnt INTEGER := 0;
	  attributes RECORD;
BEGIN

  RAISE NOTICE 'Started...';
  
  EXECUTE 'SELECT tablename FROM catalog WHERE id = $1 LIMIT = 1' INTO repo_table_name USING repoID;
  RAISE NOTICE 'Repo table name : % ', repo_table_name;
  
  /* disable FK */
  BEGIN
	  EXECUTE  'ALTER TABLE MATCHRESULT DROP CONSTRAINT FK_MATCHRESULT_PRODUCTKEY';
	  EXECUTE  'ALTER TABLE MERGERESULT DROP CONSTRAINT FK_MERGERESULT_TARGET_PK';
	  EXECUTE  'ALTER TABLE MERGERESULT DROP CONSTRAINT FK_MERGERESULT_PRODUCTKEY';
	  EXECUTE  'ALTER TABLE METADATAXREF DROP CONSTRAINT R_METADATAXREF99';
	  EXECUTE  'ALTER TABLE RECORDLINKAGE DROP CONSTRAINT FK_RECORDLINKAGE_TARGET_PK';
	  EXECUTE  'ALTER TABLE RECORDLINKAGE DROP CONSTRAINT FK_RECORDLINKAGE_PRODUCTKEY';
	  EXECUTE  'ALTER TABLE RECORDSYNCLOG  DROP CONSTRAINT FK_RECORDSYNCOP_PRODUCTKEY';
	  EXECUTE  'ALTER TABLE ATTRIBUTEHISTORY  DROP CONSTRAINT R_ATTRIBUTEHIST98';
    EXCEPTION
      WHEN OTHERS THEN
        RAISE NOTICE 'ROLLBACK_DBLOADER: Error ignored while disabling foreignkeys.';
  END ;
  
	/* ProductKey */
   DELETE FROM PRODUCTKEY WHERE ID IN (SELECT productkeyid FROM principalkey WHERE processlogid = pLogID); 
   GET DIAGNOSTICS deleted_cnt = ROW_COUNT;
   productKey_cnt := productKey_cnt + deleted_cnt;
   --COMMIT;

	/* GoldenCopy */
   DELETE FROM GOLDENCOPY WHERE PRODUCTKEY IN (SELECT productkeyid FROM principalkey WHERE processlogid = pLogID) ; 
   GET DIAGNOSTICS deleted_cnt = ROW_COUNT;
   goldenCopy_cnt := goldenCopy_cnt + deleted_cnt;
   --COMMIT;

	/* Repository */
   EXECUTE  'delete from '|| repo_table_name ||' WHERE cproductkeyid IN (SELECT productkeyid FROM principalkey WHERE processlogid = $1)'  USING pLogID; 
   GET DIAGNOSTICS deleted_cnt = ROW_COUNT;
   mct_cnt := mct_cnt + deleted_cnt;
   --COMMIT;
   
   /* MV */
   FOR attributes IN
    ( SELECT Distinct CA.TABLENAME FROM CATALOGATTRIBUTE CA 
		WHERE CA.CATALOGID = repoID AND CA.CATALOGVERSIONNUMBER = ( SELECT MAX(MODVERSION) FROM CATALOG WHERE ID = repoID )
			AND CA.ACTIVE = 'Y' AND (CA.FLEXIBLE = 'Y' OR CA.MULTIVALUE ='Y')  
			AND CA.MODVERSION = (SELECT MAX(CA2.MODVERSION) FROM CATALOGATTRIBUTE CA2 WHERE CA2.ID = CA.ID)
	)
    LOOP
		RAISE NOTICE 'MV table name : % ', attributes.TABLENAME;
		EXECUTE  'delete from '|| attributes.TABLENAME ||' WHERE CATALOGID = $1 AND cproductkeyid IN (SELECT productkeyid FROM principalkey WHERE processlogid = $2)' USING repoID, pLogID ; 
    END LOOP;
	
	/* PrincipalKey */
   DELETE FROM principalkey WHERE processlogid = pLogID  ; 
   GET DIAGNOSTICS deleted_cnt = ROW_COUNT;
   principalKey_cnt := principalKey_cnt + deleted_cnt;
   --COMMIT;
  
  /* enable FK */
  BEGIN
	  EXECUTE  'ALTER TABLE MATCHRESULT ADD CONSTRAINT FK_MATCHRESULT_PRODUCTKEY FOREIGN KEY (RECORDID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE MERGERESULT ADD CONSTRAINT FK_MERGERESULT_PRODUCTKEY FOREIGN KEY (SOURCERECORDKEYID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE MERGERESULT ADD CONSTRAINT FK_MERGERESULT_TARGET_PK FOREIGN KEY (TARGETRECORDKEYID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE METADATAXREF ADD CONSTRAINT R_METADATAXREF99 FOREIGN KEY (PRODUCTKEYID) REFERENCES PRODUCTKEY (ID)ON DELETE CASCADE';
	  EXECUTE  'ALTER TABLE RECORDLINKAGE ADD CONSTRAINT FK_RECORDLINKAGE_PRODUCTKEY FOREIGN KEY (SOURCERECORDKEYID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE RECORDLINKAGE ADD CONSTRAINT FK_RECORDLINKAGE_TARGET_PK FOREIGN KEY (TARGETRECORDKEYID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE RECORDSYNCLOG ADD CONSTRAINT FK_RECORDSYNCOP_PRODUCTKEY FOREIGN KEY (PRODUCTKEYID) REFERENCES PRODUCTKEY (ID)';
	  EXECUTE  'ALTER TABLE ATTRIBUTEHISTORY ADD CONSTRAINT R_ATTRIBUTEHIST98 FOREIGN KEY (CATALOGID, PRODUCTKEYID, MODVERSION) REFERENCES PRINCIPALKEY (CATALOGID, PRODUCTKEYID, MODVERSION)';

    EXCEPTION
      WHEN OTHERS THEN
        RAISE NOTICE 'ROLLBACK_DBLOADER: Error ignored while enabling foreignkeys. Enable it manually.';
  END ;
  
  RAISE NOTICE 'PRODUCTKEY ROWS DELETED: %', productKey_cnt ;
  RAISE NOTICE 'GOLDENCOPY ROWS DELETED: %', goldenCopy_cnt ;
  RAISE NOTICE 'REPOSITORY ROWS DELETED: %', mct_cnt ;
  RAISE NOTICE 'PRINCIPALKEY ROWS DELETED: %', principalKey_cnt ;
  
  RAISE NOTICE'Completed. ';
END; $$ LANGUAGE plpgsql VOLATILE
COST 100;  
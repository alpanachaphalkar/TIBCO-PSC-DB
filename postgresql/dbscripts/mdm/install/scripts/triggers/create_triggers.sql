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
-- Definition for FUNCTION TD_MEMBER: TRIGGER TD_MEMBER
--
CREATE OR REPLACE FUNCTION TD_MEMBER() RETURNS TRIGGER AS
$BODY$
    BEGIN 
        INSERT INTO MEMBERHISTORY (ID, ENTERPRISEID, DOMAIN, USERNAME,
        LASTNAME, FIRSTNAME, MIDDLENAME, SECURITYTYPE, SECURITY,
        DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION,
        DELEGATIONACTIVE, DELEGATIONSTARTDATE, DELEGATIONENDDATE,
        NOTIFYOFDELEGATION, AUTOREVERTFLAG, LOCALE, LANGUAGE, PARTITIONKEY)
    VALUES
        (OLD.ID, OLD.ENTERPRISEID, OLD.DOMAIN, OLD.USERNAME,
        OLD.LASTNAME, OLD.FIRSTNAME, OLD.MIDDLENAME, OLD.SECURITYTYPE, OLD.SECURITY,
        OLD.DESCRIPTION,'N', OLD.MODMEMBERID, CURRENT_TIMESTAMP, OLD.MODVERSION,
        OLD.DELEGATIONACTIVE, OLD.DELEGATIONSTARTDATE, OLD.DELEGATIONENDDATE,
        OLD.NOTIFYOFDELEGATION, OLD.AUTOREVERTFLAG, OLD.LOCALE, OLD.LANGUAGE, OLD.PARTITIONKEY);
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100; 

CREATE  TRIGGER TD_MEMBER AFTER DELETE ON MEMBER FOR EACH ROW EXECUTE PROCEDURE TD_MEMBER();

--
-- Definition for FUNCTION TI_CATALOG: TRIGGER TI_CATALOG
--
CREATE OR REPLACE FUNCTION TI_CATALOG() RETURNS TRIGGER AS 
$BODY$
DECLARE
TEMP INTEGER;
BEGIN
    IF (NEW.modVersion = 1)
    THEN
        INSERT INTO CatalogInputMap
            (SOURCEORGANIZATIONID, CATALOGID, ID, NAME, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION )
        SELECT
            NEW.SOURCEORGANIZATIONID, NEW.ID, NEXTVAL('MQ_SEQUENCE_1'),
            'DEFAULT', 'Default Input Map', NEW.ACTIVE, NEW.MODMEMBERID, NEW.MODDATE, NEW.MODVERSION ;
    END IF;

    IF (NEW.ACTIVE='N' )
    THEN
        UPDATE CATALOGINPUTMAP SET ACTIVE = 'N' WHERE CATALOGID = NEW.ID;
        UPDATE SUBCATALOG SET ACTIVE = 'N' WHERE CATALOGID = NEW.ID;
        UPDATE CLASSIFICATIONSCHEME SET ACTIVE= 'N' 
            WHERE 
            ID IN (SELECT IDVALUE FROM DOMAINVALUE 
                   WHERE DOMAINTYPE='MASTERCATALOGASSOCIATION'
                   AND DOMAINVALUE='CLASSIFICATION'
                   AND SYSTEMGENERATED = 'N' 
                   AND OWNERID = NEW.ID);
        DELETE FROM DOMAINVALUE WHERE DOMAINTYPE='MASTERCATALOGASSOCIATION' AND OWNERID=NEW.ID;
    END IF;
    RETURN NEW ;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE 
COST 100;

CREATE  TRIGGER TI_CATALOG AFTER INSERT ON CATALOG FOR EACH ROW EXECUTE PROCEDURE TI_CATALOG();

--
-- Definition for FUNCTION TI_CATALOGATTR: TRIGGER TI_CATALOGATTR
--
CREATE OR REPLACE FUNCTION TI_CATALOGATTR() RETURNS TRIGGER AS
$BODY$
BEGIN
    IF NEW.MODVERSION = 1
    THEN
        INSERT INTO  CATALOGINPUTMAPATTRIBUTE
            (SOURCEORGANIZATIONID, CATALOGID, CATALOGINPUTMAPID,
            CATALOGATTRIBUTEID, SOURCEEXPRESSION, CATALOGINPUTMAPVERSION)
        SELECT
            NEW.SOURCEORGANIZATIONID, NEW.CATALOGID, CIM.ID, NEW.ID, NULL, CIM.MODVERSION
            FROM
                CATALOGINPUTMAP CIM 
            WHERE 
                CIM.CATALOGID = NEW.CATALOGID
            AND
                CIM.MODVERSION = (SELECT MAX(CIM2.MODVERSION) FROM CATALOGINPUTMAP CIM2 WHERE CIM2.ID = CIM.ID);
    END IF;
    RETURN NEW; 
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_CATALOGATTR  AFTER INSERT  ON catalogattribute  FOR EACH ROW  EXECUTE PROCEDURE TI_CATALOGATTR();

--
-- Definition for FUNCTION TI_CATALOG: TRIGGER TI_CATALOG
--
CREATE OR REPLACE FUNCTION TI_CATALOGINPUTMAP()
RETURNS TRIGGER AS
$BODY$
    DECLARE numrows INTEGER;
BEGIN

    IF (NEW.MODVERSION = 1)
    THEN
        INSERT INTO  CATALOGINPUTMAPATTRIBUTE
            (SOURCEORGANIZATIONID, CATALOGID, CATALOGINPUTMAPID,
            CATALOGATTRIBUTEID, SOURCEEXPRESSION, CATALOGINPUTMAPVERSION)
        SELECT 
            NEW.SOURCEORGANIZATIONID, NEW.CATALOGID, NEW.ID, CA.ID, NULL, NEW.MODVERSION
            FROM
                CATALOGATTRIBUTE CA
            WHERE CA.CATALOGID = NEW.CATALOGID
            AND CA.CATALOGVERSIONNUMBER = (SELECT MAX(CATALOGVERSIONNUMBER) FROM CATALOGATTRIBUTE WHERE CATALOGID= NEW.CATALOGID);
    END IF;
    RETURN NEW ;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE  TRIGGER TI_CATALOGINPUTMAP AFTER INSERT ON CATALOGINPUTMAP FOR EACH ROW EXECUTE PROCEDURE TI_CATALOGINPUTMAP();

--
-- Definition for FUNCTION TI_MEMBER: TRIGGER TI_MEMBER
--
CREATE OR REPLACE FUNCTION TI_MEMBER()
RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO  MEMBERHISTORY 
            (ID , ENTERPRISEID, DOMAIN, USERNAME, LASTNAME, FIRSTNAME, 
            MIDDLENAME, SECURITYTYPE, SECURITY, DESCRIPTION, ACTIVE, MODMEMBERID,
            MODDATE, MODVERSION, DELEGATIONACTIVE, DELEGATIONSTARTDATE, DELEGATIONENDDATE,
            NOTIFYOFDELEGATION, AUTOREVERTFLAG, LOCALE, LANGUAGE, PARTITIONKEY)
        VALUES
            (NEW.ID, NEW.ENTERPRISEID, NEW.DOMAIN, NEW.USERNAME, NEW.LASTNAME, NEW.FIRSTNAME,
            NEW.MIDDLENAME, NEW.SECURITYTYPE, NEW.SECURITY, NEW.DESCRIPTION,
            NEW.ACTIVE, NEW.MODMEMBERID, NEW.MODDATE, NEW.MODVERSION, NEW.DELEGATIONACTIVE,
            NEW.DELEGATIONSTARTDATE, NEW.DELEGATIONENDDATE, NEW.NOTIFYOFDELEGATION, 
            NEW.AUTOREVERTFLAG, NEW.LOCALE, NEW.LANGUAGE, NEW.PARTITIONKEY);
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_MEMBER AFTER INSERT OR UPDATE ON MEMBER FOR EACH ROW EXECUTE PROCEDURE TI_MEMBER();
 
--
-- Definition for FUNCTION TI_ROLEASSIGNMENT: TRIGGER TI_ROLEASSIGNMENT
--
CREATE OR REPLACE FUNCTION TI_ROLEASSIGNMENT()
RETURNS TRIGGER AS
$BODY$
BEGIN
    INSERT INTO ROLEASSIGHISTORY
            (ROLEID , MEMBERID , MODDATE , MODMEMBERID, MEMBERVERSION)
        VALUES 
            (NEW.ROLEID, NEW.MEMBERID, NEW.MODDATE, NEW.MODMEMBERID,NEW.MEMBERVERSION);
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_ROLEASSIGNMENT AFTER INSERT OR UPDATE ON ROLEASSIGNMENT  FOR EACH ROW EXECUTE PROCEDURE TI_ROLEASSIGNMENT();

--
-- Definition for FUNCTION TI_ORGANIZATION: TRIGGER TI_ORGANIZATION
--
CREATE OR REPLACE FUNCTION TI_ORGANIZATION()
  RETURNS TRIGGER AS
$BODY$
    DECLARE
        NUMROWS INTEGER;
        TEMP2   NUMERIC (20,0);
BEGIN
    SELECT NEW.ID INTO TEMP2;
    INSERT INTO DOMAINVALUE
        (DOMAINTYPE, DOMAINVALUE, SEQUENCE, OWNERID)
        (SELECT DOMAINTYPE, DOMAINVALUE, 1, TEMP2 
            FROM DOMAINVALUE
            WHERE  DOMAINTYPE = 'CREDENTIALCONSTRAINTS'
            AND OWNERID IN (SELECT IDVALUE  FROM DOMAINVALUE WHERE DOMAINVALUE = UPPER(NEW.TYPE) AND DOMAINTYPE='ORGTYPE')
        );
  RETURN NEW;
END; 
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_ORGANIZATION AFTER INSERT ON ORGANIZATION  FOR EACH ROW execute procedure TI_ORGANIZATION();


--
-- Definition for FUNCTION TI_RESOURCEACL: TRIGGER TI_RESOURCEACL
--
CREATE OR REPLACE FUNCTION TI_RESOURCEACL() RETURNS TRIGGER AS 
$BODY$
BEGIN
    INSERT INTO RESOURCEACLHISTORY
        (RESOURCEID, GRANTEEID, GRANTEETYPE, RESOURCETYPE, RESACCESS, ENTERPRISEID, ALLOW,
        ACTIVE, MODDATE, MODMEMBERID)
    VALUES
        (NEW.RESOURCEID, NEW.GRANTEEID, NEW.GRANTEETYPE, NEW.RESOURCETYPE, NEW.RESACCESS,
        NEW.ENTERPRISEID, NEW.ALLOW, NEW.ACTIVE, NEW.MODDATE, NEW.MODMEMBERID);
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_RESOURCEACL AFTER INSERT OR UPDATE ON RESOURCEACL  FOR EACH ROW EXECUTE PROCEDURE TI_RESOURCEACL();


--
-- Definition for FUNCTION TU_ADDRESS: TRIGGER TU_ADDRESS
--
CREATE OR REPLACE FUNCTION TU_ADDRESS() RETURNS TRIGGER AS 
$BODY$
BEGIN
    DELETE FROM DOMAINVALUE WHERE ADDRESSID = OLD.ID AND NEW.ACTIVE='N' OR NEW.ACTIVE='n';
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_ADDRESS AFTER UPDATE ON ADDRESS FOR EACH ROW execute procedure TU_ADDRESS();

--
-- Definition for FUNCTION TU_EMAIL: TRIGGER TU_EMAIL
--
CREATE OR REPLACE FUNCTION TU_EMAIL() RETURNS TRIGGER AS 
$BODY$
BEGIN
    DELETE FROM DOMAINVALUE WHERE EMAILID=OLD.ID AND NEW.ACTIVE='N' OR NEW.ACTIVE='n';
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_EMAIL AFTER UPDATE ON EMAIL FOR EACH ROW EXECUTE PROCEDURE TU_EMAIL();

--
-- Definition for FUNCTION TU_FTP: TRIGGER TU_FTP
--
CREATE OR REPLACE FUNCTION TU_FTP() RETURNS TRIGGER AS
$BODY$
BEGIN
    DELETE FROM DOMAINVALUE WHERE FTPID=OLD.ID AND NEW.ACTIVE='N' OR NEW.ACTIVE='n';
    RETURN NEW ;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_FTP AFTER UPDATE ON FTP FOR EACH ROW EXECUTE PROCEDURE TU_FTP();

--
-- Definition for FUNCTION TU_HTTP: TRIGGER TU_HTTP
--
CREATE OR REPLACE FUNCTION TU_HTTP() RETURNS TRIGGER AS 
$BODY$
BEGIN
    DELETE FROM DOMAINVALUE WHERE HTTPID=OLD.ID AND NEW.ACTIVE='N' OR NEW.ACTIVE='n';
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_HTTP AFTER UPDATE ON HTTP FOR EACH ROW EXECUTE PROCEDURE TU_HTTP(); 

--
-- Definition for FUNCTION TU_MEMBER: TRIGGER TU_MEMBER
--
CREATE OR REPLACE FUNCTION TU_MEMBER() RETURNS TRIGGER AS
$BODY$
BEGIN
IF NEW.ACTIVE='N' THEN
    UPDATE PHONENUMBER SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE EMAIL SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE FTP SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE HTTP SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE ADDRESS SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_MEMBER AFTER UPDATE ON MEMBER FOR EACH ROW EXECUTE PROCEDURE TU_MEMBER();


--
-- Definition for FUNCTION TU_ORGANIZATION: TRIGGER TU_ORGANIZATION
--
CREATE OR REPLACE FUNCTION TU_ORGANIZATION() RETURNS TRIGGER  AS 
$BODY$
BEGIN
IF new.active='N'  THEN
    UPDATE PHONENUMBER SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE EMAIL SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE FTP SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE HTTP SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE ADDRESS SET ACTIVE='N' WHERE OWNERID=NEW.ID AND ACTIVE='Y';
    UPDATE MEMBER SET ACTIVE='N' WHERE ACTIVE='Y' AND ID IN (SELECT MEMBERID FROM MEMBERSHIP WHERE ORGANIZATIONID = NEW.ID);
    UPDATE RULEMODEL SET ACTIVE='N' WHERE ACTIVE='Y' AND ORGANIZATIONID = NEW.ID;
    UPDATE RULEMETAMODEL SET ACTIVE='N' WHERE ACTIVE='Y' AND ORGANIZATIONID = NEW.ID;
END IF;
RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_ORGANIZATION AFTER UPDATE ON ORGANIZATION FOR EACH ROW EXECUTE PROCEDURE TU_ORGANIZATION();

--
-- Definition for FUNCTION TU_PHONENUMBER: TRIGGER TU_PHONENUMBER
--
CREATE OR REPLACE FUNCTION TU_PHONENUMBER() RETURNS TRIGGER AS
$BODY$
BEGIN
    DELETE FROM DOMAINVALUE WHERE PHONENUMBERID=OLD.ID AND NEW.ACTIVE='N' OR NEW.ACTIVE='n';
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TU_PHONENUMBER AFTER UPDATE ON PHONENUMBER FOR EACH ROW execute procedure TU_PHONENUMBER();


--
-- Definition for FUNCTION TI_SUPPLIERSTATE: TRIGGER TI_SUPPLIERSTATE
--
CREATE OR REPLACE FUNCTION TI_SUPPLIERSTATE() RETURNS TRIGGER AS
$BODY$
    DECLARE
        TEMP    numeric (20,0);
        TEMP1   numeric (20,0);
        TEMP2   numeric (20,0);
        SUPPLIERSTATE_REC record ;
        SUPPLIERSTATETRANSITION_REC record;
        
        C1 CURSOR FOR SELECT ID, ENTERPRISEID, NAME, MODMEMBER, MODDATE, MODVERSION 
            FROM 
                SUPPLIERSTATE SEEDSS 
            WHERE SEEDSS.ENTERPRISEID = 0;
        
        C2 CURSOR for SELECT  NEWFROM.ID NEWFROM, NEWTO.ID NEWTO, NEWFROM.ENTERPRISEID EID 
            FROM 
                SUPPLIERSTATETRANSITION SEEDSST, SUPPLIERSTATE SEEDFROM, SUPPLIERSTATE SEEDTO,
                SUPPLIERSTATE NEWFROM, SUPPLIERSTATE NEWTO
            WHERE SEEDSST.FROMSTATEID = SEEDFROM.ID
                AND SEEDFROM.NAME = NEWFROM.NAME
                AND SEEDSST.TOSTATEID = SEEDTO.ID
                AND SEEDTO.NAME = NEWTO.NAME
                AND SEEDFROM.ENTERPRISEID = 0
                AND SEEDTO.ENTERPRISEID = 0
                AND NEWFROM.ENTERPRISEID = TEMP2
                AND NEWTO.ENTERPRISEID = TEMP2;
BEGIN
    SELECT NEW.ID INTO TEMP1 ;
    SELECT NEW.ID INTO TEMP2;
    OPEN C1;
    LOOP
        SELECT NEXTVAL('MQ_SEQUENCE_1') INTO TEMP;
        FETCH C1 INTO SUPPLIERSTATE_REC;
        EXIT WHEN NOT FOUND;
        INSERT INTO SUPPLIERSTATE VALUES (TEMP, TEMP1, SUPPLIERSTATE_REC.NAME, 101, CURRENT_TIMESTAMP, 1 );
    END LOOP;
    CLOSE C1;
    OPEN C2;

    LOOP
        SELECT NEXTVAL('MQ_SEQUENCE_1') INTO TEMP FROM DUAL;
        FETCH C2 INTO SUPPLIERSTATETRANSITION_REC;
        EXIT WHEN NOT FOUND;
        INSERT INTO SUPPLIERSTATETRANSITION ( ENTERPRISEID, FROMSTATEID, TOSTATEID, MODMEMBER, MODDATE, MODVERSION )
            VALUES ( SUPPLIERSTATETRANSITION_REC.EID, SUPPLIERSTATETRANSITION_REC.NEWFROM, SUPPLIERSTATETRANSITION_REC.NEWTO,
            101, CURRENT_TIMESTAMP, 1 );
    END LOOP;
    CLOSE C2;
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

CREATE TRIGGER TI_SUPPLIERSTATE AFTER INSERT ON ENTERPRISE FOR EACH ROW EXECUTE PROCEDURE TI_SUPPLIERSTATE();


-- Definition for FUNCTION TI_CLASSIFICATIONINPUTMAP: TRIGGER TI_CLASSIFICATIONINPUTMAP
CREATE OR REPLACE FUNCTION TI_CLASSIFICATIONINPUTMAP() RETURNS TRIGGER AS
$BODY$
    DECLARE numrows INTEGER;
BEGIN

    IF (NEW.MODVERSION = 1)
    THEN
        INSERT INTO  CLASSIFICATIONINPUTMAPLEVEL
            (SOURCEORGANIZATIONID, CLASSIFICATIONSCHEMEID, CLASSIFICATIONINPUTMAPID,
            LEVELPOSITION, SOURCEEXPRESSION, CLASSIFICATIONINPUTMAPVERSION)
        SELECT 
            NEW.SOURCEORGANIZATIONID, NEW.CLASSIFICATIONSCHEMEID, NEW.ID, CL.POSITION, NULL, NEW.MODVERSION
            FROM
                CLASSIFICATIONLOGICALLEVEL CL
            WHERE CL.CLASSIFICATIONSCHEMEID = NEW.CLASSIFICATIONSCHEMEID
            AND CL.CSVERSIONNUMBER = (SELECT MAX(CSVERSIONNUMBER) FROM CLASSIFICATIONLOGICALLEVEL WHERE CLASSIFICATIONSCHEMEID= NEW.CLASSIFICATIONSCHEMEID);
    END IF;
    RETURN NEW ;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

-- Definition for TRIGGER TI_CLASSIFICATIONINPUTMAP
CREATE TRIGGER TI_CLASSIFICATIONINPUTMAP AFTER INSERT ON CLASSIFICATIONINPUTMAP FOR EACH ROW EXECUTE PROCEDURE TI_CLASSIFICATIONINPUTMAP();

-- Definition for FUNCTION TI_CLASSIFICATIONLOGICALLEVEL: TRIGGER TI_CLASSIFICATIONLOGICALLEVEL
CREATE OR REPLACE FUNCTION TI_CLASSIFICATIONLOGICALLEVEL() RETURNS TRIGGER AS
$BODY$
    DECLARE numrows INTEGER;
BEGIN

    IF (NEW.CSVERSIONNUMBER = 1)
    THEN
        INSERT INTO  CLASSIFICATIONINPUTMAPLEVEL
            (SOURCEORGANIZATIONID, CLASSIFICATIONSCHEMEID, CLASSIFICATIONINPUTMAPID,
            LEVELPOSITION, SOURCEEXPRESSION, CLASSIFICATIONINPUTMAPVERSION)
        SELECT 
            CSINPUTMAP.SOURCEORGANIZATIONID, NEW.CLASSIFICATIONSCHEMEID, CSINPUTMAP.ID, NEW.POSITION, NULL, CSINPUTMAP.MODVERSION
            FROM 
			    CLASSIFICATIONINPUTMAP CSINPUTMAP
					 WHERE   CSINPUTMAP.CLASSIFICATIONSCHEMEID= NEW.CLASSIFICATIONSCHEMEID
					 AND CSINPUTMAP.MODVERSION = (SELECT max(CSINPUTMAP2.MODVERSION) FROM CLASSIFICATIONINPUTMAP CSINPUTMAP2
							WHERE CSINPUTMAP2.ID = CSINPUTMAP.ID) ;
    END IF;
    RETURN NEW ;
END;
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100;

-- Definition for TRIGGER TI_CLASSIFICATIONLOGICALLEVEL
CREATE TRIGGER TI_CLASSIFICATIONLOGICALLEVEL AFTER INSERT ON CLASSIFICATIONLOGICALLEVEL FOR EACH ROW EXECUTE PROCEDURE TI_CLASSIFICATIONLOGICALLEVEL();

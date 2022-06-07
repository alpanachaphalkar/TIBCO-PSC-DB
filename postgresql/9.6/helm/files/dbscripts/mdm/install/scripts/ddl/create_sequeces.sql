-- Copyright (c) 2014 TIBCO Software Inc. All Rights Reserved.

--  This work is subject  to  U.S. and  international  copyright  laws  and
--     treaties. No part  of  this  work may be  used,  practiced,  performed
--     copied, distributed, revised, modified, translated,  abridged, condensed,
--     expanded,  collected,  compiled,  linked,  recast, transformed or adapted
--     without the prior written consent of TIBCO Software Inc. any use or
--     exploitation of this work without authorization could subject the
--     perpetrator to criminal and civil liability.
--
CREATE SEQUENCE MQ_ACTIVITYRESULT_SEQ
  INCREMENT BY 100
  START WITH 1
  CYCLE ;

--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('MQ_ACTIVITYRESULT_SEQ');

--
-- Definition for SEQUENCE MQ_ATTRIBUTEGROUP_1:
--
CREATE SEQUENCE MQ_ATTRIBUTEGROUP_1
  INCREMENT BY 1
  START WITH 10000
  NO CYCLE ;

SELECT NEXTVAL('MQ_ATTRIBUTEGROUP_1');

--
-- Definition for SEQUENCE MQ_SEQUENCE_1:
--
CREATE SEQUENCE MQ_SEQUENCE_1
  INCREMENT BY 1
  START WITH 34000
  NO CYCLE
  CACHE 20;

SELECT NEXTVAL('MQ_SEQUENCE_1');

--
-- Definition for SEQUENCE MQ_SEQUENCE_2:
--
CREATE SEQUENCE MQ_SEQUENCE_2
  INCREMENT BY 1
  START WITH 34000
  NO CYCLE
  CACHE 1000;

SELECT NEXTVAL('MQ_SEQUENCE_2');

--
-- Definition for SEQUENCE MQ_SEQUENCE_CATALOG:
--
CREATE SEQUENCE MQ_SEQUENCE_CATALOG
  INCREMENT BY 1
  START WITH 32000
  NO CYCLE
  CACHE 20;

SELECT NEXTVAL('MQ_SEQUENCE_CATALOG');

--
-- Definition for SEQUENCE MQ_SEQUENCE_RELATIONSHIP:
--
CREATE SEQUENCE MQ_SEQUENCE_RELATIONSHIP
  INCREMENT BY 1
  START WITH 12000
  NO CYCLE
  CACHE 500 ;

--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('MQ_SEQUENCE_RELATIONSHIP');

--
-- Definition for SEQUENCE MQ_SEQUENCE_RELATIONSHIPDEF:
--
CREATE SEQUENCE MQ_SEQUENCE_RELATIONSHIPDEF
  INCREMENT BY 1
  START WITH 10000
  NO CYCLE;

SELECT NEXTVAL('MQ_SEQUENCE_RELATIONSHIPDEF');
--
-- Definition for SEQUENCE MQ_SEQUENCE_TAXONOMY:
--
CREATE SEQUENCE MQ_SEQUENCE_TAXONOMY
  INCREMENT BY 100
  START WITH 37000
  NO CYCLE ;

--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('MQ_SEQUENCE_TAXONOMY');

--
-- Definition for SEQUENCE PROCESS_SEQ:
--
CREATE SEQUENCE PROCESS_SEQ
  INCREMENT BY 50
  START WITH 12000
  NO CYCLE ;

SELECT NEXTVAL('PROCESS_SEQ');

--
-- Definition for SEQUENCE PROCESSLOG_SEQ:
--
CREATE SEQUENCE PROCESSLOG_SEQ
  INCREMENT BY 100
  START WITH 12000
  NO CYCLE ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('PROCESSLOG_SEQ');

--
-- Definition for SEQUENCE PRODUCT_SEQ:
--
CREATE SEQUENCE PRODUCT_SEQ
  INCREMENT BY 1
  START WITH 10000
  NO CYCLE
  CACHE 100 ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('PRODUCT_SEQ');

--
-- Definition for SEQUENCE DOCUMENT_SEQ:
--
CREATE SEQUENCE DOCUMENT_SEQ
  INCREMENT BY 100
  START WITH 34000
  NO CYCLE ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('DOCUMENT_SEQ');

--
-- Definition for SEQUENCE CONVERSATION_SEQ:
--
CREATE SEQUENCE CONVERSATION_SEQ
  INCREMENT BY 100
  START WITH 1
  NO CYCLE ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('CONVERSATION_SEQ');

--
-- Definition for SEQUENCE DQ_SEQ:
--
CREATE SEQUENCE DQ_SEQ
  INCREMENT BY 100
  START WITH 1
  CYCLE ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('DQ_SEQ');  


--
-- Definition for SEQUENCE RULE_SEQ:
--
CREATE SEQUENCE RULE_SEQ
  INCREMENT BY 50
  START WITH 34000
  NO CYCLE ;
--
-- Get Next value for sequence. Important for sequence utility
--
SELECT NEXTVAL('RULE_SEQ');  

--
--Definition for SEQUENCE MQ_SEQUENCE_PERSPECTIVE 
--
CREATE SEQUENCE MQ_SEQUENCE_PERSPECTIVE
    INCREMENT BY 1
    START WITH 1000
    NO CYCLE ;

SELECT NEXTVAL('MQ_SEQUENCE_PERSPECTIVE');

CREATE SEQUENCE SEQ_CLASSIFICATION_DEPLOY
    INCREMENT BY 50
    START WITH 1000
    NO CYCLE ;

SELECT NEXTVAL('SEQ_CLASSIFICATION_DEPLOY');

-- Sequence for ID of Document store
CREATE SEQUENCE SEQ_DOCUMENTSTORE
        INCREMENT BY 100
        START WITH 1
        NO CYCLE ;

SELECT NEXTVAL('SEQ_DOCUMENTSTORE');

-- Sequence for ID of temp ID assigned to relationship record during staging
CREATE SEQUENCE SEQ_TEMPRELRECORD
        INCREMENT BY 500
        START WITH 1
        CYCLE ;

SELECT NEXTVAL('SEQ_TEMPRELRECORD');
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

BEGIN TRANSACTION;
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (4, 'PROCESSNAME', 1, 'Y', 'wfin26productaddapprovalv3.xml', 'WORKFLOW', 'New record introduction process', 'File', 'standard/workflow/wfin26productaddapprovalv3.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (5, 'PROCESSNAME', 1, 'Y', 'wfin26purgev3.xml', 'WORKFLOW', 'Process to purge historical data and old record versions', 'File', 'standard/workflow/wfin26purgev3.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (6, 'PROCESSNAME', 1, 'Y', 'wfin26catsynchv7.xml', 'WORKFLOW', 'Synchronization process', 'File', 'standard/workflow/wfin26catsynchv7.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (7, 'PROCESSNAME', 1, 'Y', 'wfin26BackEndIntegrationV1_Sample2.xml', 'WORKFLOW', 'Back end integration process - Sample 2', 'File', 'standard/workflow/wfin26BackEndIntegrationV1_Sample2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (8, 'PROCESSNAME', 1, 'Y', 'wfin26BackEndIntegrationV1_Sample1.xml', 'WORKFLOW', 'Back end integration process - Sample 1', 'File', 'standard/workflow/wfin26BackEndIntegrationV1_Sample1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (9, 'PROCESSNAME', 1, 'Y', 'wfin26catactionv2.xml', 'WORKFLOW', 'Process for Record Synchronization for retailers', 'File', 'standard/workflow/wfin26catactionv2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (10, 'PROCESSNAME', 1, 'Y', 'wfin26catsourceimportv2.xml', 'WORKFLOW', 'Import sub process', 'File', 'standard/workflow/wfin26catsourceimportv2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (11, 'PROCESSNAME', 1, 'Y', 'wfin26productfactsheetpdfv2.xml', 'WORKFLOW', 'Sample workflow for generation of PDF data sheets', 'File', 'standard/workflow/wfin26productfactsheetpdfv2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (12, 'PROCESSNAME', 1, 'Y', 'wfin26producteditapprovalv3.xml', 'WORKFLOW', 'Process for approval of modified or deleted records', 'File', 'standard/workflow/wfin26producteditapprovalv3.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (13, 'PROCESSNAME', 1, 'Y', 'wfin26catmassupdatev1.xml', 'WORKFLOW', 'Process for Mass Update of repository', 'File', 'standard/workflow/wfin26catmassupdatev1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (14, 'PROCESSNAME', 1, 'Y', 'wfin24classimpv2.xml', 'WORKFLOW', 'Process for Classification Import', 'File', 'standard/workflow/wfin24classimpv2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (15, 'PROCESSNAME', 1, 'Y', 'wfin26catsourcev7.xml', 'WORKFLOW', 'Process for data source upload and import', 'File', 'standard/workflow/wfin26catsourcev7.xml', 'Y', 1, '2016-12-01 10:00:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (16, 'PROCESSNAME', 1, 'Y', 'wfin26catsynchdbdumpv4.xml', 'WORKFLOW', 'Process extract repository data', 'File', 'standard/workflow/wfin26catsynchdbdumpv4.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (17, 'PROCESSNAME', 1, 'Y', 'cancelworkflowv1.xml', 'WORKFLOW', 'Sub process for event cancellation', 'File', 'standard/workflow/cancelworkflowv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (18, 'PROCESSNAME', 1, 'Y', 'wfin26dataservicev2.xml', 'WORKFLOW', 'Process for extraction/Import of meta data', 'File', 'standard/workflow/wfin26dataservicev2.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (19, 'PROCESSNAME', 1, 'Y', 'wfin26dqproductaddapprovalv1.xml', 'WORKFLOW', 'New record introduction process with DQ', 'File', 'standard/workflow/wfin26dqproductaddapprovalv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (20, 'PROCESSNAME', 1, 'Y', 'wfin26dqcatsourcev1.xml', 'WORKFLOW', 'Process for data source upload and import with DQ', 'File', 'standard/workflow/wfin26dqcatsourcev1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (35, 'PROCESSNAME', 1, 'Y', 'wfin26dqscheduleddedupv1.xml', 'WORKFLOW', 'Scheduled de-duplication process', 'File', 'standard/workflow/wfin26dqscheduleddedupv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (36, 'FORM', 1, 'Y', 'fm26ca.xml', 'WORKFLOW', 'Form for record workitem fields', 'File', 'standard/forms/fm26ca.xml', 'Y', 1, '2010-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (37, 'FORM', 1, 'Y', 'fm26catpubtemplatev1.xml', 'WORKFLOW', 'Form for synchronization spawn', 'File', 'standard/forms/fm26catpubtemplatev1.xml', 'Y', 1, '2010-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (38, 'FORM', 1, 'Y', 'fm26importtemplatev1.xml', 'WORKFLOW', 'Form for import record spawn', 'File', 'standard/forms/fm26importtemplatev1.xml', 'Y', 1, '2010-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (39, 'FORM', 1, 'Y', 'fmretailer.xml', 'WORKFLOW', 'Form for retailer workitems', 'File', 'standard/forms/fmretailer.xml', 'Y', 1, '2010-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (40, 'PROCESSNAME', 1, 'Y', 'wfin26catsynchdbdumpv4_incremental.xml', 'WORKFLOW', 'Process extract repository data incrementally', 'File', 'standard/workflow/wfin26catsynchdbdumpv4_incremental.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (41, 'PROCESSNAME', 1, 'Y', 'wfin26productcorrectv1.xml', 'WORKFLOW', 'Record correction process', 'File', 'standard/workflow/wfin26productcorrectv1.xml', 'Y', 1, '2014-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (71, 'MAP', 1, 'Y', 'mp26importto26cateditadd.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mp26importto26cateditadd.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (72, 'MAP', 1, 'Y', 'mp26importto26cateditchange.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mp26importto26cateditchange.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (73, 'MAP', 1, 'Y', 'mp26importto26cateditdelete.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mp26importto26cateditdelete.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (74, 'MAP', 1, 'Y', 'mpfrom26topdfprodspecv1.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfrom26topdfprodspecv1.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (75, 'MAP', 1, 'Y', 'mpfromebxml21envelopetomlxml_Sample1.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromebxml21envelopetomlxml_Sample1.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (76, 'MAP', 1, 'Y', 'mpfromebxml21envelopetomlxml_Sample2.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromebxml21envelopetomlxml_Sample2.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (77, 'MAP', 1, 'Y', 'mpfromebxml21envelopetounknown.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromebxml21envelopetounknown.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (78, 'MAP', 1, 'Y', 'mpfromebxml21envelopetounknownxml.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromebxml21envelopetounknownxml.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (79, 'MAP', 1, 'Y', 'mpfromebxml21totransportevent.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromebxml21totransportevent.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (80, 'MAP', 1, 'Y', 'mpfromunknowntoebxml21envelope.xsl', 'WORKFLOW', '', 'File', 'standard/maps/mpfromunknowntoebxml21envelope.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (81, 'MAP', 1, 'Y', 'Native80ToNew80MetaDataConverter.xsl', 'WORKFLOW', '', 'File', 'standard/maps/Native80ToNew80MetaDataConverter.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (82, 'MAP', 1, 'Y', 'New80ToNative80MetaDataConverter.xsl', 'WORKFLOW', '', 'File', 'standard/maps/New80ToNative80MetaDataConverter.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (83, 'MAP', 1, 'Y', 'xpdl2Tocim.xsl', 'WORKFLOW', '', 'File', 'standard/maps/xpdl2Tocim.xsl', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (100, 'Rulebase', 1, 'Y', 'allowAttrList.xml', 'CUSTOM', '', 'File', 'standard/rulebase/allowAttrList.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (101, 'Rulebase', 1, 'Y', 'DisplayAttrList.xml', 'CUSTOM', '', 'File', 'standard/rulebase/DisplayAttrList.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (102, 'Rulebase', 1, 'Y', 'MatchAttrList.xml', 'CUSTOM', '', 'File', 'standard/rulebase/MatchAttrList.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (103, 'Rulebase', 1, 'Y', 'rbconnectorprotocolderivation.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbconnectorprotocolderivation.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (104, 'Rulebase', 1, 'Y', 'rbdefault.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbdefault.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (105, 'Rulebase', 1, 'Y', 'rbexpirydate.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbexpirydate.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (106, 'Rulebase', 1, 'Y', 'rbformatattributes.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbformatattributes.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (107, 'Rulebase', 1, 'Y', 'rbgenerateid.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbgenerateid.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (108, 'Rulebase', 1, 'Y', 'rbmessageprocessorderivation.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbmessageprocessorderivation.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (109, 'Rulebase', 1, 'Y', 'rbpasswdval.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbpasswdval.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (110, 'Rulebase', 1, 'Y', 'rbresponsehandlerprotocolderivation.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbresponsehandlerprotocolderivation.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (111, 'Rulebase', 1, 'Y', 'rbsendmessage.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbsendmessage.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (112, 'Rulebase', 1, 'Y', 'rbveloselsupplier.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbveloselsupplier.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (113, 'Rulebase', 1, 'Y', 'rbworkitemdescription.xml', 'CUSTOM', '', 'File', 'standard/rulebase/rbworkitemdescription.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (114, 'Rulebase', 1, 'Y', 'skipAttrList.xml', 'CUSTOM', '', 'File', 'standard/rulebase/skipAttrList.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (115, 'Rulebase', 1, 'Y', 'statusderivation.xml', 'CUSTOM', '', 'File', 'standard/rulebase/statusderivation.xml', 'Y', 1, '2006-03-15 04:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (500, 'PROCESSNAME', 1, 'Y', 'wfin26productaddinternaleditv1.xml', 'WORKFLOW', 'Internal Edit Process', 'File', 'standard/workflow/wfin26productaddinternaleditv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (501, 'PROCESSNAME', 1, 'Y', 'wfin26productmergeapprovalv1.xml', 'WORKFLOW', 'Merge Approval Process', 'File', 'standard/workflow/wfin26productmergeapprovalv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (502, 'PROCESSNAME', 1, 'Y', 'checkrestart_subflowv1.xml', 'WORKFLOW', 'Process to restart event', 'File', 'standard/workflow/checkrestart_subflowv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);
INSERT INTO CONFIGURATIONDEFINITION (ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION, DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (503, 'PROCESSNAME', 1, 'Y', 'undoworkflowv1.xml', 'WORKFLOW', 'Process to undo event', 'File', 'standard/workflow/undoworkflowv1.xml', 'Y', 1, '2006-03-15 16:01:00', 1);

INSERT INTO CONFIGURATIONDEFINITION ( ID, TYPE, OWNERID, GLOBAL, NAME, SELECTOR, DESCRIPTION,DEFINITIONTYPE, DEFINITION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION ) VALUES (504, 'PROCESSNAME', 1, 'Y', 'wfin26productmanualmergev1.xml', 'WORKFLOW', 'Record manual merge process', 'File', 'standard/workflow/wfin26productmanualmergev1.xml', 'Y', 1,  '2006-03-15 16:01:00', 1);

COMMIT;
 
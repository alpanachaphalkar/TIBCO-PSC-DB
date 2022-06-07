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
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('ACTION', 'Record Actions');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('APPFUNCTION', 'Event Type Names');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('ASSOCIATION', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('BIZPROTOCOL', 'Business messaging protocols');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('BUYERCATALOGSETUP', 'Various options for Sync profile - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('BUYERCAT_DELIVERTO', 'Options for delivery of synchronization - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CONNECTORROLE', 'Roles played by the company in business chorepgraphy - GDSN');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DATASOURCETRANSPORTPROTOCOL', 'Transport options for datasource file input');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('SYNCHRONIZATIONPARAMETERS', 'URLs used for GDSN conenctor messages');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CATALOGAPPROVAL', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CATALOGATTRIBUTECATEGORY', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CATALOGFORMAT', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CATALOGPROFILE', 'Defaults for synchronizations');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CATALOGTRANSPORTPROTOCOL', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CHARSET', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CURRENCY', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CREDENTIALCONSTRAINTS', 'Constraints on credential definition - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COUNTRYCODE', 'Country codes - mainly used for locale selection');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMMUNICATIONPROTOCOL', 'Communication protocols used in Custom Protocol business process rule');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DATASOURCE_FILTER', 'unused - filering options for datasource list');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYADDRESS', 'Lables assigned to company address - for customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYBUYERORG', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYEMAIL', 'Labels assigned to company emails - for customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYFTP', 'Labels assigned to company FTP address - for customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYPHONE', 'Labels assigned to company phones - for customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('COMPANYURL', 'Labels assigned to company URL - for customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DATA_SELECTION_TYPE', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DATEFORMAT', 'Date format selection for date attributes of data sources');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TIMESTAMPFORMAT', 'Timestamp format selection for timestamp attributes of data sources');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DEPLOYMENTMODE', 'Current deployment mode - being suset');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DETAILTYPE', 'Process detail type - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DOCSUBTYPE', 'Document sub types');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DOCTYPE', 'Document types');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('EVENTAPPAREA', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('EVENTINITMECH', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('EVENTSTATE', 'Event states - shown in event log');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('EXCHANGEDATADETAIL', 'Maintains links between objects - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('GENERALSTATUS', 'Status of event, product logs and workitems');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('GLOBALORGANIZATIONTYPE', 'Global organization types');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('INDUSTRY', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('LANGUAGE', 'LANGUAGE');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('LOCALE', 'LOCALE');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('NORMALIZATION', 'Normalization option values for Translate Activity');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('OPTIONALFIELD_USER', 'Optional fields for user profile customization');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('ORGTYPE', 'Similar to Global organization types');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PAYLOADPACKAGINGSCHEME', 'List of message packaging schemes, to use in business process rules');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PHONENUMBER', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('POTYPE', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROCESSACTION', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROCESSDETAIL', 'Process Details, displayed in Event Log Details');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROCESSLOGINFO', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROCESSSTATUS', 'Possible process status values');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROCESSTYPE', 'Process Types');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PRODRELATIONSHIPTYPE', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PRODUCTOP', 'List of operations in product log');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PRODUCTSTATE', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PRODUCTSTATUS', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PRODUCTSUBOP', 'List of sub operation in product log');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PROTOCOL', 'unused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('RESERVEDENTERPRISENAMES', 'Reserved enterprise names');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('RESPONSESEVERITY', 'Severity definitions for business rules');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('ROLETYPE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('RULESPACE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('SCOPE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('SECURITYTYPE', 'Security/ Authentication method used for users');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TAXONOMY', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TIMEINTERVAL1', 'Defines frequencies');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TIMEZONE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TRANSLATOR', 'Possible translation options - input to Translate activity');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('UCCNETPRODUCTSTATE', 'obsolete');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('USERDOMAIN', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKFLOWFORMTYPE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMSTATUS', 'WORKITEMSTATUS');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMTYPE', 'usued');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('GRANTEETYPE', 'Types of grantees to whom permissions can be granted');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMLOCKEXPIRYMETHOD', 'Workitem lock expiry methods');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('OUTPUTFORMAT', 'Valid value list of formats to be picked in business process - currently usused');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PERSONALIZATION', 'Personalization options for objects - internal');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('RESOURCETYPE', 'Resource types used in permission definition');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('TASKTYPE', 'Task types assigned to workitem forms - controls the look and feel');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMSTATE', 'States a workitem may go through, used in business process rules');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PERSONALIZATION_DATEFORMAT', 'Supported Date formats');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PERSONALIZATION_TIMEFORMAT', 'Supported Time formats');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PERSONALIZATION_TIMESTAMPFORMAT', 'Supported Timestamp formats');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DATASOURCE_FORMAT', 'Input formats for data sources');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('EVENTLOGINFO', 'Info fields displayed in event log');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('ATTRIBUTEDATATYPE', 'Attribute data types descriptions');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('SOFTWARE_EDITION', 'Software Edition');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('DOCFORMAT', 'Document Format');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('BOOLEANVALUE', 'Boolean Value');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMEXPIRYTYPE', 'Work item expiry type');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMEINTENT', 'Work item intent');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('WORKITEMAPPROVALSTATUS', 'Work item approval status');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('CONNECTORPROTOCOL', 'Business choreography to be used for connectors - GDSN. Used in Custom Protocol business rule');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PREDEFINEDACTIVITY', 'Predefined Activities');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('PURGEEXECMODE', 'PURGEEXECMODE');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES ('UNDOEXECMODE', 'UNDOEXECMODE');
INSERT INTO DOMAIN (TYPE, DESCRIPTION) VALUES('PERSONALIZATION_TIMEZONE','Supported Time zones');

COMMIT;
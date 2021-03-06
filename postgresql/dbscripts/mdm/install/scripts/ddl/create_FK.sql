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

ALTER TABLE ASSOCIATION
ADD CONSTRAINT R_5039
FOREIGN KEY (PARENTID)
REFERENCES ORGANIZATION (ID);

ALTER TABLE ASSOCIATION
ADD CONSTRAINT R_5040
FOREIGN KEY (CHILDID)
REFERENCES ORGANIZATION (ID);

ALTER TABLE ASSOCDETAIL
ADD CONSTRAINT R_5046
FOREIGN KEY (ASSOCIATIONID)
REFERENCES ASSOCIATION (ID) ON DELETE CASCADE; 

ALTER TABLE CATALOGATTRIBUTE
ADD CONSTRAINT R_5006
FOREIGN KEY (CATALOGID, CATALOGVERSIONNUMBER)
REFERENCES CATALOG (ID, MODVERSION) ON DELETE CASCADE; 

ALTER TABLE CATALOGEDITIONDETAIL
ADD CONSTRAINT R_131
FOREIGN KEY (CATALOGEDITIONID, CATALOGEDITIONVERSION)
REFERENCES CATALOGEDITION(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGEDITIONHEADER
ADD CONSTRAINT R_164
FOREIGN KEY (CATALOGEDITIONID, CATALOGEDITIONVERSIONNUMBER)
REFERENCES CATALOGEDITION(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGEDITIONPARTY
ADD CONSTRAINT R_163
FOREIGN KEY (CATALOGEDITIONID, CATALOGEDITIONVERSIONNUMBER)
REFERENCES CATALOGEDITION(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGEDITIONSTEP
ADD CONSTRAINT R_97
FOREIGN KEY (CATALOGEDITIONID, CATALOGEDITIONVERSIONNUMBER)
REFERENCES CATALOGEDITION(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGINPUTMAPATTRIBUTE
ADD CONSTRAINT R_80
FOREIGN KEY (CATALOGINPUTMAPID, CATALOGINPUTMAPVERSION)
REFERENCES CATALOGINPUTMAP (ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGINPUTMAPFRAGMENT
ADD CONSTRAINT R_78
FOREIGN KEY (CATALOGINPUTMAPID, CATALOGINPUTMAPVERSION)
REFERENCES CATALOGINPUTMAP (ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CATALOGINPUTMAPFRAGMENT
ADD CONSTRAINT R_79
FOREIGN KEY (DATAFRAGMENTID)
REFERENCES DATAFRAGMENT (ID) ON DELETE CASCADE;

ALTER TABLE CATALOGTYPEATTRIBUTE
ADD CONSTRAINT R_70
FOREIGN KEY (CATALOGTYPEID,CATALOGTYPEVERSION)
REFERENCES CATALOGTYPE (ID,MODVERSION) ON DELETE CASCADE;

ALTER TABLE CLASSIFICATIONCODEATTRIBUTE
ADD CONSTRAINT R_5005
FOREIGN KEY (CLASSIFICATIONCODEID, CSVERSIONNUMBER)
REFERENCES CLASSIFICATIONCODE(ID, CSVERSIONNUMBER) ON DELETE CASCADE;

ALTER TABLE CLASSIFICATIONSCHEME
ADD CONSTRAINT R_5043
FOREIGN KEY (SOURCEORGANIZATIONID)
REFERENCES ORGANIZATION (ID);

ALTER TABLE CLASSIFICATIONCODE
ADD CONSTRAINT R_5045
FOREIGN KEY (CLASSIFICATIONSCHEMEID, CSVERSIONNUMBER)
REFERENCES CLASSIFICATIONSCHEME (ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CLASSIFICATIONATTRIBUTE
ADD CONSTRAINT  FK_CLASSATTR_CLASSSCHEME
FOREIGN KEY (CLASSIFICATIONSCHEMEID, CSVERSIONNUMBER)
REFERENCES CLASSIFICATIONSCHEME (ID, MODVERSION) ON DELETE CASCADE;


ALTER TABLE CONVERSATION
ADD CONSTRAINT R_5014
FOREIGN KEY (ENTERPRISEID)
REFERENCES ENTERPRISE (ID);

ALTER TABLE CONFIGURATIONDOCUMENT
ADD CONSTRAINT FK_CD_MEMBID
FOREIGN KEY (MEMBERID)
REFERENCES MEMBER (ID) ON DELETE CASCADE; 

ALTER TABLE DATAFRAGMENT
ADD CONSTRAINT R_5004
FOREIGN KEY (CATALOGFORMATID)
REFERENCES CATALOGFORMAT (ID);

ALTER TABLE DATAFRAGMENT
ADD CONSTRAINT R_5044
FOREIGN KEY (SOURCEORGANIZATIONID)
REFERENCES ORGANIZATION (ID);

ALTER TABLE DFATTRIBUTE
ADD CONSTRAINT R_471
FOREIGN KEY(DATAFRAGMENTID)
REFERENCES DATAFRAGMENT(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINENTRY
ADD CONSTRAINT R_5012
FOREIGN KEY(DOMAINTYPE)
REFERENCES DOMAIN(TYPE);

ALTER TABLE DOMAINSTRING
ADD CONSTRAINT R_5013
FOREIGN KEY(DOMAINTYPE, DOMAINVALUE)
REFERENCES DOMAINENTRY(DOMAINTYPE, VALUE);

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5001
FOREIGN KEY(ADDRESSID)
REFERENCES ADDRESS(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5023
FOREIGN KEY(FTPID)
REFERENCES FTP(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5031
FOREIGN KEY(HTTPID)
REFERENCES HTTP(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5032
FOREIGN KEY(MEMBERID)
REFERENCES MEMBER(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5048
FOREIGN KEY(ORGANIZATIONID)
REFERENCES ORGANIZATION(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5055
FOREIGN KEY(PHONENUMBERID)
REFERENCES PHONENUMBER(ID) ON DELETE CASCADE;

ALTER TABLE DOMAINVALUE
ADD CONSTRAINT R_5070
FOREIGN KEY(EMAILID)
REFERENCES EMAIL(ID) ON DELETE CASCADE;

ALTER TABLE EXPORTPROFILEJOURNAL
ADD CONSTRAINT R_EXPORT98
FOREIGN KEY (PROFILEID)
REFERENCES EXPORTPROFILE (ID) ON DELETE CASCADE;

ALTER TABLE EXPORTPROFILELINE
ADD CONSTRAINT R_EXPORT99
FOREIGN KEY (PROFILEID)
REFERENCES EXPORTPROFILE (ID) ON DELETE CASCADE;

ALTER TABLE FUNC2IDMAP
ADD CONSTRAINT R_5024
FOREIGN KEY(FUNCID)
REFERENCES FUNCTION(ID);

ALTER TABLE FUNCTIONROLE
ADD CONSTRAINT R_5025
FOREIGN KEY(FUNCTIONID)
REFERENCES FUNCTION(ID) ON DELETE CASCADE;

ALTER TABLE FUNCTIONROLE
ADD CONSTRAINT R_5059
FOREIGN KEY(ROLEID)
REFERENCES ROLE(ID) ON DELETE CASCADE;

ALTER TABLE MEMBER
ADD CONSTRAINT R_5016
FOREIGN KEY(ENTERPRISEID)
REFERENCES ENTERPRISE(ID);

ALTER TABLE MEMBERSHIP
ADD CONSTRAINT R_5034
FOREIGN KEY(MEMBERID)
REFERENCES MEMBER(ID);

ALTER TABLE MEMBERSHIP
ADD CONSTRAINT R_5050
FOREIGN KEY(ORGANIZATIONID)
REFERENCES ORGANIZATION(ID);

ALTER TABLE ORGANIZATION
ADD CONSTRAINT R_5017
FOREIGN KEY(ENTERPRISEID)
REFERENCES ENTERPRISE(ID);

ALTER TABLE PROTOCOLCODES
ADD CONSTRAINT R_5075
FOREIGN KEY(ENTERPRISEID)
REFERENCES ENTERPRISE(ID);


ALTER TABLE RESOURCEACL
ADD CONSTRAINT R_5077
FOREIGN KEY(RESOURCETYPE, RESACCESS)
REFERENCES RESOURCEACCESS(RESOURCETYPE, RESACCESS) ON DELETE CASCADE;

ALTER TABLE ROLE
ADD CONSTRAINT R_5018
FOREIGN KEY(ENTERPRISEID)
REFERENCES ENTERPRISE(ID);

ALTER TABLE ROLE2FUNCMAP
ADD CONSTRAINT R_5026
FOREIGN KEY(FUNCID)
REFERENCES FUNCTION(ID) ON DELETE CASCADE; 

ALTER TABLE ROLE2FUNCMAP
ADD CONSTRAINT R_5060
FOREIGN KEY(ROLEID)
REFERENCES ROLE(ID) ON DELETE CASCADE; 

ALTER TABLE ROLEACCESS
ADD CONSTRAINT R_5061
FOREIGN KEY(ROLEID)
REFERENCES ROLE(ID) ON DELETE CASCADE; 

ALTER TABLE ROLEASSIGNMENT
ADD CONSTRAINT R_5038
FOREIGN KEY(MEMBERID)
REFERENCES MEMBER(ID) ON DELETE CASCADE;

ALTER TABLE ROLEASSIGNMENT
ADD CONSTRAINT R_5062
FOREIGN KEY(ROLEID)
REFERENCES ROLE(ID) ON DELETE CASCADE;

ALTER TABLE RULEDEFAULTRULES
ADD CONSTRAINT R_5072
FOREIGN KEY(RULEMODELID)
REFERENCES RULEMODEL(ID) ON DELETE CASCADE;

ALTER TABLE RULEDOUBLEDATA
ADD CONSTRAINT R_5063
FOREIGN KEY(RULEMODELID)
REFERENCES RULEMODEL(ID) ON DELETE CASCADE;

ALTER TABLE RULEINTEGERDATA
ADD CONSTRAINT R_5064
FOREIGN KEY(RULEMODELID)
REFERENCES RULEMODEL(ID) ON DELETE CASCADE;

ALTER TABLE RULEMETAMODEL
ADD CONSTRAINT R_5052
FOREIGN KEY(ORGANIZATIONID)
REFERENCES ORGANIZATION(ID) ON DELETE CASCADE;

ALTER TABLE RULEMODEL
ADD CONSTRAINT R_5054
FOREIGN KEY(ORGANIZATIONID)
REFERENCES ORGANIZATION(ID);

ALTER TABLE RULESTRINGDATA
ADD CONSTRAINT R_5065
FOREIGN KEY(RULEMODELID)
REFERENCES RULEMODEL(ID)
ON DELETE CASCADE;

ALTER TABLE RULETEXTDATA
ADD CONSTRAINT R_5066
FOREIGN KEY(RULEMODELID)
REFERENCES RULEMODEL(ID) ON DELETE CASCADE; 

ALTER TABLE RECORDSYNCLOG
ADD CONSTRAINT FK_RECORDSYNCOP_PRODUCTKEY
FOREIGN KEY (PRODUCTKEYID)   
REFERENCES PRODUCTKEY (ID);

ALTER TABLE RESOURCEACL
ADD CONSTRAINT FK_RESOURCEACL_ENTID
FOREIGN KEY (ENTERPRISEID)
REFERENCES ENTERPRISE (ID) ON DELETE CASCADE; 

ALTER TABLE RESOURCEACLHISTORY
ADD CONSTRAINT FK_RESOURCEACLHIST_ENTID
FOREIGN KEY (ENTERPRISEID)
REFERENCES ENTERPRISE (ID) ON DELETE CASCADE; 


ALTER TABLE SUBCATALOGATTRIBUTE
ADD CONSTRAINT R_110
FOREIGN KEY(SUBCATALOGID, SUBCATALOGMODVERSION)
REFERENCES SUBCATALOG(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE SUBSETPRODUCT
ADD CONSTRAINT R_111
FOREIGN KEY(SUBCATALOGID, SUBCATALOGMODVERSION)
REFERENCES SUBCATALOG(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE SUBSETSEARCHCRITERION
ADD CONSTRAINT R_112
FOREIGN KEY(SUBCATALOGID, SUBCATALOGVERSIONNUMBER)
REFERENCES SUBCATALOG(ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE SUPPLIERSTATE
ADD CONSTRAINT R_5019
FOREIGN KEY(ENTERPRISEID)
REFERENCES ENTERPRISE(ID) ON DELETE CASCADE;

ALTER TABLE SUPPLIERSTATETRANSITION
ADD CONSTRAINT R_5067
FOREIGN KEY(FROMSTATEID, ENTERPRISEID)
REFERENCES SUPPLIERSTATE(ID, ENTERPRISEID);

ALTER TABLE SUPPLIERSTATETRANSITION
ADD CONSTRAINT R_5068
FOREIGN KEY(TOSTATEID, ENTERPRISEID)
REFERENCES SUPPLIERSTATE(ID, ENTERPRISEID);

ALTER TABLE WORKFLOWDEFINITION
ADD CONSTRAINT FK_WORKFLOWDEF_OWNID
FOREIGN KEY (OWNERORGANIZATIONID)
REFERENCES ORGANIZATION (ID) ON DELETE CASCADE;

ALTER TABLE WORKFLOWFORM
ADD CONSTRAINT R_5080 FOREIGN KEY (OWNERORGANIZATIONID)
REFERENCES ORGANIZATION (ID) ON DELETE CASCADE; 

ALTER TABLE WORKITEMLOCK
ADD CONSTRAINT R_5081 FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);

ALTER TABLE CONVERSATIONKEY
ADD CONSTRAINT R_5008
FOREIGN KEY (CONVERSATIONID)
REFERENCES CONVERSATION (ID);

ALTER TABLE EVENTDETAIL
ADD CONSTRAINT R_5020
FOREIGN KEY (EVENTID)
REFERENCES EVENT (ID);

ALTER TABLE PROCESSDETAIL
ADD CONSTRAINT R_PROCESS98
FOREIGN KEY (PROCESSID)
REFERENCES PROCESS (ID);

ALTER TABLE PROCESSSTATE
ADD CONSTRAINT R_PROCESS99
FOREIGN KEY (ID)
REFERENCES PROCESS (ID);

ALTER TABLE PROCESSSTATEHISTORY
ADD CONSTRAINT R_PROCESSHIST99
FOREIGN KEY (ID)
REFERENCES PROCESS (ID);

ALTER TABLE RECORDCOLLECTIONDETAIL
ADD CONSTRAINT R_RECORDCOLL98
FOREIGN KEY (RECORDCOLLECTIONID)
REFERENCES RECORDCOLLECTION (ID);

ALTER TABLE RECORDLIST
ADD CONSTRAINT R_RECORDCOLL99
FOREIGN KEY (RECORDCOLLECTIONID)
REFERENCES RECORDCOLLECTION (ID);

ALTER TABLE WORKITEMDETAIL
ADD CONSTRAINT R_129
FOREIGN KEY (WORKITEMID)
REFERENCES WORKITEM (ID);

ALTER TABLE MATCHRESULT
ADD CONSTRAINT FK_MATCHRESULT_PRODUCTKEY 
FOREIGN KEY (RECORDID)
REFERENCES PRODUCTKEY (ID);

ALTER TABLE MATCHRESULT
ADD CONSTRAINT FK_MATCHRESULT_PROCESSLOG 
FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);  

ALTER TABLE MATCHRESULTDETAILS
ADD CONSTRAINT FK_MATCHRESULTDETAILS_MRID 
FOREIGN KEY (MATCHRESULTID)
REFERENCES MATCHRESULT (ID);

ALTER TABLE MATCHCANDIDATE
ADD CONSTRAINT FK_MATCHCANDIDATE_MATCHRESULT 
FOREIGN KEY (MATCHRESULTID)
REFERENCES MATCHRESULT (ID);

ALTER TABLE MATCHCANDIDATEDETAILS
ADD CONSTRAINT FK_MATCHCANDIDATEDETAILS_MCID 
FOREIGN KEY (MATCHCANDIDATEID)
REFERENCES MATCHCANDIDATE (ID);    

ALTER TABLE MATCHCRITERION
ADD CONSTRAINT FK_MATCHCRITERION_PROCESSLOG 
FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);

ALTER TABLE MERGERESULT
ADD CONSTRAINT FK_MERGERESULT_PRODUCTKEY 
FOREIGN KEY (SOURCERECORDKEYID)
REFERENCES PRODUCTKEY (ID);

ALTER TABLE MERGERESULT
ADD CONSTRAINT FK_MERGERESULT_TARGET_PK 
FOREIGN KEY (TARGETRECORDKEYID)
REFERENCES PRODUCTKEY (ID);

ALTER TABLE MERGERESULT
ADD CONSTRAINT FK_MERGERESULT_PLOGID
FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);

ALTER TABLE MERGERESULTDETAIL
ADD CONSTRAINT FK_MERGERESULTDETAIL_ID
FOREIGN KEY (MERGERESULTID)
REFERENCES MERGERESULT (ID);

ALTER TABLE MERGECANDIDATE
ADD CONSTRAINT FK_MERGECANDIDATE_MERGERESULT  FOREIGN KEY (MERGERESULTID) REFERENCES MERGERESULT  (ID);

ALTER TABLE MERGEATTRIBUTE
ADD CONSTRAINT FK_MERGEATTRIBUTE_MERGERESULT 
FOREIGN KEY (MERGERESULTID)
REFERENCES MERGERESULT (ID);

ALTER TABLE RECORDLINKAGE
ADD CONSTRAINT FK_RECORDLINKAGE_PRODUCTKEY 
FOREIGN KEY (SOURCERECORDKEYID)
REFERENCES PRODUCTKEY (ID);

ALTER TABLE RECORDLINKAGE
ADD CONSTRAINT FK_RECORDLINKAGE_TARGET_PK
FOREIGN KEY (TARGETRECORDKEYID)
REFERENCES PRODUCTKEY (ID);

ALTER TABLE RECORDAPPROVAL
ADD CONSTRAINT FK_RECORDAPPROVAL_PROCESSLOG
FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);

ALTER TABLE RECORDAPPROVALHISTORY
ADD CONSTRAINT FK_REC_APPR_HISTORY_PROCESSLOG
FOREIGN KEY (PROCESSLOGID)
REFERENCES PROCESSLOG (ID);

ALTER TABLE PERSPECTIVERELATIONSHIP
ADD CONSTRAINT FK_PERSPECTIVE_ID 
FOREIGN KEY (PERSPECTIVEID,MODVERSION)
REFERENCES PERSPECTIVE(ID,MODVERSION) ON DELETE CASCADE;

ALTER TABLE PERSPECTIVEREPOATTRIBUTES 
ADD CONSTRAINT FK_PER_ID_MOD 	
FOREIGN KEY (PERSPECTIVEID,MODVERSION) 
REFERENCES PERSPECTIVE(ID,MODVERSION) ON DELETE CASCADE;

ALTER TABLE CLASSIFICATIONLOGICALLEVEL
ADD CONSTRAINT FK_CS_LOGICALLEVEL
FOREIGN KEY (CLASSIFICATIONSCHEMEID, CSVERSIONNUMBER)
REFERENCES CLASSIFICATIONSCHEME (ID, MODVERSION) ON DELETE CASCADE;

ALTER TABLE CLASSIFICATIONINPUTMAPLEVEL
ADD CONSTRAINT FK_CS_INPUTMAP_LEVEL
FOREIGN KEY (CLASSIFICATIONINPUTMAPID, CLASSIFICATIONINPUTMAPVERSION)
REFERENCES CLASSIFICATIONINPUTMAP (ID, MODVERSION) ON DELETE CASCADE;


ALTER TABLE ATTRIBUTEHISTORY
ADD CONSTRAINT R_ATTRIBUTEHIST98
FOREIGN KEY (CATALOGID, PRODUCTKEYID, MODVERSION)
REFERENCES PRINCIPALKEY (CATALOGID, PRODUCTKEYID, MODVERSION);

ALTER TABLE METADATAXREF
ADD CONSTRAINT R_METADATAXREF99
FOREIGN KEY (PRODUCTKEYID)
REFERENCES PRODUCTKEY (ID);


ALTER TABLE ATTRIBUTESCORE
ADD CONSTRAINT R_CATATTRREF
FOREIGN KEY (CATALOGID, ATTRIBUTEID, CATALOGVERSIONNUMBER)
REFERENCES CATALOGATTRIBUTE (CATALOGID, ID, CATALOGVERSIONNUMBER) ON DELETE CASCADE ;

ALTER TABLE WORKITEMATTRIBUTE
ADD CONSTRAINT R_WI_ATTR_WID_FK 
FOREIGN KEY (WORKITEMID) 
REFERENCES WORKITEM ( ID ) ON DELETE CASCADE;

	
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
INSERT INTO CATALOGTYPE (ID, SOURCEORGANIZATIONID, NAME, DESCRIPTION, FIXEDLENGTH, HEADERREQUIRED, DELIMITER, ACTIVE, MODMEMBERID, MODDATE, MODVERSION, TEXTQUALIFIER, PARENTCTID, PARENTCTSOURCEORGANIZATIONID, TABLENAME, SKIPNEWATTRIBUTEASCHANGE) VALUES (6, 1, 'TIBCO', 'TIBCO Catalog Format', 'N', 'Y', 44, 'Y', 1, '2007-10-19 18:05:46', 1, NULL, NULL, NULL, NULL, 'N');
COMMIT;

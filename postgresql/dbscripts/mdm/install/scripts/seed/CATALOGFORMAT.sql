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
INSERT INTO CATALOGFORMAT (ID, NAME, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (1, 'ASCII_DELIMITED', 'Delimited', 'Y', 1, '2003-01-16 15:11:57', 0);
INSERT INTO CATALOGFORMAT (ID, NAME, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (2, 'ASCII_FIXEDLENGTH', 'Fixed Length', 'Y', 1, '2003-01-16 15:11:57', 0);
INSERT INTO CATALOGFORMAT (ID, NAME, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (5, 'SQL', 'SQL', 'Y', 1, '2003-01-16 15:11:57', 0);
INSERT INTO CATALOGFORMAT (ID, NAME, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION) VALUES (8, 'XML', 'XML', 'Y', 1, '2003-01-16 15:11:57', 0);
COMMIT;

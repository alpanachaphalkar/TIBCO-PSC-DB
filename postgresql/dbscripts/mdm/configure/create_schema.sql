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
CREATE SCHEMA :mdm_db_schema;
ALTER SCHEMA :mdm_db_schema OWNER TO :pg_super_user;
GRANT ALL ON SCHEMA :mdm_db_schema TO :pg_super_user;
GRANT ALL ON SCHEMA :mdm_db_schema TO :mdm_user;

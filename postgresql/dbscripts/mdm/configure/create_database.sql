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

DROP DATABASE IF EXISTS :mdm_db;

CREATE DATABASE :mdm_db WITH ENCODING 'UTF8' TABLESPACE velodbdata CONNECTION LIMIT = -1;

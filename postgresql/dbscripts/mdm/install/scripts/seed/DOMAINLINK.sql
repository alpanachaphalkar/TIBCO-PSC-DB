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
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-cr', 4, 'Spanish(Costa Rica)[es-cr]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-do', 5, 'Spanish(Dominican Republic)[es-do]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-ec', 6, 'Spanish(Ecuador)[es-ec]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-sv', 7, 'Spanish(El Salvador)[es-sv]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-gt', 8, 'Spanish(Guatemala)[es-gt]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-hn', 9, 'Spanish(Honduras)[es-hn]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es', 10, 'Spanish(International Sort)[es]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-mx', 11, 'Spanish(Mexico)[es-mx]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-ni', 12, 'Spanish(Nicaragua)[es-ni]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-pa', 13, 'Spanish(Panama)[es-pa]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-py', 14, 'Spanish(Paraguay)[es-py]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-pe', 15, 'Spanish(Peru)[es-pe]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-ts', 16, 'Spanish(Traditional Sort)[es]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-us', 17, 'Spanish(United States)[es-us]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-uy', 18, 'Spanish(Uruguay)[es-uy]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-ve', 19, 'Spanish(Venezuela)[es-ve]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'sv-fi', 0, 'Swedish(Finland)[sv-fi]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'sv', 1, 'Swedish[sv]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYPHONE', 'MAIN', 1, 'Main Phone');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYPHONE', 'MAINFAX', 1, 'Fax');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYEMAIL', 'INFO', 1, 'General Info Email');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYURL', 'MAIN', 1, 'Home Page');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYADDRESS', 'MAILING', 1, 'Mailing Address');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYFTP', 'MAIN', 1, 'Main FTP');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (2, 'COMPANYBUYERORG', 'DEFAULTORDERBUYER', 1, 'Default Order Trading Partner');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (3, 'COMPANYPHONE', 'MAIN', 1, 'Main Phone');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (3, 'COMPANYPHONE', 'MAINFAX', 1, 'Fax');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (3, 'COMPANYEMAIL', 'INFO', 1, 'General Info Email');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (3, 'COMPANYURL', 'MAIN', 1, 'Home Page');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (3, 'COMPANYADDRESS', 'MAILING', 1, 'Mailing Address');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (4, 'COMPANYPHONE', 'MAIN', 1, 'Main Phone');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (4, 'COMPANYEMAIL', 'CONTACT', 1, 'Contact Email');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (4, 'COMPANYADDRESS', 'MAILING', 1, 'Mailing Address');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'APPFUNCTION', 'CatPubValidate', 21, 'Catalog Validate');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'APPFUNCTION', 'CatPubSync', 22, 'Catalog Publish');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'SEND', 2, 'Send');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'EVENTPUBLISH', 3, 'Generated/ Add or Publish Event');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'PUBLISH', 4, 'Publish');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'NOTIFY', 5, 'Notify');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'LINK', 6, 'Link');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'SUBSET-IMPLICIT', 7, 'Implicit Product Selection');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'GENERATE', 8, 'Generate');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'PRODUCTOP', 'ADD', 9, 'Add');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (1, 'COMPANYURL', 'IntegrationURL', 1, 'HTTP(S) Integration URL');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh', 0, 'Chinese[zh]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh-cn', 1, 'Chinese(China)[zh-cn]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh-hk', 2, 'Chinese(Hing Kong)[zh-hk]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh-mo', 3, 'Chinese(Macau SAR)[zh-mo]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh-sg', 4, 'Chinese(Singapore)[zh-sg]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'zh-tw', 5, 'Chinese(Taiwan)[zh-tw]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'nl-be', 0, 'Dutch(Belgium)[nl-be]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'nl', 1, 'Dutch(Netherlands)[nl]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-au', 0, 'English(Australia)[en-au]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-bz', 1, 'English(Belize)[en-bz]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-ca', 2, 'English(Canada)[en-ca]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en', 3, 'English(Caribbean)[en]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-ie', 4, 'English(Ireland)[en-ie]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-jm', 5, 'English(Jamaica)[en-jm]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-nz', 6, 'English(New Zealand)[en-nz]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-ph', 7, 'English(Philippines)[en-ph]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-za', 8, 'English(South Africa)[en-za]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-tt', 9, 'English(Trinidad)[en-tt]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-gb', 10, 'English(United Kingdom)[en-gb]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-us', 11, 'English(United States)[en-us]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'en-zw', 12, 'English(Zimbabwe)[en-zw]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr-be', 0, 'French(Belgium)[fr-be]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr-ca', 1, 'French(Canada)[fr-ca]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr', 2, 'French(France)[fr]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr-lu', 3, 'French(Luxembourg)[fr-lu]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr-mc', 4, 'French(Monaco)[fr-mc]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'fr-ch', 5, 'French(Switzerland)[fr-ch]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'de-at', 0, 'German(Austria)[de-at]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'de-li', 1, 'German(Liechtenstein)[de-li]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'de-lu', 2, 'German(Luxembourg)[de-lu]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'de-ch', 3, 'German(Switzerland)[de-ch]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'de', 4, 'German(Germany)[de]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'it', 0, 'Italian(Italy)[it]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'it-ch', 1, 'Italian(Switzerland)[it-ch]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'ja', 0, 'Japanese[ja]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'ko', 0, 'Korean[ko]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-ar', 0, 'Spanish(Argentina)[es-ar]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-bo', 1, 'Spanish(Bolivia)[es-bo]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-cl', 2, 'Spanish(Chile)[es-cl]');
INSERT INTO DOMAINLINK (OWNERID, DOMAINTYPE, DOMAINVALUE, SEQUENCE, DESCRIPTION) VALUES (0, 'LOCALE', 'es-co', 3, 'Spanish(Colombia)[es-co]');
COMMIT;

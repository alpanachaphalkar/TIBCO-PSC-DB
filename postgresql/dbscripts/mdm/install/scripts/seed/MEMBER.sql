BEGIN TRANSACTION;
INSERT INTO MEMBER (ID, ENTERPRISEID, DOMAIN, USERNAME, LASTNAME, FIRSTNAME, MIDDLENAME, SECURITYTYPE, SECURITY, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION, DELEGATIONACTIVE, DELEGATIONSTARTDATE, DELEGATIONENDDATE, NOTIFYOFDELEGATION, AUTOREVERTFLAG, LOCALE, LANGUAGE, PARTITIONKEY) VALUES (101, 0, 'MartQuestNet', 'tadmin', 'user', 'super', 'H', 'PASSWORD', 'WqzuMV4TxhvsB3u61jZOSu6dyxk=', NULL, 'Y', 101, '2007-03-29 13:57:00', 3, 'N', NULL, NULL, NULL, NULL, 'null', 'null', NULL);
INSERT INTO MEMBER (ID, ENTERPRISEID, DOMAIN, USERNAME, LASTNAME, FIRSTNAME, MIDDLENAME, SECURITYTYPE, SECURITY, DESCRIPTION, ACTIVE, MODMEMBERID, MODDATE, MODVERSION, DELEGATIONACTIVE, DELEGATIONSTARTDATE, DELEGATIONENDDATE, NOTIFYOFDELEGATION, AUTOREVERTFLAG, LOCALE, LANGUAGE, PARTITIONKEY) VALUES (32881, 0, 'ZZ', 'GLOBAL', NULL, NULL, NULL, 'PASSWORD', 'GLOBAL', NULL, 'Y', 101, '2004-01-01 00:00:00', 1, 'N', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
COMMIT;
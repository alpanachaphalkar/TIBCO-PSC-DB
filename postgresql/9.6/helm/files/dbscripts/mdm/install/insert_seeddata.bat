"%PGSQL%" -ef ./scripts/ddl/create_sequeces.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/ddl/create_tables.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/ddl/create_PK.sql 				    >> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/ENTERPRISE.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/ORGANIZATION.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/DOMAIN.sql 					>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/DOMAINENTRY.sql 				>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/RELEASE.sql 				    >> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/RESOURCEACCESS.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOGATTRIBUTEDATATYPE.sql 	>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CONFIGURATIONDEFINITION.sql 	>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/SCREEN.sql 					>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/FUNCTION.sql 				    >> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/HTMLELEMENTID.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/FUNC2IDMAP.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/FUNC2SCREENMAP.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/ROLE.sql 					    >> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/ROLE2FUNCMAP.sql 				>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/SUPPLIERSTATE.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/WORKFLOWFORM.sql 				>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/MEMBER.sql 					>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/MEMBERSHIP.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/OBJECTSEQUENCE.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/ROLEASSIGNMENT.sql 			>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/DOMAINLINK.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/DOMAINVALUE.sql 				>> %LOGGER%

"%PGSQL%" -ef ./scripts/seed/ATTRIBUTEGROUP.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOGFORMAT.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOGTYPE.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOGTYPEATTRIBUTE.sql 		>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOG.sql 				    >> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/CATALOGATTRIBUTE.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/RELATIONSHIP.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/PROCESSSELECTION.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/seed/HIVALUE.sql 			        >> %LOGGER%

"%PGSQL%" -ef ./scripts/ddl/create_indexes.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/ddl/create_FK.sql 				    >> %LOGGER%
"%PGSQL%" -ef ./scripts/ddl/create_views.sql 				>> %LOGGER%
"%PGSQL%" -ef ./scripts/ddl/create_functions.sql 			>> %LOGGER%
"%PGSQL%" -ef ./scripts/triggers/create_triggers.sql 		>> %LOGGER%
"%PGSQL%" -ef ./MDMInstance.sql 		                    >> %LOGGER%
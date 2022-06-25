#!/bin/sh

echo "----------------------- Environment Variables ----------------------------"
echo "Using PGHOME=${PGHOME}"
echo "Using PGSQL=${PGSQL}"
echo "Using PGHOST=${PGHOST}"
echo "Using PGPORT=${PGPORT}"
echo "Using PGDATABASE=${PGDATABASE}"
echo "Using PGUSER=${PGUSER}"
echo "Using MDMDBUSER=${MDMDBUSER}"
echo "Using MDMDBSCHEMA=${MDMDBSCHEMA}"
echo "Using MDMDBDATATBSSTORAGE=${MDMDBDATATBSSTORAGE}"
echo "Using MDMDBINDEXTBSSTORAGE=${MDMDBINDEXTBSSTORAGE}"
echo "Using MDMINSTANCENAME=${MDMINSTANCENAME}"
echo "Using MDMINSTANCEDESCRIPTION=${MDMINSTANCEDESCRIPTION}"
echo "Using LOGGER=${LOGGER}"
echo "----------------------------------------------------------------------------"

# Launch the mdm scripts
echo "-------------------------- Launching MDM Scripts ---------------------------"
"${PGSQL}" -v mdm_data_tbs_storage="${MDMDBDATATBSSTORAGE}" -v mdm_data_index_storage="${MDMDBINDEXTBSSTORAGE}" -f ./mdm/configure/create_tablespaces.sql
"${PGSQL}" -v mdm_user="${MDMDBUSER}" -v mdm_password="'${MDMDBPASSWORD}'" -f ./mdm/configure/create_users.sql
"${PGSQL}" -v mdm_db="${MDMINSTANCENAME}" -f ./mdm/configure/create_database.sql
"${PGSQL}" -v mdm_db_schema="${MDMDBSCHEMA}" -v pg_super_user="${PGUSER}" -v mdm_user="${MDMDBUSER}" -f ./mdm/configure/create_schema.sql
"${PGSQL}" -f ./mdm/configure/create_extentions.sql

export PGUSER="${MDMDBUSER}"
export PGPASSWORD="${MDMDBPASSWORD}"
export PGDATABASE="${MDMINSTANCENAME}"

"${PGSQL}" -v mdm_user="${MDMDBUSER}" -v mdm_db_schema="${MDMDBSCHEMA}" -f ./mdm/configure/alter_searchpath.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_sequeces.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_tables.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_PK.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ENTERPRISE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ORGANIZATION.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/DOMAIN.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/DOMAINENTRY.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/RELEASE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/RESOURCEACCESS.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOGATTRIBUTEDATATYPE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CONFIGURATIONDEFINITION.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/SCREEN.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/FUNCTION.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/HTMLELEMENTID.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/FUNC2IDMAP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/FUNC2SCREENMAP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ROLE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ROLE2FUNCMAP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/SUPPLIERSTATE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/WORKFLOWFORM.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/MEMBER.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/MEMBERSHIP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/OBJECTSEQUENCE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ROLEASSIGNMENT.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/DOMAINLINK.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/DOMAINVALUE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/ATTRIBUTEGROUP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOGFORMAT.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOGTYPE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOGTYPEATTRIBUTE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOG.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/CATALOGATTRIBUTE.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/RELATIONSHIP.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/PROCESSSELECTION.sql
"${PGSQL}" -f ./mdm/install/scripts/seed/HIVALUE.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_indexes.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_FK.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_views.sql
"${PGSQL}" -f ./mdm/install/scripts/ddl/create_functions.sql
"${PGSQL}" -f ./mdm/install/scripts/triggers/create_triggers.sql
"${PGSQL}" -v mdm_db_instance_name="${MDMINSTANCENAME}" -v mdm_db_instance_desc="${MDMINSTANCEDESCRIPTION}" -f ./mdm/MDMInstance.sql
echo "-------------------------- Finished MDM Scripts Execution ---------------------------"

# Launch the fc scripts
echo "------------------------------ Launching FC Scripts -------------------------------"
"${PGSQL}" -f ./fc/install/scripts/seed/function_ac.sql
"${PGSQL}" -f ./fc/install/scripts/seed/SCREEN.sql
"${PGSQL}" -f ./fc/install/scripts/seed/FC_DEL_FROM_DBE_RELATIONSHIP.sql
"${PGSQL}" -f ./fc/install/scripts/seed/FC_GET_DELETED_RELATIONSHIP.sql
"${PGSQL}" -f ./fc/install/scripts/seed/FC_TU_PROCESS.sql
"${PGSQL}" -f ./fc/install/scripts/seed/FC_UPDATELIFECYCLESTATUS.sql
"${PGSQL}" -f ./fc/utility/ClearNamedversionData.sql
"${PGSQL}" -f ./fc/install/scripts/seed/FC_GET_REL_DEL_MOD_IN_TS.sql
"${PGSQL}" -f ./fc/install/scripts/seed/create_tabs.sql
echo "-------------------------- Finished FC Scripts Execution ---------------------------"
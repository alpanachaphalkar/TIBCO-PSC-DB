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
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_data_tbs_storage="${MDMDBDATATBSSTORAGE}" -v mdm_data_index_storage="${MDMDBINDEXTBSSTORAGE}" -f ./mdm/configure/create_tablespaces.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_user="${MDMDBUSER}" -v mdm_password="'${MDMDBPASSWORD}'" -f ./mdm/configure/create_users.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db="${MDMINSTANCENAME}" -f ./mdm/configure/create_database.sql

export PGUSER="${MDMDBUSER}"
export PGPASSWORD="${MDMDBPASSWORD}"
export PGDATABASE="${MDMINSTANCENAME}"

"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db_schema="${MDMDBSCHEMA}" -v pg_super_user="${PGUSER}" -v mdm_user="${MDMDBUSER}" -f ./mdm/configure/create_schema.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/configure/create_extentions.sql

"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_user="${MDMDBUSER}" -v mdm_db_schema="${MDMDBSCHEMA}" -f ./mdm/configure/alter_searchpath.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_sequeces.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_tables.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_PK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ENTERPRISE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ORGANIZATION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/DOMAIN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/DOMAINENTRY.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/RELEASE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/RESOURCEACCESS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOGATTRIBUTEDATATYPE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CONFIGURATIONDEFINITION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/SCREEN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/FUNCTION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/HTMLELEMENTID.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/FUNC2IDMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/FUNC2SCREENMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ROLE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ROLE2FUNCMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/SUPPLIERSTATE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/WORKFLOWFORM.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/MEMBER.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/MEMBERSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/OBJECTSEQUENCE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ROLEASSIGNMENT.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/DOMAINLINK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/DOMAINVALUE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/ATTRIBUTEGROUP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOGFORMAT.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOGTYPE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOGTYPEATTRIBUTE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOG.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/CATALOGATTRIBUTE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/PROCESSSELECTION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/seed/HIVALUE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_indexes.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_FK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_views.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/ddl/create_functions.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./mdm/install/scripts/triggers/create_triggers.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db_instance_name="${MDMINSTANCENAME}" -v mdm_db_instance_desc="${MDMINSTANCEDESCRIPTION}" -f ./mdm/MDMInstance.sql
echo "-------------------------- Finished MDM Scripts Execution ---------------------------"

# Launch the fc scripts
echo "------------------------------ Launching FC Scripts -------------------------------"
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/function_ac.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/SCREEN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/FC_DEL_FROM_DBE_RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/FC_GET_DELETED_RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/FC_TU_PROCESS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/FC_UPDATELIFECYCLESTATUS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/utility/ClearNamedversionData.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/FC_GET_REL_DEL_MOD_IN_TS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -f ./fc/install/scripts/seed/create_tabs.sql
echo "-------------------------- Finished FC Scripts Execution ---------------------------"
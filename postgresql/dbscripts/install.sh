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
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_data_tbs_storage="${MDMDBDATATBSSTORAGE}" -v mdm_data_index_storage="${MDMDBINDEXTBSSTORAGE}" -ef ./mdm/configure/create_tablespaces.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_user="${MDMDBUSER}" -v mdm_password="'${MDMDBPASSWORD}'" -ef ./mdm/configure/create_users.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db="${MDMINSTANCENAME}" -ef ./mdm/configure/create_database.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db_schema="${MDMDBSCHEMA}" -v pg_super_user="${PGUSER}" -v mdm_user="${MDMDBUSER}" -ef ./mdm/configure/create_schema.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/configure/create_extentions.sql

export PGUSER="${MDMDBUSER}"
export PGPASSWORD="${MDMDBPASSWORD}"
export PGDATABASE="${MDMINSTANCENAME}"

"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_user="${MDMDBUSER}" -v mdm_db_schema="${MDMDBSCHEMA}" -ef ./mdm/configure/alter_searchpath.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/install/scripts/ddl/create_sequeces.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/install/scripts/ddl/create_tables.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/ddl/create_PK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ENTERPRISE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ORGANIZATION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/DOMAIN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/DOMAINENTRY.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/RELEASE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/RESOURCEACCESS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/install/scripts/seed/CATALOGATTRIBUTEDATATYPE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/install/scripts/seed/CONFIGURATIONDEFINITION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/SCREEN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/FUNCTION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/HTMLELEMENTID.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/FUNC2IDMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/FUNC2SCREENMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ROLE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ROLE2FUNCMAP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/SUPPLIERSTATE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/WORKFLOWFORM.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/MEMBER.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/MEMBERSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/OBJECTSEQUENCE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ROLEASSIGNMENT.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/DOMAINLINK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/DOMAINVALUE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/ATTRIBUTEGROUP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/CATALOGFORMAT.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/CATALOGTYPE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/install/scripts/seed/CATALOGTYPEATTRIBUTE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/CATALOG.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/CATALOGATTRIBUTE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/PROCESSSELECTION.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/seed/HIVALUE.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/ddl/create_indexes.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/ddl/create_FK.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/ddl/create_views.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/ddl/create_functions.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./mdm/scripts/triggers/create_triggers.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -v mdm_db_instance_name="${MDMINSTANCENAME}" -v mdm_db_instance_desc="${MDMINSTANCEDESCRIPTION}" -ef ./mdm/MDMInstance.sql
echo "-------------------------- Finished MDM Scripts Execution ---------------------------"

# Launch the fc scripts
echo "------------------------------ Launching FC Scripts -------------------------------"
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/function_ac.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/SCREEN.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/FC_DEL_FROM_DBE_RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/FC_GET_DELETED_RELATIONSHIP.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/FC_TU_PROCESS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/FC_UPDATELIFECYCLESTATUS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/utility/ClearNamedversionData.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/FC_GET_REL_DEL_MOD_IN_TS.sql
"${PGSQL}" -U "${PGUSER}" -d "${PGDATABASE}" -ef ./fc/install/scripts/seed/create_tabs.sql
echo "-------------------------- Finished FC Scripts Execution ---------------------------"
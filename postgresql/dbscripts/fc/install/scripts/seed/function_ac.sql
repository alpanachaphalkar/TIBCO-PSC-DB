DO LANGUAGE plpgsql $$ 
DECLARE
 FUNC_ID smallint;
BEGIN
	SELECT COUNT(1) INTO FUNC_ID FROM FUNCTION WHERE NAME = 'catalogmenu_catalog_sync';
	IF FUNC_ID = 0 THEN 
		INSERT INTO FUNCTION ( ID, NAME, DESCRIPTION, FUNCTION)
		values ((select (max(id)+1)  from FUNCTION), 'catalogmenu_catalog_sync', 'FP Catalog Synchronization', 'catalogmenu_catalog_sync');
	END IF;

	SELECT COUNT(1) INTO FUNC_ID FROM FUNCTION WHERE NAME = 'catalogmenu_catalog_publish';
	IF FUNC_ID = 0 THEN 
		INSERT INTO FUNCTION ( ID, NAME, DESCRIPTION, FUNCTION)
		values ((select (max(id)+1)  from FUNCTION), 'catalogmenu_catalog_publish', 'Publish Catalog', 'catalogmenu_catalog_publish');
	END IF;

	SELECT COUNT(1) INTO FUNC_ID FROM FUNCTION WHERE NAME = 'catalogmenu_catalog_fc_export';
	IF FUNC_ID = 0 THEN 
		INSERT INTO FUNCTION ( ID, NAME, DESCRIPTION, FUNCTION)
		values ((select (max(id)+1)  from FUNCTION), 'catalogmenu_catalog_fc_export', 'Export FC Data', 'catalogmenu_catalog_fc_export');
	END IF;

	SELECT COUNT(1) INTO FUNC_ID FROM FUNCTION WHERE NAME = 'catalogmenu_catalog_fc_import';
	IF FUNC_ID = 0 THEN 
		INSERT INTO FUNCTION ( ID, NAME, DESCRIPTION, FUNCTION)
		values ((select (max(id)+1)  from FUNCTION), 'catalogmenu_catalog_fc_import', 'Import FC Data', 'catalogmenu_catalog_fc_import');
	END IF;
	
	SELECT COUNT(1) INTO FUNC_ID FROM FUNCTION WHERE NAME = 'catalogmenu_catalog_bulk_delete';
	IF FUNC_ID = 0 THEN 
		INSERT INTO FUNCTION ( ID, NAME, DESCRIPTION, FUNCTION)
		values ((select (max(id)+1)  from FUNCTION), 'catalogmenu_catalog_bulk_delete', 'Bulk Delete', 'catalogmenu_catalog_bulk_delete');
	END IF;	
	
END;
$$;
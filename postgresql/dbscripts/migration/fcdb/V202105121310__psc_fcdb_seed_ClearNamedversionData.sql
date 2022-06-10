CREATE OR REPLACE FUNCTION ClearNamedVersionData(ORG_NAME varchar(80)) RETURNS VOID AS $$
	DECLARE
		idOrganization ORGANIZATION.ID%TYPE;
	BEGIN
	
		RAISE NOTICE 'Organization Name:%',ORG_NAME;
		SELECT ID INTO idOrganization FROM ORGANIZATION WHERE lower(name) = lower(ORG_NAME);
		RAISE NOTICE 'Enterprise Id:%',idOrganization;

		DELETE FROM NAMEDVERSION WHERE OWNERID IN (SELECT ID FROM CATALOG WHERE SOURCEORGANIZATIONID = idOrganization AND TYPE = 'CATALOG' AND ACTIVE = 'Y');
		DELETE FROM NAMEDVERSION WHERE OWNERID = idOrganization;
	
		IF NOT FOUND THEN
			RAISE NOTICE 'No data found';
		END IF;
	END;
$$ LANGUAGE plpgsql;
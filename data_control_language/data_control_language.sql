/* note: these roles are examples and should not be actively implemented
 as they require superuser role */

-- create a database admin and set privileges for future schema objects
CREATE ROLE periodic_admin WITH CREATEROLE CREATEUSER;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA periodic TO periodic_admin
  WITH GRANT OPTION;
ALTER DEFAULT PRIVILEGES IN SCHEMA periodic
  GRANT ALL PRIVILEGES ON TABLES TO periodic_admin WITH GRANT OPTION ;

-- grant privileges to a data analyst
CREATE ROLE data_analyst WITH PASSWORD 'analyzeTHIS!';
GRANT SELECT ON ALL TABLES IN SCHEMA periodic TO data_analyst ;
ALTER DEFAULT PRIVILEGES IN SCHEMA periodic
  GRANT SELECT ON TABLES TO data_analyst ;

-- grant privileges to a data maintenance role
CREATE ROLE periodic_maintainer WITH PASSWORD 'justMAINTAINING!';
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA periodic TO periodic_maintainer ;
ALTER DEFAULT PRIVILEGES IN SCHEMA periodic
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO periodic_maintainer ;

-- revoke privileges from a user who has been fired
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA periodic TO former_employee CASCADE;
ALTER DEFAULT PRIVILEGES IN SCHEMA periodic
  REVOKE ALL PRIVILEGES ON TABLES TO former_employee CASCADE;

GRANT SELECT ON ALL TABLES IN SCHEMA year2024 TO mlbapi;
-- Required to load the data with the COPY command
GRANT INSERT ON ALL TABLES IN SCHEMA year2024 TO mlbapi;
-- Required in order to load the data with the COPY command
GRANT pg_read_server_files TO mlbapi;
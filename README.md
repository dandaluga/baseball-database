# Baseball Databank Database Load

This is an example repo that demonstrates the creation and loading of a PostgreSQL database. 

It uses data provided by the Baseball Databank (sometime referred to as the Lahman Database) that is located [here](https://www.seanlahman.com/baseball-archive/statistics/). Baseball Databank is a compilation of historical baseball data in a convenient, tidy format, distributed under Open Data terms.

The data has been downloaded from the site above and extracted into the folders described below. It has been broken down by year so that we can maintained each year when a season completes. So, for example, the 2022 database includes all years including the 2022 season ending stats. Once the next season is completed, a new schema will be generated and it will include all seasons including the newly generated season.

This is just an example of how to load data into a PostgreSQL database. It is provided as an example and learning expereince to get familiar with the PostgreSQL engine and capabilities.


## Organization of the files

Each year is broken down into a separate folder so we can segment season into it's own schema. So, as each season is completed, a new schema will be created (year20XX) to store the data for that year. This was done in the event the schema changes from one year to the next and we still have the data for the previous year in the schema that was valid for that year.

**These are the folders provided by the Baseball Databank for that year.**

These files are create by getting the zip file in CSV format from [here](https://github.com/chadwickbureau/baseballdatabank/tags). Then unzip the file and it will create these folders:

* `core/` contains the databank itself. 
* `contrib/` contains files which are manually maintained by others using the same identifier system as the core.
* `upstream/` contains files used to construct the databank.

**These are the database schema and data load scripts needed for that year.**

* baseball_schema.ddl contains the database schema needed to create the tables for the year being created.
* load_data.sql contains the data needed to load the schema for that year.
* drop_schema.sql contains the script to drop all the tables in a particular schema

## Loading the Database

The scripts below can be run sequentially to create the user, database, build the schema and load the data. Of course, you need to have a PostgreSQL cluster installed. At the time of this creation, it is using version 14.5. See the [here](POSTGRESQL.md) for more details about PostgreQL.

I used api2022 as the username which will be used to access the database via an API for the 2022 season data. As new seasons complete, I expect to create a new schema (example: year2023) and new username (example: api2023) for the new season of data. This is so we can isolate each new version of the data provided by the Baseball Databank without effecting previous completed seasons.

```shell
-- ============================================================================================================
-- CREATE THE CLUSTER
-- ============================================================================================================
-- To initialize the database cluster, create a folder and run the initdb script to create your cluster. The
-- postgres user is the default user and does not require a password. Note that this creates a database cluster
-- that will listen on the default port (5432). A single database cluster can contain many databases. So, you 
-- really only need to create a single cluster and can add many databasees to that cluster. You only need to run
-- this once. You can create multiple clusters but would need to specify a different port for each. You probably 
-- don't want this anyways. Note that this is creating the cluster with the superuser (postgres)
initdb -D ~/Development/db/baseball -U postgres

-- ============================================================================================================
-- START THE CLUSTER
-- ============================================================================================================
-- Use this to start the database cluster. Use the folder you created when initilaizing the database cluster 
pg_ctl -D ~/Development/db/baseball -l ~/Development/db/baseball/logfile start

-- ============================================================================================================
-- STOP THE CLUSTER
-- ============================================================================================================
-- Use this to start the database cluster. Use the folder you created when initilaizing the database cluster 
pg_ctl -D ~/Development/db/baseball -l ~/Development/db/baseball/logfile stop

-- ============================================================================================================
-- CREATE A DATABASE USER (ROLE)
-- ============================================================================================================
-- This will prompt for a password. I just used the ultra secure password, Obviously, this is something you
-- would not do for a real database running on a real server.
createuser -U postgres --no-createdb --no-superuser --no-createrole --pwprompt api2022

-- ============================================================================================================
-- CREATE THE DATABASE
-- ============================================================================================================
-- This will create a new database in your cluster and make the owner be the username you chose.
createdb -U postgres --owner=api2022 baseball

-- ============================================================================================================
-- CREATE SCHEMA/TABLES
-- ============================================================================================================
-- This will create the database tables for the schema (year2022). At this point, you can use your favorite
-- SQL client see the structure of the tables.
psql -U api2022 -d baseball -f ~/Development/baseball-database/2022/baseball_schema.ddl

-- ============================================================================================================
-- LOAD DATA
-- ============================================================================================================
-- Need to use a username that has the privs to run the load scripts
C:\PostgreSQL\14\bin\psql -U dd00865 -d baseball -f "c:\dev\baseball\database\2022\load_data.sql"
psql -U postgres -d baseball -f ~/Development/baseball-database/2022/load_data.sql

-- ============================================================================================================
-- THESE ARE ONLY NEEDED IF YOU WANT TO START OVER.
-- ============================================================================================================
-- Use this to drop the database. Be careful with the dropdb as this will delete ALL the schemas which will 
-- have all the years.
dropdb -U postgres baseball

-- This will drop all the tables in the schema. This is probably what you want so that your can recreate the 
-- schema and reload the data.
psql -U api2022 -d baseball -f ~/Development/baseball-database/2022/drop_schema.ddl

-- Probably not needed. You need to ensure there are no dependent objects tied to this user.
dropuser -U postgres api2022
```






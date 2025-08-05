

# Baseball Reference Database Load (aka the Lahman Database)

This is an example repo that demonstrates the creation and loading of a PostgreSQL database. 

It uses data provided by the Society for American Baseball Research (SABR) that is located [here](https://sabr.org/lahman-database/). The SABR organization creates the database yearly. Each year will include the stats from the previous season.

The data has been downloaded from the site above and extracted into the folders described below. It has been broken down by year so that we can maintained each year when a season completes. So, for example, the 2024 database includes all years including the 2024 season ending stats. Once the next season is completed, a new schema will be generated and it will include all seasons including the newly generated season.

This is just an example of how to load data into a PostgreSQL database. The baseball data contained here is open source and free to use. It is provided as an example and learning expereince to get familiar with the PostgreSQL engine and capabilities.


## Organization of the files

Each year is broken down into a separate folder so we can segment season into it's own schema. So, as each season is completed, a new schema will be created (year20XX) to store the data for that year. This was done in the event the schema changes from one year to the next and we still have the data for the previous year in the schema that was valid for that year.

**These are the files are provided by the SABR by year.**

These files are acquired by downloading the CSV files from [here](https://sabr.app.box.com/s/rsry2en86bimvybwsorumfsxmf91002a). I put
the files in the data folder.

**These are the database schema and data load scripts needed for that year.**

* 01_create_schema.ddl contains the database schema needed to create the tables for the year being created.
* 02_create_views.ddl contains any views needed to support additional queries.
* 03_grant_privledges.ddl grants the needed security privledges.
* 04_load_data_mac.sql contains the scripts needed to load the csv data files on MacOS.
* 04_load_data_win.sql contains the scripts needed to load the csv data files on Windows.
* drop_schema.sql contains the script to drop all the tables in a particular schema

## Loading the Database (Windows)

Read the PostgreSQL installation notes located [here](INSTALL.md).

#### Check the Version

------

```shell
C:\PostgreSQL\17\bin\pg_ctl --version
```

#### Create a New Database Cluster

------

See: https://www.postgresql.org/docs/17/app-initdb.html

```powershell
C:\PostgreSQL\17\bin\initdb -D c:\dev\db-data\postgresql\17 -U postgres -E UTF8
```

#### Start/Stop Cluster

------

```powershell
C:\PostgreSQL\17\bin\pg_ctl -D c:\dev\db-data\postgresql\17 -l logfile start
C:\PostgreSQL\17\bin\pg_ctl -D c:\dev\db-data\postgresql\17 -l logfile stop
```

#### Loading Baseball Reference Database

```powershell
-- This will create a user that matches the username that I am logged in as (dd00865).
-- The postgres user is the default superuser created during the installation that has
-- the privileges to create this user. The dd00865 user will have the ability to create
-- the database and the role for the rest of the script.
C:\PostgreSQL\17\bin\createuser --superuser --createdb --createrole --pwprompt dd00865 -U postgres

-- This will prompt for a password. I just used password. This is the user (mlbapi) that the api 
-- will use to query the database
C:\PostgreSQL\17\bin\createuser --no-createdb --no-superuser --no-createrole --pwprompt mlbapi

-- Create the database
C:\PostgreSQL\17\bin\createdb lahman -E UTF8

-- Create the table structure for the specific year. This will also create the schema (owner).
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2022\scripts\create_schema.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2023\scripts\create_schema.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2024\scripts\01_create_schema.ddl

-- Create any required views.
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2022\scripts\create_views.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2023\scripts\create_views.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2024\scripts\02_create_views.ddl

-- Grant privledges to the mlbapi user
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2022\scripts\grant_privledges.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2023\scripts\grant_privledges.ddl
C:\PostgreSQL\17\bin\psql -d lahman -f c:\dev\baseball\baseball-database\lahman\2024\scripts\03_grant_privledges.ddl

-- Need to use a username that has the privs to run the load scripts
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2022\scripts\load_data_win.sql
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2023\scripts\load_data_win.sql
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2024\scripts\04_load_data_win.sql

-- Drop the schema if you need to start over
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2022\drop_schema.ddl
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2023\scripts\drop_schema.ddl
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f c:\dev\baseball\baseball-database\lahman\2024\scripts\drop_schema.ddl

-- Use this to drop the database and the user to start over. This will delete ALL schemas.
C:\PostgreSQL\17\bin\dropdb lahman
C:\PostgreSQL\17\bin\dropuser mlbapi
```

### Loading Baseball Reference Database (MacOS)

#### Check the Version

------

```
pg_ctl --version
```

#### Create New Database Cluster

------

See: https://www.postgresql.org/docs/17/app-initdb.html

My username on my mac is dandaluga. I assume the postgresql installation creates a superuser based on the user that creates the cluster.

You can create multiple clusters on the server. In that case, you will need to update the postgresql.conf to handle the ports to use for
each cluster along with any other configuration to handle running multiple clusters concurrently.

```shell
initdb -D ~/Developer/db/cluster1 -U dandaluga -E UTF8
```

Here is the output:
```shell
The files belonging to this database system will be owned by user "dandaluga".
This user must also own the server process.

The database cluster will be initialized with locale "en_US.UTF-8".
The default database encoding has accordingly been set to "UTF8".
The default text search configuration will be set to "english".

Data page checksums are disabled.

creating directory /Users/dandaluga/Developer/db/cluster1 ... ok
creating subdirectories ... ok
selecting dynamic shared memory implementation ... posix
selecting default "max_connections" ... 100
selecting default "shared_buffers" ... 128MB
selecting default time zone ... America/Chicago
creating configuration files ... ok
running bootstrap script ... ok
performing post-bootstrap initialization ... ok
syncing data to disk ... ok

initdb: warning: enabling "trust" authentication for local connections
initdb: hint: You can change this by editing pg_hba.conf or using the option -A, or --auth-local and --auth-host, the next time you run initdb.

Success. You can now start the database server using:

    pg_ctl -D /Users/dandaluga/Developer/db/cluster1 -l logfile start
```

#### Start/Stop Cluster

------

```
pg_ctl -D /Users/dandaluga/Developer/db/cluster1 -l logfile start
pg_ctl -D /Users/dandaluga/Developer/db/cluster1 -l logfile stop
```

#### Loading Baseball Reference Database

------

```shell
-- Create a user. This will prompt for a password. I just used password.
createuser --no-createdb --no-superuser --no-createrole --pwprompt mlbapi

-- Create the database
createdb lahman

-- Create the table structure for the specific year. This will also create the schema (owner).
psql -d lahman -f ~/Developer/baseball-database/lahman/2022/create_schema.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/scripts/create_schema.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2024/scripts/create_schema.ddl

-- Create any required views.
psql -d lahman -f ~/Developer/baseball-database/lahman/2022/create_views.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/scripts/create_views.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2024/scripts/create_views.ddl

-- Grant privledges to the mlbapi user
psql -d lahman -f ~/Developer/baseball-database/lahman/2022/grant_privledges.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/scripts/grant_privledges.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2024/scripts/grant_privledges.ddl

-- Need to use a username that has the privs to run the load scripts
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2022/load_data_mac.sql
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2023/scripts/load_data_mac.sql
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2024/scripts/load_data_mac.sql

-- Drop the schema if you need to start over
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2022/drop_schema.ddl
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2023/scripts/drop_schema.ddl
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2024/scripts/drop_schema.ddl

-- Use this to drop the database and the user to start over. This will delete ALL schemas.
dropdb lahman
dropuser mlbapi
```


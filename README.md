

# Baseball Databank Database Load

This is an example repo that demonstrates the creation and loading of a PostgreSQL database. 

It uses data provided by the Baseball Databank (sometime referred to as the Lahman Database) that is located [here](http://www.seanlahman.com/). Baseball Databank is a compilation of historical baseball data in a convenient, tidy format, distributed under Open Data terms.

The data has been downloaded from the site above and extracted into the folders described below. It has been broken down by year so that we can maintained each year when a season completes. So, for example, the 2022 database includes all years including the 2022 season ending stats. Once the next season is completed, a new schema will be generated and it will include all seasons including the newly generated season.

This is just an example of how to load data into a PostgreSQL database. The baseball data contained here is freely open source for use and had no relevance to John Deere. It is provided as an example and learning expereince to get familiar with the PostgreSQL engine and capabilities.


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

## Loading the Database (Windows)

Read the PostgreSQL installation notes located [here](INSTALL.md).

#### Check the Version

------

```shell
C:\PostgreSQL\17\bin\pg_ctl --version
```

#### Create New Database Cluster

------

See: https://www.postgresql.org/docs/17/app-initdb.html

```powershell
C:\PostgreSQL\17\bin\initdb -D c:\dev\db-data\postgresql\17 -U postgres
```

#### Start/Stop Cluster

------

```powershell
C:\PostgreSQL\17\bin\pg_ctl -D c:\dev\db-data\postgresql\17 -l logfile start
C:\PostgreSQL\17\bin\pg_ctl -D c:\dev\db-data\postgresql\17 -l logfile stop
```

#### Loading Baseball Reference Database

```shell
-- This will prompt for a password. I just used password
C:\PostgreSQL\17\bin\createuser --no-createdb --no-superuser --no-createrole --pwprompt mlbapi

-- Create the database
C:\PostgreSQL\17\bin\createdb lahman

-- Create the table structure for the specific year. This will also create the schema (owner).
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2022\create_schema.ddl"
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2023\create_schema.ddl"

-- Create any required views.
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2022\create_views.ddl"
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2023\create_views.ddl"

-- Grant privledges to the mlbapi user
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2022\grant_privledges.ddl"
C:\PostgreSQL\17\bin\psql -d lahman -f "c:\dev\baseball\database\lahman\2023\grant_privledges.ddl"

-- Need to use a username that has the privs to run the load scripts
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f "c:\dev\baseball\database\lahman\2022\load_data_win.sql"
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f "c:\dev\baseball\database\lahman\2023\load_data_win.sql"

-- Drop the schema if you need to start over
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f "c:\dev\baseball\database\lahman\2022\drop_schema.ddl"
C:\PostgreSQL\17\bin\psql -U mlbapi -d lahman -f "c:\dev\baseball\database\lahman\2023\drop_schema.ddl"

-- Use this to drop the database and the user to start over. This will delete ALL schemas.
C:\PostgreSQL\17\bin\dropdb lahman
C:\PostgreSQL\17\bin\dropuser mlbapi
```

### Loading Baseball Reference Database (Mac/OS)

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
initdb -D ~/Developer/db/cluster1 -U dandaluga
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
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/create_schema.ddl

-- Create any required views.
psql -d lahman -f ~/Developer/baseball-database/lahman/2022/create_views.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/create_views.ddl

-- Grant privledges to the mlbapi user
psql -d lahman -f ~/Developer/baseball-database/lahman/2022/grant_privledges.ddl
psql -d lahman -f ~/Developer/baseball-database/lahman/2023/grant_privledges.ddl

-- Need to use a username that has the privs to run the load scripts
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2022/load_data_mac.sql
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2023/load_data_mac.sql

-- Drop the schema if you need to start over
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2022/drop_schema.ddl
psql -U mlbapi -d lahman -f ~/Developer/baseball-database/lahman/2023/drop_schema.ddl

-- Use this to drop the database and the user to start over. This will delete ALL schemas.
dropdb lahman
dropuser mlbapi
```


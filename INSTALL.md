## PostgreSQL Installation

### Overview

------

- A cluster contains one or more databases. 
- A database contains one or more schemas. 
- A schema contains tables, views, functions, etc.

Concepts

- Cluster/Server (Use initdb)
- User/Role (Use createuser)
- Database (Use createdb include the role you created with createuser)
- Schema (Use CREATE SCHEMA sql)
- Table (Use CREATE TABLE schema_name.table_name)

### Windows Installation Notes

------

For whatever reason, the chocolatey installation would fail. It ran for a while, and I suspect it failed when you 
tried to initialize a new database cluster. This error also happened when running the installation through the wizard.

```
choco install postgresql17--params '/Password:password'
```

As a result, I just downloaded the executable from the [website](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) 

Version installed: postgresql-17.5-2-windows-x64.exe

Run the install as admin

Install to: C:\PostgreSQL\17

I prefer to have an installation without spaces (like "Program File"). This just makes it easier to work with the command line tools.

When you run the installer, you will be prompted to select the components to install.

Select all options:

- PostgreSQL Server
- pgAdmin4
- Stack Builder
- Command Line Utilities

Select a data directory for the server. I chose C:\dev\db-data\postgresql\17

Choose a password for your superuser (postgres)

Keep the default PostgreSQL port of 5432

For Locale, choose: [Default locale]

**PostgreSQL 17**

```
Installation Directory: C:\PostgreSQL\17
Server Installation Directory: C:\PostgreSQL\17
Data Directory: C:\dev\db-data\postgresql\17
Database Port: 5432
Database Superuser: postgres
Operating System Account: NT AUTHORITY\NetworkService
Database Service: postgresql-x64-17
Command Line Tools Installation Directory: C:\PostgreSQL\17
pgAdmin4 Installation Directory: C:\PostgreSQL\17\pgAdmin 4
Stack Builder Installation Directory: C:\PostgreSQL\17
Installation Log: C:\Users\dd00865\AppData\Local\Temp\install-postgresql.log
```

You might get an error that initializing the database cluster failed. Not a big deal as we will create the database server in the following steps.

### Mac/OS Installation Notes

------

I use brew on my Mac and typically prefer that method to install software.

```shell
brew install postgresql@17
```

Installation output from the brew install.

```shell
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql@17

When uninstalling, some dead symlinks are left behind so you may want to run:
  brew cleanup --prune-prefix

postgresql@17 is keg-only, which means it was not symlinked into /opt/homebrew,
because this is an alternate version of another formula.

If you need to have postgresql@17 first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"' >> ~/.zshrc

For compilers to find postgresql@17 you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@17/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@17/include"

To start postgresql@17 now and restart at login:
  brew services start postgresql@17
Or, if you don't want/need a background service you can just run:
  LC_ALL="C" /opt/homebrew/opt/postgresql@17/bin/postgres -D /opt/homebrew/var/postgresql@17
```

Brew installs postgresql to the following folder.

```shell
/opt/homebrew/Cellar/postgresql@17/17.2/bin
```

To add the pg commands to your path, run the following (I am using zsh). You might need to reload your shell to ensure that it has been added to your path.

```shell
echo 'export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"' >> ~/.zshrc

```

Run the following to confirm the installation. 

```shell
pg_ctl --version
```


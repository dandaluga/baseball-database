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

For whatever reason, the chocolatey install would fail. It ran for a while and I suspect it failed when you tried to initialize a new database cluster. This error also happened when running the install thru the wizard.

```
choco install postgresql16 --params '/Password:password'
```

As a result, I just downloaded the executable from the [website](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads) 

Version installed: postgresql-16.1-1-windows-x64.exe

Run the install as admin

Install to: C:\PostgreSQL\16

Want to eliminate spaces, like "Program File" that can make it just a tad more difficult when run command line utilities.

Select all options:

- PostgreSQL Server
- pgAdmin4
- Stack Builder
- Command Line Utilities

Select a data directory for the server. I chose C:\dev\db-data\postgresql\16

Choose a password for your superuser (postgres)

Keep the default PostgreSQL port of 5432

For Locale, choose: [Default locale]

**PostgreSQL 16**

```
Installation Directory: C:\PostgreSQL\16
Server Installation Directory: C:\PostgreSQL\16
Data Directory: C:\dev\db-data\postgresql\16
Database Port: 5432
Database Superuser: postgres
Operating System Account: NT AUTHORITY\NetworkService
Database Service: postgresql-x64-16
Command Line Tools Installation Directory: C:\PostgreSQL\16
pgAdmin4 Installation Directory: C:\PostgreSQL\16\pgAdmin 4
Stack Builder Installation Directory: C:\PostgreSQL\16
Installation Log: C:\Users\dd00865\AppData\Local\Temp\install-postgresql.log
```

You might get an error that initializing the database cluster failed. Not a bid deal as we will create the database server in the following steps.

### Mac/OS Installation Notes

------

I use brew on my Mac and typically prefer that method to install software.

```shell
brew install postgresql@16
```

Installation output from the brew install.

```shell
➜  baseball brew install postgresql@16
==> Downloading https://ghcr.io/v2/homebrew/core/postgresql/16/manifests/16.1_3
Already downloaded: /Users/dandaluga/Library/Caches/Homebrew/downloads/92ea62de308e8f2c4f9eb3c32e8a86b20fe3263ac53d55807c993db3971c18f1--postgresql@16-16.1_3.bottle_manifest.json
==> Fetching postgresql@16
==> Downloading https://ghcr.io/v2/homebrew/core/postgresql/16/blobs/sha256:eaea85a1a4d2b4ee61a3b01c93bc2e8453d6179163efbb7efb9527e0cc5fbd56
Already downloaded: /Users/dandaluga/Library/Caches/Homebrew/downloads/6b0fd373ad8aa19f8263def7487ac267c6fc8f3ac685cfbfb6b1c1c2d8d7476e--postgresql@16--16.1_3.arm64_sonoma.bottle.tar.gz
==> Pouring postgresql@16--16.1_3.arm64_sonoma.bottle.tar.gz
==> Caveats
This formula has created a default database cluster with:
  initdb --locale=C -E UTF-8 /opt/homebrew/var/postgresql@16
For more details, read:
  https://www.postgresql.org/docs/16/app-initdb.html

postgresql@16 is keg-only, which means it was not symlinked into /opt/homebrew,
because this is an alternate version of another formula.

If you need to have postgresql@16 first in your PATH, run:
  echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc

For compilers to find postgresql@16 you may need to set:
  export LDFLAGS="-L/opt/homebrew/opt/postgresql@16/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/postgresql@16/include"

To start postgresql@16 now and restart at login:
  brew services start postgresql@16
Or, if you don't want/need a background service you can just run:
  LC_ALL="C" /opt/homebrew/opt/postgresql@16/bin/postgres -D /opt/homebrew/var/postgresql@16
==> Summary
🍺  /opt/homebrew/Cellar/postgresql@16/16.1_3: 3,796 files, 68.4MB
==> Running `brew cleanup postgresql@16`...
Disable this behaviour by setting HOMEBREW_NO_INSTALL_CLEANUP.
Hide these hints with HOMEBREW_NO_ENV_HINTS (see `man brew`).
```

Brew installs postgresql to the following folder.

```shell
/opt/homebrew/Cellar/postgresql@16/16.1_3/bin
```

To add the pg commands to your path, run the following (I am using zsh). You might need to reload your shell to ensure that it has been added to your path.

```shell
echo 'export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"' >> ~/.zshrc
```

Run the following to confirm the installation. 

```shell
pg_ctl --version
```


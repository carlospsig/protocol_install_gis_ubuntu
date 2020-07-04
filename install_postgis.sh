
##### Add Key to /etc/apt/sources.list.d/pgdg.list
sudo nano /etc/apt/sources.list.d/pgdg.list
## Add new line to add this repository
deb http://apt.postgresql.org/pub/repos/apt bionic-pgdg main
##
sudo apt-get install curl ca-certificates gnupg
curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

###### PostgresSQL, PostGIS, pgRouting & pgAdmin For PostgreSQL 10 PostGIS 2.5
sudo apt-get update
sudo apt-get install -y postgresql-10 postgresql-contrib postgresql-10-postgis-2.5 postgresql-10-postgis-2.5-scripts postgresql-10-pgrouting pgadmin4

###### Setting postgreSQL, edit the files pg_hba.conf & postgresql.conf

sudo nano /etc/postgresql/10/main/postgresql.conf
# or sudo gedit /etc/postgresql/10/main/postgresql.conf
## uncomment the next line
   listen_addresses = '*'
# exit and save

sudo nano /etc/postgresql/10/main/pg_hba.conf
# or sudo gedit /etc/postgresql/10/main/pg_hba.conf
## Add new line to open all IP to acces to data base
   host     all     all        0.0.0.0/0      md5
# exit and save

# You have to restart the postgresql service to see the configuration changes
service postgresql restart

###### Create database, user & activate extensions

# Create new user (pe: gisadmin) with administrator permissions:
sudo -u postgres psql
postgres= # Add the next SQL sentences
# create new su user
CREATE ROLE gisadmin login PASSWORD 'your_password' SUPERUSER CREATEDB CREATEROLE NOINHERIT;
# Activate the next extensions
CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;
\q  # To exit the postgres console, the exit command also works

# Optionally you can leave a new database created
CREATE DATABASE gis_curso TEMPLATE postgres OWNER gisadmin;

# Run the following command on Linux to see open ports:
sudo lsof -i -P -n | grep LISTEN


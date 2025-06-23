
##### Add new repository
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
#### Sign the Public Key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7FCC7D46ACCC4CF8

#### Update the repositories
sudo apt-get update

###### PostgresSQL, PostGIS, pgRouting & pgAdmin For PostgreSQL 10 PostGIS 2.5
## To install PostgreSQL 15
sudo apt-get install -y postgresql-17 postgresql-contrib postgresql-17-postgis-3 postgresql-17-postgis-3-scripts postgresql-17-pgrouting

###### Setting postgreSQL, edit the files pg_hba.conf & postgresql.conf

sudo nano /etc/postgresql/17/main/postgresql.conf
## uncomment the next line
listen_addresses = '*'
# exit and save

sudo nano /etc/postgresql/17/main/pg_hba.conf
## Add new line at the last line, to open all IP to acces to data base
host     all     all        0.0.0.0/0      scram-sha-256
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
CREATE EXTENSION postgis_raster;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;

# Optionally you can leave a new database created
CREATE DATABASE gis_nombre TEMPLATE postgres OWNER gisadmin;

\q  # To exit the postgres console, the exit command also works

# Run the following command on Linux to see open ports:
sudo lsof -i -P -n | grep LISTEN
sudo lsof -i:5432 ## see a specific port such as 5432 ##

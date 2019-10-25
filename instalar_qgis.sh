## Steps to install QGIS for Ubuntu

## 1st step - Edit repository:
sudo gedit /etc/apt/sources.list

## Add the next news lines (option A o B)

## To know your codename
lsb_release -cd

replace your codename 

## OPTION A -- QGIS for testing for Ubuntu
deb     http://qgis.org/debian-nightly-release codename main
deb-src http://qgis.org/debian-nightly-release codename main

## OPTION B - QGIS Release with ubuntugis dependencies for Ubuntu
deb	     http://qgis.org/ubuntugis codename main
deb-src  http://qgis.org/ubuntugis codename main

## Update paquets
sudo apt-get update

## Uninstall QGIS
sudo apt-get remove qgis python-qgis
sudo apt-get purge qgis python-qgis

## Update paquetes
sudo apt-get update

## Install QGIS full (saga, grass, python-qgis, etc.)
sudo apt-get install -y qgis saga grass python-qgis qgis-plugin-grass grass-doc

## Pasos per instal·lar QGIS distribució Ubuntu

## Si tenim Ubuntu 14.04 (LTS) trusty

## Primero editar los repositorios:
sudo gedit /etc/apt/sources.list

## QGIS for testing for Ubuntu 14.04 LTS
deb      http://qgis.org/debian-nightly trusty main
deb-src  http://qgis.org/debian-nightly trusty main

## QGIS Release with ubuntugis dependencies for Ubuntu 14.04 LTS
deb	     http://qgis.org/ubuntugis trusty main
deb-src  http://qgis.org/ubuntugis trusty main

## Primero desinstalar si tenemos instalado otra versión de ubuntu (12.04 precise, 15.05 vivid)
## Esto pasará si hacemos una actualización completa
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get upgrade

## Desinstalamos QGIS
sudo apt-get remove qgis python-qgis
sudo apt-get purge qgis python-qgis

## Después actualizar paquetes
sudo apt-get update

## Seguidamente instal·lar qgis
sudo apt-get install qgis python-qgis

## with grass
sudo apt-get install qgis python-qgis qgis-plugin-grass


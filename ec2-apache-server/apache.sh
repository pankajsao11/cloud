#!/bin/bash

#for ubuntu update

sudo apt update -y

#install apache
sudo apt install apache2 -y

#enable and start apache

sudo systemctl start apache2
sudo systemctl enable apache2

#navigate to the html folder that apache creates on install
cd /var/www/html

#sudo mkdir Css
#sudo mkdir Scripts

#create index.html file and change file permissions
touch index.html
sudo chmod 775 index.html

sudo echo '<html> <body> <h1> Hello! Apache server successfully started! </h1> </body> </html>' > index.html

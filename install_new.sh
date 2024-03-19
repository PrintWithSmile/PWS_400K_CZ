#!/bin/bash

cd /home/pi/PWS

# Clone the PWS_400K_CZ repository
sudo git clone https://github.com/PrintWithSmile/PWS_400K_CZ.git

cd /home/pi/printer_data/config/

sudo mkdir /home/pi/printer_data/config/PWS_config
sudo mkdir /home/pi/printer_data/config/Archive

sudo rm moonraker.conf
sudo rm crowsnest.conf
sudo rm printer.cfg

sudo cp /home/pi/PWS/PWS_400K_CZ/printer.cfg /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_CZ/crowsnest.conf /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_CZ/moonraker.conf /home/pi/printer_data/config/
sudo cp /home/pi/PWS/PWS_400K_CZ/konfigurace/* /home/pi/printer_data/config/PWS_config/

sudo chown -R pi:pi /home/pi/PWS
sudo chown -R pi:pi /home/pi/printer_data/config

sudo service klipper restart
sudo service moonraker restart

echo "PWS installation completed successfully."

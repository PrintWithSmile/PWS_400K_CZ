#!/bin/bash

echo "Zálohuji předchozí konfigurace"
cd /home/pi/printer_data/config
zip -r "zaloha_$(date +"%d-%m-%Y").zip" /home/pi/printer_data/config/* -x "/home/pi/printer_data/config/Archive/*" -x "/home/pi/printer_data/config/Archive"
mv "zaloha_$(date +"%d-%m-%Y").zip" /home/pi/printer_data/config/Archive
cp -f /home/pi/PWS/PWS_400K_CZ/Konfigurace/* /home/pi/printer_data/config/PWS_config/

echo "Restartuji klipper pro načtení nových konfigurací"
service klipper restart

echo "Update hotový"

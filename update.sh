#!/bin/bash


ARCHIVE_FOLDER="/home/pi/printer_data/config/Archive"
PWS_FOLDER="/home/pi/printer_data/config/PWS_config"
ALL_CONFIG="/home/pi/printer_data/config"

	
echo "Zálohuji předchozí konfigurace"
cd "$ALL_CONFIG"
zip -r "zaloha_$(date +"%d-%m-%Y").zip" /home/pi/printer_data/config/* -x "/home/pi/printer_data/config/Archive/*"
mv "zaloha_$(date +"%d-%m-%Y").zip" "$ARCHIVE_FOLDER"
cp -f /home/pi/PWS/PWS_400K_CZ/Konfigurace/* /home/pi/printer_data/config/PWS_config/

echo "Restartuji klipper pro načtení nových konfigurací"
service klipper restart

echo "Update hotový"

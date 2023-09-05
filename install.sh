#!/bin/bash

PWS_FOLDER="/home/pi/PWS/PWS_400K_CZ/"
HOOKS_FOLDER="/home/pi/PWS/PWS_400K_CZ/.git/hooks"
ARCHIVE_FOLDER="/home/pi/printer_data/config/Archive"
CONFIG_FOLDER="/home/pi/printer_data/config/PWS_config"
ALL_CONFIG="/home/pi/printer_data/config"

hook='#!/bin/sh
rm /home/pi/PWS/update_conf.sh
cp -f /home/pi/PWS/PWS_400K_CZ/update.sh /home/pi/PWS/update_conf.sh
cd /home/pi/PWS
chmod +x update_conf.sh 
./update_conf.sh
'

###################################################################################################

echo "Hledam slozky, pokud nejsou vytvorim je..."
if [ ! -d "$CONFIG_FOLDER" ]; then
	mkdir -p "$CONFIG_FOLDER"
fi	
 
if [ ! -d "$ARCHIVE_FOLDER" ]; then
    mkdir -p "$ARCHIVE_FOLDER"
fi
echo "Hotovo"

###################################################################################################

echo "Vytvarim aktualizacni skript"
if [ ! -d "$HOOKS_FOLDER/post-merge" ]; then
cd "$HOOKS_FOLDER"
echo "$hook" |  tee /home/pi/PWS/PWS_400K_CZ/.git/hooks/post-merge > /dev/null
chmod +x post-merge
fi
echo "Hotovo"

###################################################################################################

echo "Kopiruji konfiguracni soubory pro PWS tiskárnu"
cd "ALL_CONFIG" 
rm printer.cfg moonraker.cfg
cp /home/pi/PWS/PWS_400K_CZ/printer.cfg /home/pi/printer_data/config/
cp /home/pi/PWS/PWS_400K_CZ/moonraker.cfg /home/pi/printer_data/config/
cp /home/pi/PWS/PWS_400K_CZ/konfigurace/* /home/pi/printer_data/config/PWS_config/
service klipper restart

###################################################################################################

echo "Hotovo, vse dokonceno"
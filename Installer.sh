#!/bin/sh

echo "Enter path to Steam directory (surround with /):"
read steamlib
echo "Enter wine user (default for steam is 'steamuser':)"
read user
export USER=$user
echo Exported USER as $user
echo Enter path to executable:
read Exec
echo Enter Steam game ID (10090 for World at War):
read gameid
echo Running executable:
WINEPREFIX="$steamlib/Steam/steamapps/compatdata/$gameid/pfx/" wine "$Exec"

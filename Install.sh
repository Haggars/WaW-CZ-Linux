#!/bin/sh

steamdir=$(zenity --file-selection --title "Select Steam Parent Folder" --directory)

echo "$steamdir"

wineuser=$(zenity --entry --text "Enter Wine User (default is steamuser)" --title "Wine User" --entry-text "")

echo "$wineuser"

exec=$(zenity --file-selection --file-filter=*.exe --title "Select Executable")

echo "$exec"


gameid=$(zenity --entry --text "Enter Steam game ID (10090 for World at War)" --title "Game ID" --entry-text "")

echo "$gameid"





(
echo "# Running Installer."
WINEPREFIX="$steamdir/Steam/steamapps/compatdata/$gameid/pfx" wine "$exec"

echo "# All Done." ; sleep 2
echo "100"
) |
zenity --progress \
  --title="Installing" \
  --text="Running Installer." \
  --auto-close \
  --pulsate

(( $? != 0 )) && zenity --error --text="Error in zenity command."

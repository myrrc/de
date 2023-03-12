#!/bin/bash
sudo apt install libmp3lame0 libxml2 curl
sudo rm -fr /opt/reaper; sudo mkdir /opt/reaper; sudo chown -R $(whoami) /opt/reaper
wget http://reaper.fm/files/6.x/reaper677_linux_x86_64.tar.xz -Oreaper.tar.xz; tar -xf reaper.tar.xz
mv -t/opt/reaper/ reaper_linux_x86_64/REAPER/{InstallData,Plugins,Resources,rea*,libSwell.so}
ln -s ~/de/client/REAPER/libSwell.colortheme /opt/reaper/libSwell.colortheme
/opt/reaper/reaper

rm -fr reaper.tar.xz reaper_linux_x86_64 /opt/reaper/InstallData \
    ~/.config/REAPER/Data/{toolbar_icons,track_icons,amp_models,joystick_midi,seqbaby_data} \
    ~/.config/REAPER/{ColorThemes/D*,Scripts/Cockos/D*,OSC,KeyMaps,MIDINoteNames,MouseMaps,LangPack,Cursors}

wget https://github.com/cfillion/reapack/releases/download/v1.2.4.3/reaper_reapack-x86_64.so \
    -P ~/.config/REAPER/UserPlugins

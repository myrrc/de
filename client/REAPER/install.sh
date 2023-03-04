sudo apt install libmp3lame0

wget http://reaper.fm/files/6.x/reaper677_linux_x86_64.tar.xz -Oreaper.tar.xz
tar -xf reaper.tar.xz

sudo mkdir /opt/reaper; sudo chown -R $(whoami) /opt/reaper
mv reaper_linux_x86_64/REAPER/{InstallData, Plugins, Resources, rea*, libswell*} /opt/reaper/

/opt/reaper/reaper

# TODO check whether Data/toolbar_icons are replaced with theme icons
rm -fr reaper.tar.xz reaper_linux_x86_64 /opt/reaper/InstallData \
   #/opt/reaper/InstallData/{KeyMaps, OSC, ColorThemes, Scripts/Cockos/Default* } \
   #/opt/reaper/InstallData/Data/{track_icons, amp_models, joystick_midi, ix_keymaps, seqbaby_data}

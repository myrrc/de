# sudo apt remove $(dpkg-query --show 'linux-modules-*' | cut -f1 | grep -v "$(uname -r)")

echo 'APT::Install-Recommends "0" ; APT::Install-Suggests "0" ; ' > /etc/apt/apt.conf
echo "deb http://deb.debian.org/debian bullseye-backports main" > /etc/apt/sources.list.d/backports.list
apt update

apt install -t bullseye-backports \
  localepurge \
  zsh \
  sway swaybg swayidle dunst \
  man \
  git \
  dante-tools aerc

echo 'if [ "$(tty)" = "/dev/tty1" ] ; then
    export QT_QPA_PLATFORM=wayland MOZ_ENABLE_WAYLAND=1 MOZ_WEBRENDER=1 XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    exec sway
fi' > .profile

usermod --shell /bin/zsh myrrc

# apt install -t bullseye-backports ncdu lilypond

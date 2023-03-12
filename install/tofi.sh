git clone https://github.com/philj56/tofi
cd tofi; git checkout 570ea4ab9e7f8e3cb71dba199cb8fb46e1f58cdb # see https://github.com/philj56/tofi/issues/85
sudo apt install libfreetype-dev libcairo2-dev libpango1.0-dev libwayland-dev libxkbcommon-dev \
    libharfbuzz-dev scdoc wayland-protocols
pip3 install meson
CC=clang-15 meson build -Dbuildtype=release --prefix ~/.local; ninja -C build install
cd ..; rm -fr tofi

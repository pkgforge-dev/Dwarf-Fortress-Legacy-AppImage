#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
    glu          \
    sdl12-compat \
    sdl_image    \
    sdl_ttf

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano gtk2-mini libdecor-mini

echo "Getting app..."
echo "---------------------------------------------------------------"
wget https://bay12games.com/dwarves/df_47_05_linux.tar.bz2
tar -xvf df_47_05_linux.tar.bz2
rm -rf *.tar.bz2 df_linux/g_src df_linux/*.txt df_linux/README.linux df_linux/sdl

mkdir -p ./AppDir/bin
mv -v df_linux/* ./AppDir/bin

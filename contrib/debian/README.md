
Debian
====================
This directory contains files used to package raianetworkd/raianetwork-qt
for Debian-based Linux systems. If you compile raianetworkd/raianetwork-qt yourself, there are some useful files here.

## raianetwork: URI support ##


raianetwork-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install raianetwork-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your raianetwork-qt binary to `/usr/bin`
and the `../../share/pixmaps/raianetwork128.png` to `/usr/share/pixmaps`

raianetwork-qt.protocol (KDE)


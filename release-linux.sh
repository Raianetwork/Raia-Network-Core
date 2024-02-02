VERSION=4.4.4.2
rm -rf ./release-linux
mkdir release-linux

cp ./src/raianetworkd ./release-linux/
cp ./src/raianetwork-cli ./release-linux/
cp ./src/qt/raianetwork-qt ./release-linux/
cp ./RAIANETWORKCOIN_small.png ./release-linux/

cd ./release-linux/
strip raianetworkd
strip raianetwork-cli
strip raianetwork-qt

#==========================================================
# prepare for packaging deb file.

mkdir raianetworkcoin-$VERSION
cd raianetworkcoin-$VERSION
mkdir -p DEBIAN
echo 'Package: raianetworkcoin
Version: '$VERSION'
Section: base 
Priority: optional 
Architecture: all 
Depends:
Maintainer: Raianetwork
Description: Raianetwork coin wallet and service.
' > ./DEBIAN/control
mkdir -p ./usr/local/bin/
cp ../raianetworkd ./usr/local/bin/
cp ../raianetwork-cli ./usr/local/bin/
cp ../raianetwork-qt ./usr/local/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../RAIANETWORKCOIN_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
#!/usr/bin/env xdg-open

[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/local/bin/raianetwork-qt
Name=raianetworkcoin
Comment= raianetwork coin wallet
Icon=/usr/share/icons/RAIANETWORKCOIN_small.png
' > ./usr/share/applications/raianetworkcoin.desktop

cd ../
# build deb file.
dpkg-deb --build raianetworkcoin-$VERSION

#==========================================================
# build rpm package
rm -rf ~/rpmbuild/
mkdir -p ~/rpmbuild/{RPMS,SRPMS,BUILD,SOURCES,SPECS,tmp}

cat <<EOF >~/.rpmmacros
%_topdir   %(echo $HOME)/rpmbuild
%_tmppath  %{_topdir}/tmp
EOF

#prepare for build rpm package.
rm -rf raianetworkcoin-$VERSION
mkdir raianetworkcoin-$VERSION
cd raianetworkcoin-$VERSION

mkdir -p ./usr/bin/
cp ../raianetworkd ./usr/bin/
cp ../raianetwork-cli ./usr/bin/
cp ../raianetwork-qt ./usr/bin/

# prepare for desktop shortcut
mkdir -p ./usr/share/icons/
cp ../RAIANETWORKCOIN_small.png ./usr/share/icons/
mkdir -p ./usr/share/applications/
echo '
[Desktop Entry]
Version=1.0
Type=Application
Terminal=false
Exec=/usr/bin/raianetwork-qt
Name=raianetworkcoin
Comment= raianetwork coin wallet
Icon=/usr/share/icons/RAIANETWORKCOIN_small.png
' > ./usr/share/applications/raianetworkcoin.desktop
cd ../

# make tar ball to source folder.
tar -zcvf raianetworkcoin-$VERSION.tar.gz ./raianetworkcoin-$VERSION
cp raianetworkcoin-$VERSION.tar.gz ~/rpmbuild/SOURCES/

# build rpm package.
cd ~/rpmbuild

cat <<EOF > SPECS/raianetworkcoin.spec
# Don't try fancy stuff like debuginfo, which is useless on binary-only
# packages. Don't strip binary too
# Be sure buildpolicy set to do nothing

Summary: Raianetwork wallet rpm package
Name: raianetworkcoin
Version: $VERSION
Release: 1
License: MIT
SOURCE0 : %{name}-%{version}.tar.gz
URL: https://www.raianetworkcoin.net/

BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root

%description
%{summary}

%prep
%setup -q

%build
# Empty section.

%install
rm -rf %{buildroot}
mkdir -p  %{buildroot}

# in builddir
cp -a * %{buildroot}


%clean
rm -rf %{buildroot}


%files
/usr/share/applications/raianetworkcoin.desktop
/usr/share/icons/RAIANETWORKCOIN_small.png
%defattr(-,root,root,-)
%{_bindir}/*

%changelog
* Tue Aug 24 2021  Raianetwork Project Team.
- First Build

EOF

rpmbuild -ba SPECS/raianetworkcoin.spec




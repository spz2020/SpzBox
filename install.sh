#!/bin/bash
termux-change-repo
pkg upg
# 需要再执行
termux-change-repo
pkg cl
pkg in wget x11-repo 
pkg in 
wget https://github.com/spz2020/SpzBox/releases/download/glibc/glibc.tar.xz 
tar xf glibc.tar.xz -C $PREFIX
wget https://github.com/spz2020/SpzBox/releases/download/wine/wine-8.21-x86.tar.xz
tar xf wine-8.21-x86.tar.xz -C $HOME
mv ~/wine-8.21-x86 ~/wine
wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
chmod +x winetricks
mv winetricks $PREFIX/bin
echo 'export BOX86_PATH=~/wine/bin/
export BOX86_LD_LIBRARY_PATH=~/wine/lib/wine/i386-unix/:/data/data/com.termux/files/usr/glibc/lib/:/data/data/com.termux/files/usr/glibc/lib/i386-linux-gnu/' >> ~/.bashrc

source ~/.bashrc
echo '#!/data/data/com.termux/files/usr/bin/bash 
export LD_PRELOAD=
/data/data/com.termux/files/usr/glibc/bin/box86 '"$HOME/wine/bin/wine "'"$@"' > /data/data/com.termux/files/usr/bin/wine
source ~/.bashrc
echo '#!/data/data/com.termux/files/usr/bin/bash 
export LD_PRELOAD=
/data/data/com.termux/files/usr/glibc/bin/box86 '"$HOME/wine/bin/wine regedit "'"$@"' > /data/data/com.termux/files/usr/bin/regedit
echo '#!/data/data/com.termux/files/usr/bin/bash 
export WINEPREFIX=~/.wine32 LD_PRELOAD=
/data/data/com.termux/files/usr/glibc/bin/box86 '"$HOME/wine/bin/wine winecfg "'"$@"' > /data/data/com.termux/files/usr/bin/winecfg
echo '#!/bin/bash 
export BOX86_NOBANNER=1 WINE=wine WINESERVER=~/wine/bin/wineserver
wine '"/data/data/com.termux/files/usr/bin/winetricks "'"$@"' > /data/data/com.termux/files/usr/bin/winetricks32
chmod +x /data/data/com.termux/files/usr/bin/{wine*,regedit}
echo "安装结束 现在你可以输入wine并按回车检查是否生效"

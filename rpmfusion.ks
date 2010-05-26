# rpm fusion repo

repo --name=rpmfusion-free-released --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-13&arch=$basearch
repo --name=rpmfusion-free-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=free-fedora-updates-released-13&arch=$basearch
repo --name=rpmfusion-nonfree --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-13&arch=$basearch
repo --name=rpmfusion-nonfree-updates --mirrorlist=http://mirrors.rpmfusion.org/mirrorlist?repo=nonfree-fedora-updates-released-13&arch=$basearch
repo --name=livna --baseurl=http://rpm.livna.org/repo/13/$basearch
# --includepkgs=rpmfusion-nonfree-release
%packages
## RPM Fusion packages normally come via comps.xml, some adjustments below this line
rpmfusion-free-release
rpmfusion-nonfree-release
livna-release
gstreamer-plugins-bad
gstreamer-plugins-bad-nonfree

ffmpeg
lame
libdvdcss
k9copy
vlc
smplayer
h264enc
mencoder
avidemux-gtk
avidemux-qt
xine-lib-extras-freeworld
x264
traverso
vobcopy

Cg
ogre-cg
unace
paintdotnet
VirtualBox-OSE

# Hardware support
akmod-kqemu
akmod-nvidia
akmod-wl
akmod-*
%end

%post
echo "== RPM Fusion Free: Base section =="
echo "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-*-primary
echo "List of packages from RPM Fusion Free:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 855099b249c8885a -e ad2708448fcff4da | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 855099b249c8885a -e ad2708448fcff4da | awk ' { print $1 } ') | sort -n
echo

echo "== RPM Fusion Nonfree: Base section =="
echo "Importing RPM Fusion keys"
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-*-primary
echo "List of packages from RPM Fusion Nonree:"
rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk ' { print $1 } ' | sort
echo "List of incuded RPM Fusion packages with their size:"
rpm -q --qf '%{SIZE} %{NAME}\n' $(rpm -qa --qf '%{NAME} %{SIGGPG:pgpsig} %{SIGPGP:pgpsig} \n' | grep -e 206f8182b1981b68 -e 4d2a1bdc8dc43844 | awk ' { print $1 } ') | sort -n
echo
%end


# rpm fusion repo

repo --name=rpmfusion-free --baseurl=file:///home/yum_repos/rpmfusion-free
repo --name=rpmfusion-nonfree --baseurl=file:///home/yum_repos/rpmfusion-nonfree

%packages
## RPM Fusion packages normally come via comps.xml, some adjustments below this line
gstreamer-plugins-bad
gstreamer-plugins-bad-extras
ffmpeg
vlc
smplayer
#Cg

# Hardware support
#akmod*
#xorg-x11-drv-fglrx
#xorg-x11-drv-nvidia
#xorg-x11-drv-nvidia-173xx
#xorg-x11-drv-nvidia-96xx
#xorg-x11-drv-nvidia-beta
#broadcom-wl
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


FROM resin/rpi-raspbian

LABEL maintainer="voldedore"

ENV VERSION 0.2.1

# Add mirror for vietnam location
RUN echo "deb http://mirrors.vinahost.vn/raspbian/raspbian jessie main contrib non-free rpi firmware" >> /etc/apt/sources.list

# Install prerequisite
RUN apt-get update
RUN apt-get install apt-utils wget dialog

# Add OMV repo
RUN echo "deb http://packages.openmediavault.org/public erasmus main" | sudo tee -a /etc/apt/sources.list.d/openmediavault.list
RUN wget -O - http://packages.openmediavault.org/public/archive.key | apt-key add -

# Install OMV dependencies
RUN apt-get update
RUN apt-get install openmediavault-keyring postfix php-apc perl libjs-extjs6 php5-fpm libpam-modules php5-cgi php5-cli php5-pam sudo ethtool python3-dialog acl ifenslave iproute2 xfsprogs jfsutils ntfs-3g hdparm sdparm ifupdown mdadm postfix libsasl2-modules bsd-mailx python3-dbus cpufrequtils rsyslog logrotate smartmontools openssl openssh-server openssh-blacklist-extra uuid tzdata nfs-kernel-server proftpd-basic wget util-linux samba samba-common-bin rsync apt-utils net-tools snmpd avahi-daemon libnss-mdns iptables monit acpid beep gdisk rrdtool collectd cron anacron cron-apt quota quotatool whiptail lvm2 watchdog ca-certificates perl libjson-perl liblocale-po-perl proftpd-mod-vroot libjavascript-minifier-xs-perl coreutils xmlstarlet mount parted bash diffutils lsof socat rrdcached locales nginx bash-completion python3 python3-apt pm-utils wpasupplicant systemd systemd-sysv samba-vfs-modules pciutils python3-pyudev python3-natsort jq ntp python3-netifaces udev apt-transport-https python3-lxml btrfs-tools debconf init-system-helpers

# Workaround for resolvconf issue
RUN echo "resolvconf resolvconf/linkify-resolvconf boolean false" | debconf-set-selections

# Install OpenMediaVault
RUN apt-get install openmediavault

# Install OMV Extras
RUN wget http://omv-extras.org/debian/pool/main/o/openmediavault-omvextrasorg/openmediavault-omvextrasorg_3.3.3_all.deb
RUN dpkg -i openmediavault-omvextrasorg_3.3.3_all.deb

# Install plugins
# Transmission BitTorrent
RUN apt-get install openmediavault-transmissionbt
# Add created user to `users` group
RUN usermod -a -G users debian-transmission

# Persistence volume: TODO: Keep settings thru update
VOLUME ["/data"]

# Command
CMD /bin/bash

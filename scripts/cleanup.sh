#!/bin/sh -eux

# remove previous kernels that yum/dnf preserved for rollback
dnf autoremove -y
dnf remove -y $(dnf repoquery --installonly --latest-limit=-1 -q)

# Remove development and kernel source packages
dnf -y remove gcc cpp kernel-devel kernel-headers;

# Clean up network interface persistence
rm -f /etc/udev/rules.d/70-persistent-net.rules;
mkdir -p /etc/udev/rules.d/70-persistent-net.rules;
rm -f /lib/udev/rules.d/75-persistent-net-generator.rules;
rm -rf /dev/.udev/;

for ndev in `ls -1 /etc/sysconfig/network-scripts/ifcfg-*`; do
    if [ "`basename $ndev`" != "ifcfg-lo" ]; then
        sed -i '/^HWADDR/d' "$ndev";
        sed -i '/^UUID/d' "$ndev";
    fi
done

# truncate any logs that have built up during the install
find /var/log -type f -exec truncate --size=0 {} \;

# # Remove Ansible and its dependencies.
# pip3 install pip-autoremove
# ln -s /usr/bin/pip3 /usr/bin/pip
# /usr/local/bin/pip-autoremove ansible -y
# rm -f /usr/bin/pip
# pip3 uninstall pip-autoremove -y

# we try to remove these in the ks file, but they're still there
# in the builds so let's remove them here to be sure :shrug:
#
# 12.2019 note: We can probably remove this now, but let's confirm it
dnf remove -y \
  aic94xx-firmware \
  atmel-firmware \
  bfa-firmware \
  ipw2100-firmware \
  ipw2200-firmware \
  ivtv-firmware \
  iwl1000-firmware \
  iwl3945-firmware \
  iwl4965-firmware \
  iwl5000-firmware \
  iwl5150-firmware \
  iwl6000-firmware \
  iwl6050-firmware \
  kernel-uek-firmware \
  libertas-usb8388-firmware \
  netxen-firmware \
  ql2xxx-firmware \
  rt61pci-firmware \
  rt73usb-firmware \
  zd1211-firmware \
  linux-firmware \
  microcode_ctl

dnf -y clean all;

# remove the install log
rm -f /root/anaconda-ks.cfg

# remove the contents of /tmp and /var/tmp
rm -rf /tmp/* /var/tmp/*

# Blank netplan machine-id (DUID) so machines get unique ID generated on boot.
truncate -s 0 /etc/machine-id

# clear the history so our install isn't there
export HISTSIZE=0
rm -f /root/.wget-hsts

sync

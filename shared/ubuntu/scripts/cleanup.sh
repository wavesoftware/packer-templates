dpkg-query -W --showformat='${Package}\n' | grep linux-image | grep -v $(uname -r) | xargs -I {} apt-get -y purge {}
dpkg-query -W --showformat='${Package}\n' | grep linux-headers | grep -v $(uname -r) | xargs -I {} apt-get -y purge {}
apt-get -y purge linux-image-extra-$(uname -r)
apt-get -y purge libgl1-mesa-dri
apt-get -y autoremove
apt-get -y clean

echo "cleaning up guest additions"
rm -rf VBoxGuestAdditions_*.iso VBoxGuestAdditions_*.iso.?

echo "cleaning up dhcp leases"
rm /var/lib/dhcp/*

echo "cleaning up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

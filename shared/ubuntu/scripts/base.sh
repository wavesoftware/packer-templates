apt-get update
apt-get -y upgrade
apt-get -y install linux-headers-$(uname -r)

sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile

echo "UseDNS no" >> /etc/ssh/sshd_config

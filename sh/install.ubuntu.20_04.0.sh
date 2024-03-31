# install.ubuntu.20_04.sh
# Description:
# - This script is used to create the blackstack user from a root user, into a fresh server running Ubuntu 20.04.
# Parameters:
# - $1: linux user blackstack password
#

# add user with password
useradd -p $(openssl passwd -1 $1) blackstack

# add blackstack to sudoers
usermod -aG sudo blackstack

# change hostname
hostname mp123

# edit /etc/ssh/sshd_config, enable the line "PasswordAuthentication yes"
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# restart ssh service
service ssh restart

# create home directory for blackstack
mkdir /home/blackstack

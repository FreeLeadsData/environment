# install.ubuntu.20_04.sh
# 
# Description:
# - This script is used to create the blackstack user from a root user, into a fresh server running Ubuntu 20.04.
# 
# Parameters:
# - $1: linux user blackstack password
# 

# raise exception of $1 is empty
if [ -z "$1" ]
then
    echo "Parameter \$1 is empty"
    exit 1
fi

echo "Password: $1"

# add user with password
useradd -p $(openssl passwd -1 $1) blackstack > ~/0.log 2>&1

# add blackstack to sudoers
usermod -aG sudo blackstack > ~/0.log 2>&1

# change hostname
hostname mp123 > ~/0.log 2>&1

# edit /etc/ssh/sshd_config, enable the line "PasswordAuthentication yes"
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config > ~/0.log 2>&1

# restart ssh service
service ssh restart > ~/0.log 2>&1

# create home directory for blackstack
#mkdir /home/blackstack

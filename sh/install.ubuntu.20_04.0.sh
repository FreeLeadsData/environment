# add user with password
useradd -p $(openssl passwd -1 SantoBartolo101) blackstack

# add blackstack to sudoers
usermod -aG sudo blackstack

# change hostname
hostname mp123

# edit /etc/ssh/sshd_config, enable the line "PasswordAuthentication yes"
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config

# restart ssh service
service ssh restart


# create a new user 'blackstack'
#sudo adduser blackstack

# add blackstack to sudoers
#sudo usermod -aG sudo blackstack

# switch to the new user
#sudo su - blackstack

# update packages
echo
echo "update packages"
sudo apt -y update
sudo apt -y upgrade

echo
echo "install required packages"
sudo apt install -y jq # install jq - required by the Zyte API
sudo apt install -y net-tools
sudo apt install -y gnupg2
sudo apt install -y nginx
sudo apt install -y sshpass
sudo apt install -y xterm
sudo apt install -y bc
sudo apt install -y unzip

# install cockroach CLI for local development environments
echo
echo "download cockroach CLI"
curl https://binaries.cockroachdb.com/cockroach-v21.2.10.linux-amd64.tgz | tar -xz && sudo cp cockroach-v21.2.10.linux-amd64/cockroach /usr/local/bin/;

# get private key for RVM
echo
echo "get private key for RVM"
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# move into a writable location such as the /tmp to download RVM
# download RVM
echo
echo "download rvm"
curl -sSL https://get.rvm.io -o rvm.sh

# install the latest stable Rails version
echo
echo "install rvm"
sudo bash rvm.sh

# First you need to add all users that will be using rvm to 'rvm' group,
# and logout - login again, anyone using rvm will be operating with `umask u=rwx,g=rwx,o=rx`.
#
# reference: https://unix.stackexchange.com/questions/102678/making-ruby-available-to-all-users
#
sudo usermod -a -G rvm blackstack

# To start using RVM you need to run `source /etc/profile.d/rvm.sh` in all your open shell windows,
# Fix the issue "RVM is not a function"
# reference: https://stackoverflow.com/questions/9336596/rvm-installation-not-working-rvm-is-not-a-function
echo
echo "Run RVM script"
#source /home/blackstack/.rvm/scripts/rvm
#source /usr/local/rvm/scripts/rvm
sudo /bin/dash /etc/profile.d/rvm.sh
type rvm | head -n 1 # if you read "rvm is a function, that means the installation is fine.

# install and run Ruby 3.1.2
# reference: https://superuser.com/questions/376669/why-am-i-getting-rvm-command-not-found-on-ubuntu
echo
echo "install Ruby 3.1.2"
rvmsudo rvm install 3.1.2

# set 3.1.2 as default Ruby version
echo
echo "set 3.1.2 as default Ruby version"
rvm --default use 3.1.2

# check ruby installed
echo
echo "Try Ruby"
ruby -v



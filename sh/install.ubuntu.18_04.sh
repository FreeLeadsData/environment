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
sudo apt install -y curl

# install cockroach CLI for local development environments
echo
echo "download cockroach CLI"
curl https://binaries.cockroachdb.com/cockroach-v21.2.10.linux-amd64.tgz | tar -xz && sudo cp cockroach-v21.2.10.linux-amd64/cockroach /usr/local/bin/;

# backup old .postgresql folder
echo
echo "backup old .postgresql folder"
sudo mv -p ~/.postgresql ~/.postgresql.$(date +%s) > /dev/null 2>&1
sudo mkdir -p ~/.postgresql

# install PostgreSQL dev package with header of PostgreSQL
echo
echo "install PostgreSQL dev package with header of PostgreSQL"
sudo apt-get install -y libpq-dev
sudo apt install -y postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo systemctl status postgresql

# install bundler
echo
echo "install bundler"
gem install bundler -v '2.3.7'

# Install Google Chrome
# Reference:
# - https://skolo.online/documents/webscrapping/#step-1-download-chrome
#
echo
echo "install chrome"
wget http://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.90-1_amd64.deb
sudo dpkg -i google-chrome-stable_114.0.5735.90-1_amd64.deb
sudo apt-get install -fy
google-chrome --version

# Install Chrome Driver
# Reference:
# - https://stackoverflow.com/questions/50642308/webdriverexception-unk
#
echo
echo "install chrome-driver"
wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown blackstack:blackstack /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver

# install git
echo
echo "install git"
sudo apt install -y git

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
source /etc/profile.d/rvm.sh
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

# fix: why need to define source to RVM every time
# references: 
# - https://stackoverflow.com/questions/22917453/why-need-to-define-source-to-rvm-every-time
# - https://stackoverflow.com/questions/4842566/rvm-command-source-rvm-scripts-rvm?rq=1 
# 
echo
echo "Source RVM on login"
echo "source /etc/profile.d/rvm.sh" >> ~/.bashrc
echo "rvm --default use 3.1.2" >> ~/.bashrc

# create the code directory
echo
echo "create the code directory"
mkdir -p ~/code
cd ~/code

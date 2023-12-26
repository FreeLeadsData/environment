# update packages
echo "update packages"
sudo apt -y update
sudo apt -y upgrade

# install jq - required by the Zyte API
sudo apt install -y jq

# install other required packages
echo "install other required packages"
sudo apt install -y net-tools
sudo apt install -y gnupg2
sudo apt install -y nginx
sudo apt install -y sshpass
sudo apt install -y xterm
sudo apt install -y bc
sudo apt install -y unzip

# install cockroach CLI
echo "download cockroach CLI"
curl https://binaries.cockroachdb.com/cockroach-v21.2.10.linux-amd64.tgz | tar -xz && sudo cp cockroach-v21.2.10.linux-amd64/cockroach /usr/local/bin/;

# get private key for RVM
echo "get private key for RVM"
gpg2 --keyserver keyserver.ubuntu.com --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# move into a writable location such as the /tmp to download RVM
# download RVM
echo "download rvm"
cd /tmp
curl -sSL https://get.rvm.io -o rvm.sh

# install the latest stable Rails version
echo "install rvm"
bash /tmp/rvm.sh

# install and run Ruby 3.1.2
echo "install Ruby 3.1.2"
~/.rvm/bin/rvm install 3.1.2

# fix the issue "RVM is not a function"
# reference: https://stackoverflow.com/questions/9336596/rvm-installation-not-working-rvm-is-not-a-function
source ~/.rvm/scripts/rvm
type rvm | head -n 1

# set 3.1.2 as default Ruby version
echo "set 3.1.2 as default Ruby version"
~/.rvm/bin/rvm --default use 3.1.2

# check ruby installed
ruby -v

# install git
echo "install git"
sudo apt install -y git

# install PostgreSQL dev package with header of PostgreSQL
echo "install PostgreSQL dev package with header of PostgreSQL"
sudo apt-get install -y libpq-dev
sudo apt install -y postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo systemctl status postgresql

# backup old .postgresql folder
echo "backup old .postgresql folder"
mv -p ~/.postgresql ~/.postgresql.$(date +%s) > /dev/null 2>&1
mkdir -p ~/.postgresql

# install bundler
echo "install bundler"
gem install bundler -v '2.3.7'

# Install Google Chrome
# Reference:
# - https://skolo.online/documents/webscrapping/#step-1-download-chrome
#
echo "install chrome"
wget http://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.90-1_amd64.deb
sudo dpkg -i google-chrome-stable_114.0.5735.90-1_amd64.deb
sudo apt-get install -f
google-chrome --version

# Install Chrome Driver
# Reference:
# - https://stackoverflow.com/questions/50642308/webdriverexception-unk
#
echo "install chrome-driver"
wget https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip
unzip chromedriver_linux64.zip
sudo mv chromedriver /usr/bin/chromedriver
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver

# create the code directory
echo "create the code directory"
mkdir -p ~/code
cd ~/code

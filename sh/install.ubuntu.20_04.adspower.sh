# Add the line 'deb http://archive.ubuntu.com/ubuntu focal-updates main' into '/etc/apt/sources.list'
# Reference: 
echo "deb http://archive.ubuntu.com/ubuntu focal-updates main" | sudo tee -a /etc/apt/sources.list
sudo apt update

# Install AdsPower
cd ~
sudo wget https://version.adspower.net/software/linux-x64-global/AdsPower-Global-5.9.14-x64.deb
sudo chmod 777 AdsPower-Global-5.9.14-x64.deb
sudo dpkg -i AdsPower-Global-5.9.14-x64.deb
sudo apt install -y ./AdsPower-Global-5.9.14-x64.deb

# Fix broken packages in case that AdsPower installation failed.
sudo apt -y --fix-broken install

# Remove AdsPower installer
sudo rm -rf ./AdsPower-Global-5.9.14-x64.deb

# Install Chrome Driver
# Reference:
# - https://stackoverflow.com/questions/50642308/webdriverexception-unk
#
cd ~
sudo wget https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/116.0.5845.96/linux64/chromedriver-linux64.zip
sudo chmod 777 chromedriver-linux64.zip
unzip chromedriver-linux64.zip
sudo mv chromedriver-linux64/* /usr/bin
sudo chown root:root /usr/bin/chromedriver
sudo chmod +x /usr/bin/chromedriver
sudo rm -rf ./chromedriver-linux64.zip
sudo rm -rf ./chromedriver-linux64

# AdsPower requires access to a graphical environment 
# We need an X server or a similar display server running. 
# AdsPower will try to use GTK, a graphical toolkit, which in turn needs an active display connection that is not present in a headless setup.
sudo apt-get update
sudo apt-get install -y xvfb

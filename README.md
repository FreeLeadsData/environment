# Environment

Scripts for installing the environment for any of my projects on different Linux distros and version.

**Outline:**

1. [Getting Started](#getting-started).
2. [SSH Configuration](#ssh-configuration).
3. [Installation Scripts](#installation-scripts).
4. [Docker Images](#docker-images).

## Getting Started

Before running any installation script, you should create a `blackstack` user from where you will start any software process.

1. Create a new user `blackstack`:

```bash
sudo adduser blackstack
```

2. Add `blackstack` to `sudoers`:

```bash
sudo usermod -aG sudo blackstack
```

3. Switch to the new `blackstack` user:

```bash
sudo su - blackstack
```

Additonally, you may want to change the `hostname` of a new server (e.g.: `n01`):

```bash
sudo hostname n01
```

## SSH Configuration

Additionally, be sure you will be able to connect via SSH using the `blackstack` user.

1. Edit the `sshd_config` file.

```bash
sudo nano /etc/ssh/sshd_config
```

2. Allow password authentication.

```bash
PasswordAuthentication yes
``` 

3. Restart the SSH service.

```bash
sudo service ssh restart
```

## Installation Scripts

Anyone of the installation scripts listed below should run from the `blackstack` user created in the [Getting Started](#getting-started) section.

**IMPORTANT:** When the script has been done, log out SSH and access again to run the `profile.d` and get Ruby working.

**Ubunto 18.04:**

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.18_04.sh -O - | bash
```

**Ubunto 20.04:**

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.20_04.sh -O - | bash
```

## Docker Images

_(pending)_

# Environment

Script for installing the environment for any of our projects on **fresh** servers running **Ubuntu 20.04**.

**Outline:**

1. [Getting Started](#1-getting-started).
2. [Installation Details](#2-installation-details).
3. [Troubleshooting](#3-troubleshooting)

## 1. Getting Started

First, download the installation script.

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.20_04.sh
```

Then, run it.

```bash
bash install.ubuntu.20_04.sh <hostname> <password>
```

**Some considerations:**

1. It is important you access such a server with the `root` user.
2. A new user `blackstack` user will be added, with the password provided in the command line.
3. After the installation, you should access the server with the `blackstack` user only.
4. The user to access PostgreSQL is called `blackstack`, and its password is the one provided in the command line.
5. In the PostgreSQL server, will be a database called `blackstack`, owner by the `blackstack` user.

## 2. Installation Details

**The following major packages will be installed:**

- PostgreSQL 12
- Chromedriver 116
- AdsPower 5.9.14
- ChromeDriver 116
- Cockroach CLI 21.2.10
- Git (latest version)
- RVM (latest version)
- Ruby 3.1.2

**Other minor mackages are:**

- xvfb
- jq
- net-tools
- gnupg2
- nginx
- sshpass
- bc
- unzip
- curl

## 3. Troubleshooting

While the steps above work perfectly with [Contabo](https://contabo.com), [AWS](https://aws.amazon.com) has some problems.

Such problems make it impossilbe to deploy a fleet of AWS instances automatically.

**First Problem:**

First, EC2 instances privide an `ubuntu` user, and connect via SSH as `root` is prohibted in the `sshd_config` file.

So, you can to access with the `ubuntu` user and once there run `sudo su` to continue as `root`.

**Second Problem:**

If you created a new instance using a key to login, you have to edit `sshd_config` to allow SSH connections using passwords.

1. Edit the sshd_config file.

```
sudo nano /etc/ssh/sshd_config
```

2. Allow password authentication.

```
PasswordAuthentication yes
```

3. Restart the SSH service.

```
sudo service ssh restart
```
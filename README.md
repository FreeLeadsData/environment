# Environment

Script for installing the environment for any of our projects on fresh servers running Ubuntu 20.04.

It is important you access such a server with the `root` user.

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.20_04.sh
bash install.ubuntu.20_04.sh < write a password here >
```

A new user `blackstack` will be added.

After the installation, you will access the server with the `blackstack` user.

The following major packages will be installed:

- PostgreSQL 12
- Chromedriver 116
- AdsPower 5.9.14
- ChromeDriver 116
- Cockroach CLI 21.2.10
- Git
- RVM
- Ruby 3.1.2

Other minor mackages are:

- xvfb
- jq
- net-tools
- gnupg2
- nginx
- sshpass
- bc
- unzip
- curl





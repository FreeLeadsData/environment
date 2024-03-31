# Environment

Script for installing the environment for any of our projects on **fresh** servers running **Ubuntu 20.04**.

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.20_04.sh
bash install.ubuntu.20_04.sh <hostname> <password>
```

**Some considerations:**

1. It is important you access such a server with the `root` user.
2. A new user `blackstack` user will be added, with the password provided in the command line.
3. After the installation, you should access the server with the `blackstack` user only.
4. The user to access PostgreSQL is called `blackstack`, and its password is the one provided in the command line.
5. In the PostgreSQL server, will be a database called `blackstack`, owner by the `blackstack` user.

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





# Environment

Scripts for installing the environment for any of my projects on different Linux distros and version.

**Outline:**

1. [Getting Started](#getting-started).
2. [SSH Configuration](#ssh-configuration).
3. [Installation Scripts](#installation-scripts).
4. [PostgreSQL](#postgresql).
5. [Docker Images](#docker-images).

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

## PostgreSQL

Install and running a PostgreSQL database sevice.

### 1. Database Instance

In the same `bash` terminal, create a new Postgres user with superuser rights.

```bash
sudo -u postgres createuser --interactive
```

The output is like this.

```bash
Enter name of role to add: blackstack
Shall the new role be a superuser? (y/n) y
```

### 2. Database Password

In the same `bash` terminal, access the **postgres** terminal.

```bash
sudo -u postgres psql
```

And then run this **postgres** command to assign a new password to the **blackstack** user.

```psql
\password blackstack
```

### 3. Accepting Incoming Connections

```bash
cd /etc/postgresql/9.x/main/
```

Open file named `postgresql.conf`,

```bash
sudo nano postgresql.conf
```

and add this line to that file

```
listen_addresses = '*'
```

Then open file named `pg_hba.conf`,

```bash
sudo vi pg_hba.conf
```

and add this line to that file:

```
host  all  all 0.0.0.0/0 md5
```

Also, increase the number of max allowed connections:

```
max_connections = 250
```

It allows access to all databases for all users with an encrypted password.

Finally, restart your server

```
sudo /etc/init.d/postgresql restart
```

## Docker Images

_(pending)_

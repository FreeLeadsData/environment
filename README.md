# Environment

Scripts for installing the environment for any of my projects on different Linux distros and version.

**Outline:**

1. [Getting Started](#getting-started).
2. [Installation Scripts](#installation-scripts).
3. [Docker Images](#docker-images).

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

## Installation Scripts

Anyone of the installation scripts listed below should run from the `blackstack` user created in the [Getting Started](#getting-started) section.

**Ubunto 18.04:**

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.18_04.sh -O - | sh
```

**Ubunto 20.04:**

```bash
wget https://raw.githubusercontent.com/leandrosardi/environment/main/sh/install.ubuntu.20_04.sh -O - | bash
```

## Docker Images

_(pending)_
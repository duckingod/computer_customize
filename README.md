# Computer Customize

Script for computer customize (Linux/OSX)

## Install
```bash=
git clone https://github.com/duckingod/computer_customize.git
cd computer_customize
```

## Usage

### Command/Config
- OSX/ubuntu: initialize custom command/user config
    - save commands in `~/.script`
```bash
./go.sh
```
- define command
```
mk-cmd ht "htop -u Alice"
ht
```
- add virtualenv 
```bash=
. venv (make new env)"
. venv (use current location env)"
unenv
```
or
```bash=
. venv python3.5 (make new env for python3.5)"
. venv (use current location env)"
unenv
```
will install in `./.env`

### Tools
- virtualbox,ubuntu: install Guest Additions (from [Filip Wasilewski])
  - first insert Guest Additions CD image, then
```bash
sudo ./tools/installGuestAdditions.sh
```

[Filip Wasilewski]: http://en.ig.ma/notebook/2012/virtualbox-guest-additions-on-ubuntu-server "Filip Wasilewski" 

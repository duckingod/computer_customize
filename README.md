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
- add virtualenv (in current location)
```bash=
. venv (make new env)"
unenv
```

```bash=
. venv python3.5"
unenv
```
install virtualenv with python3.5 in `./.env3.5`

```bash=
venv delete python3.5
```
will delete virtualenv with python3.5

### Tools
- virtualbox,ubuntu: install Guest Additions (from [Filip Wasilewski])
  - first insert Guest Additions CD image, then
```bash
sudo ./tools/installGuestAdditions.sh
```

[Filip Wasilewski]: http://en.ig.ma/notebook/2012/virtualbox-guest-additions-on-ubuntu-server "Filip Wasilewski" 

# Computer Customize

Script for computer customize (Linux/OSX)

## Usage

```bash=
git clone https://github.com/duckingod/computer_customize.git
cd computer_customize
./go.sh
```

### Define Command
```bash=
mk-cmd NEW_CMD CMD_LINE
```
Example:
```
mk-cmd ht "htop -u Alice"
```

### Add Virtualenv
```bash=
add-env ENV_NAME
venv ENV_NAME
unenv
```
will install in `~/app/virtualenv`




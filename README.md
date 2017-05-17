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
. venv (make new env)"
. venv python3.5 (make new env)"
. venv (use current location env)"
unenv
```
will install in `./.env`




#!/usr/bin/env python3
import os
import sys
import argparse
import subprocess
bash_output = lambda *s: subprocess.check_output(s, stderr=subprocess.STDOUT).decode()

USE_ENV_BASH="""#!/bin/bash
export VENV_RUNNING=1
alias pip=pip_recording
unvenv () {
    unset VENV_RUNNING
    unset -f unvenv
    unalias pip
    deactivate
}
"""
PYTHON_CMDS = ['python', 'python3', 'python2'] + ['python3.' + str(p) for p in range(1, 8)]
DEFAULT_PYTHON = 'python'

class Env(object):
    class TmpFile(object):
        def __init__(self, path, ss):
            self.path = path + '/tmp'
            self.ss = ss
        def __enter__(self):
            with open(self.path, 'w') as f:
                for s in self.ss:
                    f.write(s+'\n')
            return self.path
        def __exit__(self, type, value, traceback):
            os.remove(self.path)
    BASE = '.venv/'
    base = '.venv/'
    def __init__(self, py_cmd=None):
        if py_cmd:
            try:
                self.ver = bash_output(py_cmd, '-V').split()[1]
                self.py_path = bash_output('which', py_cmd)
            except OSError as e:
                self.ver = '-1'
                self.py_path = ''
        else: # load current virtualenv
            self.ver = os.environ['VIRTUAL_ENV'].split('/')[-1]
            self.py_path = '' 
        self.name = self.ver
        self.path = self.base + self.name + '/'
        self.activate_path = self.path + 'bin/activate'
        self.pip_log_path = self.base + 'pip_log.txt'

    @property
    def exists(self):
        return os.path.exists(self.path)
        
    def use(self):
        # from https://stackoverflow.com/a/6944649
        s = [USE_ENV_BASH]
        s.append('. ' + self.activate_path)
        with self.TmpFile(self.base, s) as path:
            os.system('/bin/bash --rcfile ' + path)

    def leave(self):
        os.system('unvenv')
        
    def create(self):
        os.system('virtualenv ' + self.path + ' --python=' + self.py_path)

    def delete(self):
        os.system('rm -R ' + self.path + '*')
        os.rmdir(self.path)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('py_cmd', help='python command', default='auto', nargs='?')
    parser.add_argument(
            'action',
            nargs='?',
            default='use',
            choices=['use', 'delete', 'pipsync'])
    args = parser.parse_args()
    if args.py_cmd != 'auto':
        env = Env(args.py_cmd)
    else:
        pythons = [p for p in PYTHON_CMDS if Env(p).exists] + [DEFAULT_PYTHON]
        env = Env(pythons[0])
    if not env.exists:
        print('Environment for python ' + env.ver + ' not exists.')
        res = input('Create one? [Y/n]')
        if res != 'n':
            env.create()
        else:
            exit()
    if args.action == 'use':
        env.use()
    if args.action == 'delete':
        env.delete()
    if args.action == 'pipsync':
        system('pip install -r ' + env.requiment_path)

if __name__ == '__main__':
    main()


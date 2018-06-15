import argparse
from os import system
parser = argparse.ArgumentParser()
parser.add_argument('type', type=str)
parser.add_argument('p', type=str, nargs='?')
parser.add_argument('p2', type=str, nargs='?')
args = parser.parse_args()

if args.type == 'lab':
    server = args.p or '2'
    floor = '7' if server.isalpha() else '17'
    port = ord(server)-ord('a') if server.isalpha() else int(server)
    port = str(22000 + port)
    url = f'nlg{floor}.csie.ntu.edu.tw'
    usr = args.p2 or 'cwtsai'
    cmd = f'ssh -p {port} {usr}@{url}'

system(f'echo {cmd}')
system(cmd)

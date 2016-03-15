#!/usr/local/bin/python3

'''
USAGE: ./cvim_server.py
If you want to use native Vim to edit text boxes
you must be running this script. To begin editing,
first map the editWithVim (e.g. "imap <C-o> editWithVim") mapping.
By default, this script will spawn a gvim ("gvim -f"), but this action
can be changed via the "vimcommand" cVimrc option
'''

import os
import sys
import shlex
from json import loads
import subprocess
from tempfile import mkstemp
from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime

PORT = 8001


def edit_file(command, content):
    d = datetime.now()
    fd, fn = mkstemp(suffix='.txt', prefix='cvim-%s_' % d.strftime('%y%m%d_%H%M'), text=True)
    os.write(fd, content.encode('utf8'))
    os.close(fd)

    # available
    #subprocess.Popen(['/Applications/MacVim.app/Contents/MacOS/MacVim'] + [os.path.abspath(fn)]).wait()

    # Open with MacVim
    subprocess.Popen(['open', '-W', '/Applications/MacVim.app/', '--args'] + [os.path.abspath(fn)]).wait()

    text = None
    with open(fn, 'r') as f:
        text = f.read()
    #os.unlink(fn) # don't unlink file
    return text


class CvimServer(BaseHTTPRequestHandler):
    def do_POST(self):
        length = int(self.headers['Content-Length'])
        content = loads(self.rfile.read(length).decode('utf8'))
        edit = edit_file(content['command'], content['data'])
        self.send_response(200)
        self.send_header('Content-Type', 'text/plain')
        self.end_headers()
        self.wfile.write(edit.encode('utf8'))


def init_server(server_class=HTTPServer, handler_class=BaseHTTPRequestHandler):
    server_address = ('127.0.0.1', PORT)
    httpd = server_class(server_address, CvimServer)
    httpd.serve_forever()

try:
    init_server()
except KeyboardInterrupt:
    pass

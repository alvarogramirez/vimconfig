#!/usr/bin/env python

import sys

def make_template(fname):
   with open(fname,'r') as reader:
       #todo here
       print(reader.read())

try:
    header_name = str(sys.argv[1])
    make_template(header_name)
except IndexError:
    print("Expected argument filename")
    raise (SystemExit)


#!/usr/bin/env python

from time import sleep
from os import system
import sys

header = '''\033[1;31mSEGMENTATION FAULT  \033[0;m'''

while True:
    system("clear")
    for i in range (30):
        for j in range(5):
            sys.stdout.write(header)
        print("\n")
    sleep(0.2)
    system("clear")
    print(" ")
    sleep(0.2)
    system("clear")

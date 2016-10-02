#!/usr/bin/env python3

from random import randint
import time
import subprocess

def getTerminalSize():
    import os
    env = os.environ
    def ioctl_GWINSZ(fd):
        try:
            import fcntl, termios, struct, os
            cr = struct.unpack('hh', fcntl.ioctl(fd, termios.TIOCGWINSZ,
                               '1234'))
        except:
            return
        return cr
    cr = ioctl_GWINSZ(0) or ioctl_GWINSZ(1) or ioctl_GWINSZ(2)
    if not cr:
        try:
            fd = os.open(os.ctermid(), os.O_RDONLY)
            cr = ioctl_GWINSZ(fd)
            os.close(fd)
        except:
            pass
    if not cr:
        cr = (env.get('LINES', 25), env.get('COLUMNS', 80))
    return int(cr[1]), int(cr[0])

width, height = getTerminalSize()
tab = ["Segmentation fault", "Wololo", "Yololo", "Yowolo", "Woyolo", "LolWoyo",
       "Yowolol", "Yolwolo", "Ayoyoyo", "Balekouye",
       "Le poulet c'est pas de la viande"]
while True:
    x = randint(0, width)
    y = randint(0, height)
    z = randint(0, len(tab))
    print("\033[1;31m\033[" + str(x) + ";" + str(y) + "H" + tab[z - 1] + "\033")
    time.sleep(0.6)
    subprocess.call("clear", shell=True)

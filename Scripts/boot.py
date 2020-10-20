#!/usr/bin/env python3

import PyUserInput
from PyUserInput.pykeyboard import PyKeyboard
import time
import subprocess

k = PyKeyboard()
subprocess.call("setxkbmap fr", shell=True)

#1

#4 terminals
k.press_key(k.windows_l_key)
k.tap_key('1')
k.tap_key(k.enter_key)
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.press_key(k.windows_l_key)
k.tap_key(k.right_key)
k.tap_key('v')
k.tap_key(k.enter_key)
time.sleep(0.2)
k.tap_key(k.left_key)
k.tap_key('v')
k.tap_key(k.enter_key)
k.tap_key(k.up_key)
time.sleep(0.2)
k.tap_key(k.left_key)
k.tap_key(k.up_key)
k.release_key(k.windows_l_key)

#IntelliJ IDEA
"""k.press_key(k.windows_l_key)
k.tap_key('1')
k.tap_key('i')
k.release_key(k.windows_l_key)"""

#2

k.press_key(k.windows_l_key)
k.tap_key('2')
k.tap_key('c')
k.release_key(k.windows_l_key)

#3

k.press_key(k.windows_l_key)
k.tap_key('3')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.type_string("rmjlock; slrn")
time.sleep(0.1)
k.tap_key(k.enter_key)
time.sleep(0.1)
k.tap_key(k.enter_key)

#4

k.press_key(k.windows_l_key)
k.tap_key('4')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.type_string("bashrc")
k.press_key(k.windows_l_key)
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
k.press_key(k.windows_l_key)
k.tap_key(k.left_key)
k.release_key(k.windows_l_key)

#5

k.press_key(k.windows_l_key)
k.tap_key('5')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)

#6

k.press_key(k.windows_l_key)
k.tap_key('6')
k.tap_key('p')
k.release_key(k.windows_l_key)

#7

k.press_key(k.windows_l_key)
k.tap_key('7')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.type_string("cd Scripts")
k.tap_key(k.enter_key)
k.press_key(k.windows_l_key)
k.tap_key(k.left_key)
k.release_key(k.windows_l_key)

#8

k.press_key(k.windows_l_key)
k.tap_key('8')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.type_string("wsm")
k.tap_key(k.enter_key)

#10

k.press_key(k.windows_l_key)
k.tap_key('0')
k.tap_key(k.enter_key)
k.release_key(k.windows_l_key)
time.sleep(0.2)
k.type_string("lock")

k.press_key(k.windows_l_key)
k.tap_key('1')
k.release_key(k.windows_l_key)

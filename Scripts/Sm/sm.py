#!/usr/bin/env python3

import collections
import os
import socket
import time
import select
import sys

NS_SERVER = 'ns-server.epita.fr'
NS_PORT = 4242

ING1_PROMO = 'epita_2016'

class User(object):
  def __init__(self, line):
    fields = line.split()
    self.login = fields[1]
    self.ip = fields[2]
    self.promo = fields[9]

  @property
  def sm(self):
    if self.ip.startswith('10.42'):
      return "sm random"
    else:
      return None

  def __cmp__(self, other):
    return cmp(self.login, other.login)

  def __hash__(self):
    return hash(self.login)

def connect_to_ns(server, port):
  s = socket.socket()
  s.connect((server, port))
  s.setblocking(0)
  ready = select.select([s], [], [], 0.5)
  if ready[0]:
    s.recv(8192) # salut ...
  else:
    return None
  return s

def list_users(sock):
  sock.send(b"list_users\n")
  buf = ''
  while True:
    sock.setblocking(0)
    ready = select.select([sock], [], [], 0.5)
    if ready[0]:
      tmp = sock.recv(8192)
    else:
      return []
    buf += tmp.decode('utf-8')
    if b'\nrep 002' in tmp or tmp == b'':
      break
  return buf.split('\n')[:-2]

def nb_connected():
  sock = connect_to_ns(NS_SERVER, NS_PORT)
  if sock is None:
    return 0
  users = (User(l) for l in list_users(sock))
  promo = (u for u in users if u.promo == ING1_PROMO)
  promo_in_sm = (u for u in promo if u.sm is not None)
  print_sm(users)

def print_sm(users):
  cisco_ = list()
  mid_ = list()
  sr_ = list()
  _14_ = list()
  for i in list(users):
      if i.ip.startswith("10.224.32"):
          cisco_.append(i)
      if i.ip.startswith("10.224.33"):
          mid_.append(i)
      if i.ip.startswith("10.224.34"):
          sr_.append(i)
      if i.ip.startswith("10.224.35"):
          _14_.append(i)

  nbcolumns = 1
  cisco = []
  mid = []
  sr = []
  _14 = []
  index = 0
  for i in cisco_:
      if cisco_[index - 1].ip != cisco_[index].ip:
          cisco.append(cisco_[index])
      index += 1
  index = 0
  for i in mid_:
      if mid_[index - 1].ip != mid_[index].ip:
          mid.append(mid_[index])
      index += 1
  index = 0
  for i in sr_:
      if sr_[index - 1].ip != sr_[index].ip:
          sr.append(sr_[index])
      index += 1
  index = 0
  for i in _14_:
      if _14_[index - 1].ip != _14_[index].ip:
          _14.append(_14_[index])
      index += 1
  index = 0
  nb_sm = len(cisco) + len(mid) + len(sr) + len(_14)
  if nb_sm > 45 and nb_sm <= 90:
      nbcolumns = 2
  elif nb_sm > 90 and nb_sm <= 140:
      nbcolumns = 3
  elif nb_sm > 140 and nb_sm <= 230:
      nbcolumns = 4
  elif nb_sm > 230:
      nbcolumns = 5
  cpt = 1

### CISCO ###

  if len(cisco) == 0:
    print("\033[0;31mCisco enculés : " + str(len(cisco)) + "\033[0;m")
  else:
    print("\033[0;32mCisco enculés : " + str(len(cisco)) + "\033[0;m")
  for i in cisco:
      sys.stdout.write('%-9s %-14s %-10s' % (i.login, i.ip, i.promo + "  |  "))
      if cpt % nbcolumns == 0:
        print()
      cpt += 1

### MID-LAB ###

  if len(mid) == 0:
    print("\n\n\033[0;31mMid-lab  : " + str(len(mid)) + "\033[0;m")
  else:
    print("\n\n\033[0;32mMid-lab  : " + str(len(mid)) + "\033[0;m")
  cpt = 1
  for i in mid:
      sys.stdout.write('%-9s %-14s %-10s' % (i.login, i.ip, i.promo + "  |  "))
      if cpt % nbcolumns == 0:
        print()
      cpt += 1

### LAB-SR ###

  if len(sr) == 0:
    print("\n\n\033[0;31mLab-SR  : " + str(len(sr)) + "\033[0;m")
  else:
    print("\n\n\033[0;32mLab-SR   : " + str(len(sr)) + "\033[0;m")
  cpt = 1
  for i in sr:
      sys.stdout.write('%-9s %-14s %-10s' % (i.login, i.ip, i.promo + "  |  "))
      if cpt % nbcolumns == 0:
        print()
      cpt += 1

### SM-14 ###

  if len(_14) == 0:
    print("\n\n\033[0;31mSM-14    : " + str(len(_14)) + "\033[0;m")
  else:
    print("\n\n\033[0;32mSM-14    : " + str(len(_14)) + "\033[0;m")
  cpt = 1
  for i in _14:
      sys.stdout.write('%-9s %-14s %-10s' % (i.login, i.ip, i.promo + "  |  "))
      if cpt % nbcolumns == 0:
        print()
      cpt += 1

  print()
  print("\033[0;32mCisco enculés : " + str(len(cisco)) + "\033[0;m")
  print("\033[0;32mMid-lab       : " + str(len(mid)) + "\033[0;m")
  print("\033[0;32mLab-SR        : " + str(len(sr)) + "\033[0;m")
  print("\033[0;32mSM-14         : " + str(len(_14)) + "\033[0;m")
  print("\033[1;32mTotal         : " + str(nb_sm) + "\033[1;m")
  return nb_sm

nb_connected()

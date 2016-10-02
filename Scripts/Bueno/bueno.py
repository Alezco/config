#!/usr/bin/env python3

import os, sys, subprocess

def columns_80(path):
    f = open(path)
    nberr = 0
    for i, line in enumerate(f):
        if len(line) > 81:
            path = path.replace("//", "/")
            print("\033[1;31m" + path + " : " + str(len(line)) +
                  " colmuns at line " + str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def dead_code(path):
    f = open(path)
    nberr = 0
    copy = False
    for i, line in enumerate(f):
        l = i + 1
        path = path.replace("//", "/")
        if "/*" in line:
            copy = True
            tmp1 = line
            if ";" in tmp1:
                sys.stdout.write("\033[1;31m" + path + " : Dead code at line "
                                 + str(l) + " : " + tmp1 + "\033[1;31m")
                nberr += 1
        elif "*/" in line:
            copy = False
            tmp2 = line
            if ";" in tmp2:
                sys.stdout.write("\033[1;31m" + path + " : Dead code at line "
                                 + str(l) + " : " + tmp2 + "\033[1;31m")
                nberr += 1
        elif copy:
            dead = line
            if ";" in dead:
                sys.stdout.write("\033[1;31m" + path + " : Dead code at line "
                                 + str(l) + " : " + dead + "\033[1;31m")
                nberr += 1
        elif "//" in line:
            if ";" in line:
                sys.stdout.write("\033[1;31m" + path + " : Dead code at line "
                                 + str(l) + " : " + line + "\033[1;31m")
                nberr += 1
    return nberr

def keywordpar(path):
    f = open(path)
    nberr = 0
    for i, line in enumerate(f):
        path = path.replace("//", "/")
        if "if(" in line:
            print("\033[1;31m" + path + " : " + "Missing space after if at line "
                  + str(i + 1) + "\033[1;m")
            nberr += 1
        if "for(" in line:
            print("\033[1;31m" + path + " : " + "Missing space after for at line "
                  + str(i + 1) + "\033[1;m")
            nberr += 1
        if "while(" in line:
            print("\033[1;31m" + path + " : " + "Missing space after while at line "
                    + str(i + 1) + "\033[1;m")
            nberr += 1
        if "sizeof(" in line:
            print("\033[1;31m" + path + " : " + "Missing space after sizeof at line "
                    + str(i + 1) + "\033[1;m")
            nberr += 1
        if "switch(" in line:
            print("\033[1;31m" + path + " : " + "Missing space after switch at line "
                    + str(i + 1) + "\033[1;m")
            nberr += 1
        if "#define" in line:
            print("\033[1;31m" + path + " : " + "Missing space before define at line "
                    + str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def braces(path):
    f = open(path)
    nberr = 0
    for i, line in enumerate(f):
        if "{" in line:
            tmp = line
            tmp = tmp.replace(" ", "")
            tmp = tmp.replace("\n", "")
            path = path.replace("//", "/")
            if len(tmp) != 1:
                print("\033[1;31m" + path + " : " +
                      "Brace not on its line at line " + str(i + 1) + "\033[1;m")
                nberr += 1
    return nberr

def file_len(path):
    f = open(path)
    for i, l in enumerate(f):
        pass
    return i + 1

def empty_lines(path):
    f = open(path)
    nberr = 0
    nblines = file_len(path) - 1
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        if i == 0 and line == '\n':
            print("\033[1;31m" + path + " : " + "first line empty" + "\033[1;m")
            nberr += 1
        if i == nblines and line == '\n':
            print("\033[1;31m" + path + " : " + "last line empty" + "\033[1;m")
            nberr += 1
    return nberr

def space_comma(path):
    f = open(path)
    nberr = 0
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        for j in line:
            if j == ",":
                index = line.index(',')
                if line[index + 1] != " ":
                    print("\033[1;31m" + path + " : "
                          + "Missing space after comma at line " + str(i + 1)
                          + " at column " + str(index + 1) + "\033[1;m")
                    nberr += 1
    return nberr

def bool_eol(path):
    f = open(path)
    nberr = 0
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        if line[:-1].endswith("||"):
            print("\033[1;31m" + path + " : " + "|| at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
        if line[:-1].endswith("&&"):
            print("\033[1;31m" + path + " : " + "&& at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def op_eol(path):
    f = open(path)
    nberr = 0
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        if line[:-1].endswith("+"):
            print("\033[1;31m" + path + " : " + "+ at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
        if line[:-1].endswith("-"):
            print("\033[1;31m" + path + " : " + "- at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
        if line[:-1].endswith("*"):
            print("\033[1;31m" + path + " : " + "* at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
        if line[:-1].endswith(" /"):
            print("\033[1;31m" + path + " : " + "/ at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
        if line[:-1].endswith("%"):
            print("\033[1;31m" + path + " : " + "% at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def space_eol(path):
    f = open(path)
    nberr = 0
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        if line[:-1].endswith(" "):
            print("\033[1;31m" + path + " : " + "space at end of line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def tab(path):
    f = open(path)
    nberr = 0
    path = path.replace("//", "/")
    for i, line in enumerate(f):
        if "\t" in line:
            print("\033[1;31m" + path + " : " + "tab at line " +
                  str(i + 1) + "\033[1;m")
            nberr += 1
    return nberr

def scan_dir(path):
    cpt80 = 0
    cptdead = 0
    cptkeypar = 0
    cptbraces = 0
    cptempty = 0
    cptcomma = 0
    cptbool = 0
    cptspace = 0
    cpttab = 0
    cptop = 0
    cptlines = 0
    for dirpath, dirs, files in os.walk(path):
        if (len(files) != 0):
            for i in files:
                if (i.endswith(".cc") or i.endswith(".hh") or i.endswith(".h")
                    or i.endswith(".c") or i.endswith(".hxx")):
                    #80 columns
                    if columns_80(dirpath + "/" + i) != 0:
                        cpt80 += 1
                    #Dead code
                    if dead_code(dirpath + "/" + i) != 0:
                        cptdead += 1
                    #Keywords parenthesis
                    if keywordpar(dirpath + "/" + i) != 0:
                        cptkeypar += 1
                    #Keywords parenthesis
                    if braces(dirpath + "/" + i) != 0:
                        cptbraces += 1
                    #Empty lines
                    if empty_lines(dirpath + "/" + i) != 0:
                        cptempty += 1
                    #Spaces after comma
                    if space_comma(dirpath + "/" + i) != 0:
                        cptcomma += 1
                    #|| or && at end of line
                    if bool_eol(dirpath + "/" + i) != 0:
                        cptbool += 1
                    #Space at end of line
                    if space_eol(dirpath + "/" + i) != 0:
                        cptspace += 1
                    #Tabs
                    if tab(dirpath + "/" + i) != 0:
                        cpttab += 1
                    #Binary operators
                    if op_eol(dirpath + "/" + i) != 0:
                        cptop += 1
    if cpt80 == 0:
        print("\033[1;32m80 columns            : OK" + "\033[1;m")
    if cptdead == 0:
        print("\033[1;32mDead code             : OK" + "\033[1;m")
    if cptkeypar == 0:
        print("\033[1;32mSpace after keywords  : OK" + "\033[1;m")
    if cptbraces == 0:
        print("\033[1;32mBraces                : OK" + "\033[1;m")
    if cptempty == 0:
        print("\033[1;32mEmpty lines           : OK" + "\033[1;m")
    if cptcomma == 0:
        print("\033[1;32mSpace after comma     : OK" + "\033[1;m")
    if cptbool == 0:
        print("\033[1;32mBool operators EOL    : OK" + "\033[1;m")
    if cptspace == 0:
        print("\033[1;32mSpace at EOL          : OK" + "\033[1;m")
    if cpttab == 0:
        print("\033[1;32mTabs                  : OK" + "\033[1;m")
    if cptop == 0:
        print("\033[1;32mBinary operators EOL  : OK" + "\033[1;m")

if len(sys.argv) != 2:
    print("Please precise a directory")
else:
    scan_dir(sys.argv[1])

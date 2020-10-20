#!/usr/bin/env python3

import string
import sys
import argparse
import os.path
import subprocess

# Generate .cc and .hh ========================================================

def generate_cc(token, class_name):
    cc = open(token + ".cc", 'w')
    cc.write("#include <iostream>\n")
    cc.write("#include \"" + token + ".hh\"\n\n")
    cc.write(class_name + "::" + class_name + "()\n")
    cc.write("{\n")
    cc.write("  \n")
    cc.write("}\n")
    cc.write("\n")
    cc.write(class_name + "::~" + class_name + "()\n")
    cc.write("{\n")
    cc.write("  \n")
    cc.write("}\n")
    cc.write("\n")
    cc.write("int main()\n")
    cc.write("{\n")
    cc.write("  \n")
    cc.write("}\n")
    cc.close()

def generate_hh(token, guard, class_name):
    hh = open(token + ".hh", 'w')
    hh.write("/**\n")
    hh.write("** \\file " + token + ".hh\n")
    hh.write("** \\brief\n")
    hh.write("*/\n")
    hh.write("\n#pragma once\n\n")
    hh.write("class " + class_name + "\n")
    hh.write("{\n")
    hh.write("public:\n")
    hh.write("  " + class_name + "();\n")
    hh.write("  ~" + class_name + "();\n")
    hh.write("private:\n")
    hh.write("  \n")
    hh.write("};\n\n")

def generate_c(token):
    c = open(token + ".c", 'w')
    c.write("#include <stdio.h>\n")
    c.write("#include <stdlib.h>\n\n")
    c.write("int main(void)\n")
    c.write("{\n")
    c.write("  return 0;\n")
    c.write("}\n")

def generate_h(token, guard):
    h = open(token + ".h", 'w')
    h.write("#ifndef " + guard + "\n")
    h.write("# define " + guard + "\n\n")
    h.write("#endif /* !" + guard + " */")

def generate_sh(token):
    sh = open(token + ".sh", 'w')
    sh.write("#!/bin/sh\n\n")
    subprocess.call("chmod +x " + token + ".sh", shell=True)

def generate_py(token):
    sh = open(token + ".py", 'w')
    sh.write("#!/usr/bin/env python3\n\n")
    subprocess.call("chmod +x " + token + ".py", shell=True)

def generate_C(token, guard):
    generate_c(token)
    generate_h(token, guard)

def generate_cpp(token, guard, class_name):
    generate_cc(token, class_name)
    generate_hh(token, guard, class_name)

tmp = sys.argv[1];
filename, filext = os.path.splitext(tmp)
token = tmp[:-len(filext)]
up = token.upper()
class_name = token.title()
guard = up + "_HH_"

if filext == ".sh" and not os.path.exists(token + ".sh"):
    generate_sh(token)
    subprocess.call("vim " + token + ".sh", shell=True)
elif filext == ".py"and not os.path.exists(token + ".py"):
    generate_py(token)
    subprocess.call("vim " + token + ".py", shell=True)
elif filext == ".c"and not os.path.exists(token + ".c"):
    generate_C(token, guard)
    subprocess.call("vim " + token + ".c", shell=True)
elif filext == ".cc"and not os.path.exists(token + ".cc"):
    generate_cpp(token, guard, class_name)
    subprocess.call("vim " + token + ".cc", shell=True)
else:
    print("Please precise a file extension")

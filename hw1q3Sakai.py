#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 30 09:47:49 2020

@author: sterling
"""

import sys
import babynames


def printUsage():
    print("These are the ways the script can be executed.")
    print("python {file name} [-names <Alice,Bob>] [-file <example.png>]")
    print("python {file name} [-file <example.png>] [-names <Bob,Bobby,Robert>]")
    print("python {file name} [-names <Leonardo,Donatello,Michaelangelo,Raphael>")

    return

names = 'name'
file = 'example'
namesList = []

i = 1
while i < len(sys.argv):
    print("Argument: "+ sys.argv[i])
    if sys.argv[i] == "-names":
        if (i+1 < len(sys.argv)) and (sys.argv[i+1] != "-file") and (sys.argv[i+1] != ""):
            print(sys.argv[i+1])
            names = str(sys.argv[i+1])
            namesList = names.split(",")          
            i+=1
        else:
            printUsage()
            sys.exit(1)
    elif (sys.argv[i] == "-file"):
        if (i+1 < len(sys.argv)) and (sys.argv[i+1] != "-names") and (sys.argv[i+1] != ""):
            file = str(sys.argv[i+1])
            i+=1
        else:
            printUsage()
            sys.exit(1)
    i+=1

names = {name: sum(babynames.get_frequency(name).values()) for name in namesList}
babynames.plt.style.use(['dark_background'])

for name, count in names.items():
    print(f"{name:>7}: {count:>9,}")

print(f"\n{max(names, key=names.get)} is the most popular!")

babynames.plt.figure()
for name in namesList:
    totals = babynames.get_frequency(name)
    babynames.plt.plot([*totals.keys()], [*totals.values()], label=name)
babynames.plt.legend()

if file == "example":
   babynames.plt.show()
else:
    babynames.plt.savefig(file)
 
#print(len(sys.argv))
#print(namesList)
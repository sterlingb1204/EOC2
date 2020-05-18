#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Jan 30 08:07:45 2020

@author: sterling
"""
import babynames

namesList = []
while True:
    name = input("Please enter a name, if you are done please click enter: ")
    if name != "":
        namesList.append(name)
    else:
        break


names = {name: sum(babynames.get_frequency(name).values()) for name in namesList}

babynames.plt.style.use(['dark_background'])
babynames.plt.figure()
for name in namesList:
    totals = babynames.get_frequency(name)
    babynames.plt.plot([*totals.keys()], [*totals.values()], label=name)
babynames.plt.legend()
babynames.plt.show()

for name, count in names.items():
    print(f"{name:>7}: {count:>9,}")

print(f"\n{max(names, key=names.get)} is the most popular!")

#-- Part 2: Python and SQLite (25 Points)
#-- 
#-- Take your Homework 1, Part 1 module and re-write
#-- it to so that it queries against the sqlite3
#-- babynames database instead.
#--
#-- The beauty of this approach is that, because
#-- your original code was in a module, you can
#-- change how the module fulfills the `get_frequency()`
#-- function request, and all of the scripts that you
#-- wrote that use your module will benefit from
#-- the improvements!
#--
#-- You can test your module by running your Homework
#-- 1, parts 2 and 3 scripts, and see if you observe
#-- an improvement in the speed of the scripts!
#------------------------------------------------

import babynames1


print("The Fantastic Four!")
print("-" * 19)


names = {name: sum(babynames1.get_frequency(name).values()) for name in ["Reed", "Susan", "Ben", "Johnny"]}

for name, count in names.items():
    print(f"{name:>7}: {count:>9,}")
print("pynames")
print(f"\n{max(names, key=names.get)} is the most popular!")
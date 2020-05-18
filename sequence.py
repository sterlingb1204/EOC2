#################################
# Sequence Program
# Sterling Bhollah & Dan Rahill
# Homework #2
#################################

import sys

def printUsage():
    print ("There was an error in your input: ", file=sys.stderr)
    print(f"Usage: {sys.argv[0]} [-first <number>] [-last <number>] [-skip <number>] [-format <number>]")



first = 0
last = 0
skip = 1
formatting = None

#Reads command line arguments

try:
    i = 1
    while i < len(sys.argv):
        # Look for the `-skip` argument.
        if sys.argv[i] == "-skip":
            skip = float(sys.argv[i + 1])
            if skip.is_integer():
                skip = int(skip)
            i += 1
        
        # Look for the `-first` argument. 
        elif sys.argv[i] == "-first":
            first = float(sys.argv[i + 1])
            if first.is_integer():
                first = int(first)
            i += 1
        
        # Look for the `-last` argument.
        elif sys.argv[i] == "-last":
            last = float(sys.argv[i + 1])
            if last.is_integer():
                last = int(last)
            i += 1
        
        # Look for the `-format` argument.
        elif sys.argv[i] == "-format":
            formatting = str(sys.argv[i + 1])
            i += 1
        
        else:
           raise Exception()
        i += 1
except:
    printUsage()
    sys.exit(1)

#Determines if -skip, -first, -last arguments are integers and adjusts formatting
if formatting == None:
    if type(skip)is int and type(first) is int and type(last)is int:
        formatting = "{:.0f}"
    else:
        formatting = "{:.6f}"

#prints out sequence
x = first
if skip > 0: # Skip is positive number
    while x < (last + 1):
        #print(type(x))
        print(formatting.format(x))
        x += skip
        
elif skip < 0: #Skip is negative number
    if first < last:
        print("If -skip is negative then -first must be larger than -last")
        printUsage()
    else:
        while x > (last + 1):
           # print(type(formatting.format(x)))
            print(formatting.format(x))
            x+=skip
else:
    printUsage()
    sys.exit(1)

    
    
    
    
    

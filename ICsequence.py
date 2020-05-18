#################################
# Sequence Program
# Sterling Bhollah (sbhollah)
# Homework #2
#################################

import sys

def printUsage():
    print ("There was an error in your input: ", file=sys.stderr)
    print(f"Usage: {sys.argv[0]} [-first <number>] [-last <number>] [-skip <number>] [-format <number>]")



first = float(0)
last = float(0)
skip = float(1)
formatting = "Null"

#Reads command line arguments

try:
    i = 1
    while i < len(sys.argv):
        # Look for the `-skip` argument.
        if sys.argv[i] == "-skip":
            skip = float(sys.argv[i + 1])
            i += 1            
        
        # Look for the `-first` argument. 
        elif sys.argv[i] == "-first":
            first = float(sys.argv[i + 1])
            i += 1        
        
        # Look for the `-last` argument.
        elif sys.argv[i] == "-last":
            last = float(sys.argv[i + 1])
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
if formatting == "Null":
    if skip.is_integer() and first.is_integer() and last.is_integer():
        formatting = "{:.0f}"
    else:
        formatting = "{:.6f}"

#prints out sequence
x = first
if skip > 0: # Skip is positive number
    while x < (last + 1):
        print(formatting.format(x))
        x += skip
        
elif skip < 0: #Skip is negative number
    if first < last:
        print("If -skip is negative then -first must be larger than -last")
        printUsage()
    else:
        while x > (last + 1):
            print(formatting.format(x))
            x+=skip
else:
    printUsage()
    sys.exit(1)

    
    
    
    
    

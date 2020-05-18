#################################
# Pickled Program
# Sterling Bhollah & Dan Rahill
# Homework #2
#################################

import pickle
import sys


try:
    myfile = open("p20.pickle", "rb")
    contents = pickle.load(myfile)
    print(contents, end = "")
    myfile.close()

except:
    print("This is the first time you have run this script", file=sys.stderr)


myfile = open("p20.pickle", "wb")
#contents = pickle.load(myfile)
#pickle.dump(sys.stdout.read(contents), myfile)
pickle.dump(sys.stdin.read(), myfile)
myfile.close()  

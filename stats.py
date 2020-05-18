#################################
# Stats Program
# Sterling Bhollah & Dan Rahill
# Homework #2
#################################


import sys
import statistics as stats


def printUsage():
    print("Error parsing numbers")
def mode(nums):
    freq = {}
    output = []
    for num in nums:
        if num in freq:
            freq[num] += 1
        else: 
            freq[num] = 1
    key = []
    value = []
    maxFreq = 0
    for k,v in freq.items():
        key.append(k)
        value.append(v)
        maxFreq = max(value)
    for i,k in enumerate(value):
        if k == maxFreq:
            output.append(key[i])
    output = str(output).strip('[').strip(']').replace(',', '')
    return output
    
nums = []
i = 0
for line in sys.stdin:
    line = line.strip()
    nums = line.split(" ")
    for i,num in enumerate(nums):
        try:
            nums[i] = float(num)
        except:
            printUsage()
            sys.exit(1)


     
print("Maximum: {}".format(max(nums)))
print("Minimum: {}".format(min(nums)))
print("Average: {}".format(stats.mean(nums)))
print("Median: {}".format(stats.median(nums)))
print("Mode: {}".format(mode(nums)))
print("Population Standard Deviation: {}".format(stats.pstdev(nums)))


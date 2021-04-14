import sys

if len(sys.argv)  != 2:
    print("This script requires an argument corresponding to the file path to listify")

filepath = sys.argv[1]

with open(filepath, 'r') as f:
    print("[", end="")
    for line in f.readlines():
        print("\"" +  line.strip("\n") + "\",", end="")
    print("]")

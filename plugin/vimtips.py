import random
Tip_list = []


for filename in ["medium.txt", "globals.txt", "eastereggs.txt", "moving.txt", "markers.txt", "phrases.txt", "external.txt", "miscallenous.txt"]:
    with open("tips/"+filename, "r") as f:
        for line in f.readlines():
            Tip_list.append(line)

print(random.choice(Tip_list))

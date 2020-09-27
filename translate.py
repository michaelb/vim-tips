import re
import random


def translate(line):
    line = re.sub("<CR>", "", line)
    line = re.sub("<silent>", "", line)
    line = re.sub("<Nop>", "", line)
    if line == "":
        return ""
    if re.sub(" ", "", line) == "":
        return ""
    if line[0] == "\"":
        return ""

    sline = line.split()

    cleaned_sline = []
    for word in sline:
        if len(word) == 0 or word[0] == "\"":
            break
        else:
            cleaned_sline.append(word)
    sline = cleaned_sline
    if len(sline) <= 3:
        return ""
    if sline[0] == "Plug":
        return ""

    if sline[0] == "nnoremap":
        return sline[1] + "  " + " ".join(sline[2:]) + "  (normal mode)"

    if sline[0] == "vnoremap":
        return sline[1] + "  " + " ".join(sline[2:]) + "  (visual mode)"

    if sline[0] == "command" or sline[0] == "command!":
        return ":" + sline[1] + "  " + " ".join(sline[2:])
    if sline[0] == "map":
        return sline[1] + "  " + " ".join(sline[2:])


Tip_list = []
with open("/home/michael/.config/nvim/init.vim", "r") as f:
    for line in f.readlines():
        Tip_list.append(line)

    translated_list = [translate(line)
                       for line in Tip_list if translate(line) != "" and translate(line) != None]
    # line = random.choice(translated_list)
    print(random.choice(translated_list))

if exists("g:vim_tips")
    finish
endif
let g:vim_tips= 1

let s:vim_tips_tips_frequency=get(g:,'vim_tips_tips_frequency',0.5)
let s:vim_tips_display_at_startup=get(g:,'vim_tips_display_at_startup',1)


let s:script_dir = fnamemodify(resolve(expand('<sfile>', ':p')), ':h')
let s:vimrc = $MYVIMRC
function! g:GetTip()
  let s:tip = ""
python3 << EOF
import random
import vim
import re
import os
Tip_list = []




def translate(line):
    line = re.sub("<CR>", "", line)
    line = re.sub("<cmd>", "", line)
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


def tip():
  List_files=["medium.txt", "globals.txt", "eastereggs.txt", "moving.txt", "markers.txt", "phrases.txt", "external.txt", "miscallenous.txt","selection.txt"]
  # print(float(vim.eval("s:vim_tips_tips_frequency")))

  if random.random() < float(vim.eval("s:vim_tips_tips_frequency")):
      filename = random.choice(List_files)
      pathfile = os.path.join(vim.eval("s:script_dir"),"tips",filename)
      with open(pathfile, "r") as f:
          for line in f.readlines():
                  Tip_list.append(line.rstrip())

      return "Tip =>  "+random.choice(Tip_list)
  else:
      with open(vim.eval("s:vimrc"),"r") as f:
          for line in f.readlines():
              Tip_list.append(line)

      translated_list = [ translate(line) for line in Tip_list if (translate(line) != "" and translate(line) != None)]
      if len(translated_list) > 0:
          tline = random.choice(translated_list)
          return "Config =>  " + tline.rstrip()

s = tip()
s = s.replace("\\", "\\\\")
s = s.replace("\"", "\\\"")
vim.command("let s:tip =\"%s\""%s)
EOF

  return s:tip
endfunction


function DisplayTip()
  echo g:GetTip()
endfunction


if has('python3')
  if s:vim_tips_display_at_startup
    autocmd VimEnter * call DisplayTip()
  endif
endif

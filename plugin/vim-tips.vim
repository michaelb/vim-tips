if exists("g:vim_tips")
    finish
endif
let g:vim_tips= 1

let s:script_dir = fnamemodify(resolve(expand('<sfile>', ':p')), ':h')

function! DisplayTip() 
python3 << EOF
import random
import vim
Tip_list = []


for filename in ["medium.txt", "globals.txt", "eastereggs.txt", "moving.txt", "markers.txt", "phrases.txt", "external.txt", "miscallenous.txt"]:
    with open(vim.eval("s:script_dir")+"/tips/"+filename, "r") as f:
        for line in f.readlines():
            Tip_list.append(line)

print("Tip =>  "+random.choice(Tip_list), end="")
EOF
endfunction


autocmd VimEnter * call DisplayTip()








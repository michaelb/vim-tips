if exists("g:vim_tips")
    finish
endif
let g:vim_tips= 1

let s:vim_tips_tips_frequency=get(g:,'vim_tips_tips_frequency',0.5)
let s:vim_tips_display_at_startup=get(g:,'vim_tips_display_at_startup',1)


let s:script_dir = fnamemodify(resolve(expand('<sfile>', ':p')), ':h')
let s:vimrc = $MYVIMRC



function Rand()
    return str2nr(matchstr(reltimestr(reltime()), '\v\.@<=\d+')[1:])
endfunction



function GetTip()
  let s:random_number = Rand()
  let s:number_categories = 9
  let s:chosen_category = s:random_number % s:number_categories

  let s:prefix = "Tip => "
  let s:tip = ""
  if s:chosen_category == 0 
    let s:tip = GetEasterEgg()
  elseif s:chosen_category == 1
    let s:tip = GetExternal()
  elseif s:chosen_category == 2
    let s:tip = GetGlobals()
  elseif s:chosen_category == 3 
    let s:tip = GetMarkers()
  elseif s:chosen_category == 4
    let s:tip = GetMedium()
  elseif s:chosen_category == 5
    let s:tip = GetMiscallenous()
  elseif s:chosen_category == 6
    let s:tip = GetMoving()
  elseif s:chosen_category == 7
    let s:tip = GetPhrases()
  elseif s:chosen_category == 8
    let s:tip = GetSelection()
  endif
  return s:prefix.s:tip
endfunction


function GetEasterEgg()
  let s:tiplist = [ ":help 42     : Easter Egg", ":help holy-grail      :Easter Egg",":help!      :Easter Egg",":help map-modes      :Easter Egg",":help UserGettingBored      :Easter Egg",":help showmatches     :Easter Egg",":Ni!     :Easter E",]
  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction

function GetExternal()
 let s:tiplist =[":%!sort -u           : sort contents, keeping unique lines only","!sort              : sort lines selected in visual range","!grep word         : keep only lines containing <word> in selected range",]
  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction


function GetGlobals()
 let s:tiplist =[":g/one\|two/     : list lines containing \"one\" or \"two\"",":g/^\s*$/d       : delete all blank lines",":g/green/d       : delete all lines containing \"green\"",":v/green/d       : delete all lines not containing \"green\"",":v/./.,/./-1join : compress empty lines",":g/search_pattern/#              : display with line numbers","g~iw     : switch case of current word","gUiw     : make current word uppercase","guiw     : make current word lowercase",]
  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction





function GetMarkers()
 let s:tiplist =["`.       : jump to exact spot in last modification line","<C-O>    : retrace your movements in file (backward)","<C-I>    : retrace your movements in file (forward)",":ju(mps) : list of your movements {{help|jump-motions}}",":history : list of all your command","m{a-z}     : marks current position as {a-z}, eg: ma marks as \"a\"","'a       : move to first character of 'a-marked line","y'a       : yank from current position to (incl.) 'a-marked line",]

  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction




function GetMedium()
 let s:tiplist =["^ w e $     : bigger movements: beginning of line, word, end of word, end of line","c        : starts a change command","C        : change to end of line (same as c$)","ce       : change to end of word (a complete change command)","* # g* g#     : find word under cursor (forwards/backwards)","%             : match brackets {}[]()",":ls     : list of buffers(eg following)",":cd ..  : move to parent directory","Vu      : lowercase line","VU      : uppercase line","~       : invert case (upper->lower; lower->upper) of current character","gf      : open file name under cursor (SUPER)","ga      : display hex, ascii value of character under cursor","g8      : display hex value of utf-8 character under cursor","xp      : swap next two characters around","CTRL-A,CTRL-X : increment, decrement next number on same line as the cursor","CTRL-R=5*5    : insert 25 into text","=             : (re)indent the text on the current line or on the area selected (SUPER)","=%            : (re)indent the current braces { ... }","G=gg          : auto (re)indent entire document",".           : repeat previous command",":&     : redo last substitution","@     :repeat last \": command\"",":vs     : vertical split",":vs filename     : open \"filename\" in new vertical split",":sp     : horizontal split","gv      : reselect last visual area (super useful)","o      : navigate visual area (after visual selection)","CTRL + ]     : jump to definition of function under cursor (need tags)","\"_d  (motion)   : delete without destroying default buffer contents ex: \"_dd","g<C-G>     :count words/lines in file",":sav new_name     : save file as filename","CTRL + w + w ....    : cycle splits","ls     : show current buffer","b number     : open buffer #number in this window","?      : jump to definition tag (call ALEGoToDefinition)","CTRL + T     : jump back from definition tag to old position",":r [name]      : insert the file [name] below the cursor.",":r !{cmd}      : execute {cmd} and insert its standard output below the cursor.",]
  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction


function GetMiscallenous()
 let s:tiplist =[":w! sudo tee %      :write as root (ask password)","CTRL + w + =      :resize splits equally","[[      : jump to function start",":new file.txt     : open file.txt in new split","gt      : show next tab","=%      : indent code between parenthesis","C-w      : (in insert mode) erases word from start to position","C-u      : (in insert mode) erases line from start to position","//       : run your previous search","CTRL + w + x     : exchange with next window",]
  let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction


function GetMoving()
 let s:tiplist =["CTRL + F     : move one page down (Forward)","CTRL + B     : move one page up (Backward)","zz     : recenter page around cursor","+     : go to the next line","h       : move left","j       : move down","k       : move up","l       : move right","w       : jump by start of words (punctuation considered words)","W       : jump by words (spaces separate words)","e       : jump to end of words (punctuation considered words)","E       : jump to end of words (no punctuation)","b       : jump backward by words (punctuation considered words)","B       : jump backward by words (no punctuation)","ge      : jump backward to end of words","0       : (zero) start of line","^       : first non-blank character of line","$       : end of line","-       : move line upwards, on the first non blank character","+       : move line downwards, on the first non blank character","<enter>      : move line downwards, on the first non blank character","gg      : go to first line","G       : go to last line","nG      : go To line n",":n      : go To line n",")       : move the cursor forward to the next sentence","(       : move the cursor backward by a sentence","{}       : move the cursor a paragraph forwards","]]      : move the cursor a section forwards or to the next {","[[      : move the cursor a section backwards or the previous {","H       : move the cursor to the top of the screen.","M       : move the cursor to the middle of the screen","L       : move the cursor to the bottom of the screen","%       : move to matching bracket/parenthesis","[m      : move to beginning of previous method / block","[M      : move to end of previous method / block","]m      : move to beginning of next method / block","]M      : move to end of next method / block","g;      : jump to next change","g,      : jump to previous change","CTRL + o     : go to previous cursor position","CTRL + i     : go to next cursor position",]
 let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction



function GetPhrases()
 let s:tiplist =["diw     : Delete Inside Word","ciw     : Change Inside Word","di(     : Delete Inside parenthesis","dt\"     : Delete Till quote","dap     : Delete Around Paragraph","dis     : Delete Inside Sentence","vib     : Select (visual) Inside Brackets - (,[,{","cib     : Change Inside Brackets - (,[,{",]
 let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction



function GetSelection()
 let s:tiplist =["V    : select entire lines","C-v    : select as bloc (columns)","gv    : relesect last visual selection","v%       : selects matching parenthesis","vi{      : selects inside matching curly braces","vi\"      : select inside matching quotes","c%       : cut until end of next bracketed (,{,[ s",]
 let s:index = Rand() % len(s:tiplist)
  return s:tiplist[s:index]
endfunction

function DisplayTip()
  echo g:GetTip()
endfunction


if s:vim_tips_display_at_startup
  autocmd VimEnter * call DisplayTip()
endif

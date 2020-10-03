# Vim-Tips

simple plugin that display a tip at startup, no configuration required

## Installation

(recommended)

Use your favorite plugin manager; ex `vim-plug`:

```vim
Plug 'michaelb/vim-tips'
```

You need a python(3+)-enabled vim/neovim

## Add your own tips

If you want, you can add your own tips by modifying the files in the tips folder.
You may find them on your own system (probably in your plugin manager's files), but to simplify that I suggest forking my repo and add your own changes in a version controlled repo.

## Important note

If you are using a autoload session restore (from mksession) it displays a message and therefore hide the vim-tips message

## Your own mappings

vim-tips reads from your vim/neovim config file and displays the lines it recognizes.

For example;
`nnoremap gd :ALEGoToDefinition`
will display the tip "Config => gd :ALEGoToDefinition (normal mode)".

If you'd like to display tips (versus mappings from your own config file), you can adjust the frequency via
`let g:vim_tips_tips_frequency=0.5` (with a value between 0.0 and 1.0, higher value increase tips frequency)

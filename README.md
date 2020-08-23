# Vim-Tips

simple plugin that display a tip at startup, no configuration required

## Installation

(recommended)

Use your favorite plugin manager; ex `vim-plug`:

```vim
Plug 'michaelb/vim-tips'
```

## Add your own tips

If you want, you can add your own tips by modifying the files in the tips folder.
You may find them on your own system (probably in your plugin manager's files), but to simplify that I suggest forking my repo and add your own changes in a version controlled repo.

## Important note

If you are using a autoload session restore (from mksession) it displays a message and therefore hide the vim-tips message

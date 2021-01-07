# Vim-Tips

A simple plugin that display a tip at startup, no configuration required

![](example.png)

## Installation

Use your favorite plugin manager; ex `vim-plug`:

```vim
Plug 'michaelb/vim-tips'
```

You need a python(3+)-enabled vim/neovim. Other than that vim-tips should be, vim (incl <8), neovim, linux, macOS and windows compatible

## Usage

vim-tips prints a message in the command area at startup.

However, you can request tips by calling the function `GetTip()` to get a string value usable in vimscript. Ex:

```
let tip = GetTip()
echo tip
```

Don't forget to load vim-tips beforehand if necessary (you need it at startup) by preceding calls to GetTip() by a 
`runtime plugin/vim-tips.vim`

## Add tips to vim-startify (courtesy of R0LA1mRifcF8yAkk)
To display a tip (and not a quote) in your vim-startify you can include the following in your config file:

`let g:startify_custom_header = 'startify#pad([GetTip()])'`

You'll probably also want to deactivate the basic tip display at startup.

## Add your own tips

If you want, you can add your own tips by modifying the files in the tips folder.
You may find them on your own system (probably in your plugin manager's files), but to simplify that I suggest forking my repo and adding your own changes in a version controlled repo.

Tips must not exceed 70 characters

## Important note

If you are using an autoload session restore (from mksession) it displays a message and therefore hide the vim-tips message.

## Your own mappings

vim-tips reads from your vim/neovim config file and displays the lines it recognizes.

For example;
`nnoremap gd :ALEGoToDefinition`
will display the tip "Config => gd :ALEGoToDefinition (normal mode)".

If you'd like to display tips more often (and see less mappings from your own config file), you can adjust the tips frequency via
`let g:vim_tips_tips_frequency=0.5` (with a value between 0.0 and 1.0, higher value increase tips frequency)

## Hiding the message at startup

You can specify `let g:vim_tips_display_at_startup=0` (default :`1`) to not have a message displayed at startup. You can then get tips by using the `GetTip()` function

##Special thanks

To @R0LA1mRifcF8yAkk and @Kamilcuk who have opened so many relevant issues, and helped me catch edge cases and suggested improvements.

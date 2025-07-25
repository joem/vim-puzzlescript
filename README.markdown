# puzzlescript.vim

This is a plugin primarily to add syntax highlighting to PuzzleScript (.pz) files.
(For more about PuzzleScript, see here: [https://www.puzzlescript.net](https://www.puzzlescript.net))

(Note: Unlike the PuzzleScript editor, colors here do not indicate a lack of errors. This syntax highlighting does not check the validity of your code.)

With this plugin, whenever you load a PuzzleScript file with the `.pz` extension (or manually set the filetype with `:set ft=puzzlescript`), this plugin will highlight the file for you. By default the colors are set to mimic the PuzzleScript editor in dark mode.

{TODO: Insert screenshot here!}

(The dark version of the PuzzleScript syntax highlighting should work OK for most dark background Vim themes, but if you have issues, please see the Extra Settings section below.)

You can switch the PuzzleScript colors to light mode by adding the following to your `.vimrc`:

```vim
" Set the custom PuzzleScript colors to light theme instead of the default dark:
let g:pz_light_colors = 1
```

{TODO: Insert screenshot here!}

(The light version of the PuzzleScript syntax highlighting should work OK for most light background Vim themes, but if you have issues, please see the Extra Settings section below.)

Or you can disable these colors entirely and let Vim highlight them according to your current colorscheme. To do so, add this line to your `.vimrc`:

```vim
" Disable the custom PuzzleScript syntax colors and stick to standard groups:
let g:pz_disable_custom_colors = 1
```

*NOTE: The standard highlight groups in this syntax haven't been set up yet, so this will just make no highlighting occur right now. This will be fixed soon.*


## Installation

Install using your favourite package manager, or use Vim's built-in package support:

    mkdir -p ~/.vim/pack/joem/start
    cd ~/.vim/pack/joem/start
    git clone https://github.com/joem/vim-puzzlescript.git

Note: The `joem` in `~/.vim/pack/joem/start` above could actually be set to anything you want.


## Extra Settings

This syntax highlighting only changes the typical things that syntax highlighting usually changes. If you _really_ want to make Vim look like the PuzzleScript editor, you'll need to set/change a few other things that are outside the scope of syntax highlighting, like background, line numbers, cursorline, but these end up changing these settings for all open buffers, not just the puzzlescript ones. Perhaps one day I'll add a plugin that optionally sets these for you whenever you switch to a PuzzleScript buffer (and returns them to normal when you leave it), but for now I'll just include the commands that you can set if you'd like.

PuzzleScript dark theme extra settings:

```vim
" Set the background color:
hi Normal ctermfg=Green ctermbg=Black guifg=#1DC116 guibg=#0F192A

" Turn on line numbers:
set number

" Set the line number colors:
hi LineNr ctermfg=DarkGrey ctermbg=Black guifg=DarkGrey guibg=#0F192A

" Turn on cursorline highlighting:
set cursorline

" Set the cursorline colors:
hi CursorLine term=bold cterm=bold guibg=#203040

" Set the cursorlinenr colors:
hi CursorLineNr ctermfg=DarkGrey ctermbg=Black guifg=#999999 guibg=#19315B

" Set the selection color:
hi Visual term=reverse cterm=none ctermbg=White gui=none guifg=NONE guibg=#314D67
```

Or, all on one line, for easy copying'n'pasting into the command line:

```vim
hi Normal ctermfg=Green ctermbg=Black guifg=#1DC116 guibg=#0F192A | set number | hi LineNr ctermfg=DarkGrey ctermbg=Black guifg=DarkGrey guibg=#0F192A | set cursorline | hi CursorLine term=bold cterm=bold guibg=#203040 | hi CursorLineNr ctermfg=DarkGrey ctermbg=Black guifg=#999999 guibg=#19315B | hi Visual term=reverse cterm=none ctermbg=White gui=none guifg=NONE guibg=#314D67
```


PuzzleScript light theme extra settings:

```vim
" Set the foreground and background colors:
hi Normal ctermfg=Green ctermbg=White guifg=#1DC116 guibg=#ffffff

" Turn on line numbers:
set number

" Set the line number colors:
hi LineNr ctermfg=DarkGrey ctermbg=White guifg=#999999 guibg=#F5F5F5

" Turn on cursorline highlighting:
set cursorline

" Set the cursorline colors:
hi CursorLine term=bold cterm=bold guibg=#E8F2FF

" Set the cursorlinenr colors:
hi CursorLineNr ctermfg=DarkGrey ctermbg=White guifg=#999999 guibg=#C1C3D1

" Set the selection color:
hi Visual term=reverse cterm=reverse gui=none guifg=NONE guibg=#EEFFEE
```

Or, all on one line, for easy copying'n'pasting into the command line:

```vim
hi Normal ctermfg=Green ctermbg=White guifg=#1DC116 guibg=#ffffff | set number | hi LineNr ctermfg=DarkGrey ctermbg=White guifg=#999999 guibg=#F5F5F5 | set cursorline | hi CursorLine term=bold cterm=bold guibg=#E8F2FF | hi CursorLineNr ctermfg=DarkGrey ctermbg=White guifg=#999999 guibg=#C1C3D1 | hi Visual term=reverse cterm=reverse gui=none guifg=NONE guibg=#EEFFEE
```


## Shortcomings

Note: There are still a few visual differences between this syntax highlighting and PuzzleScript's editor:

- When selecting lines in the PuzzleScript editor, the highlight background color extends all the way to the edge of the editor, but in Vim it only extends as far as the text on each line does. As far as I can tell, there's no way to make Vim's selections work (visually) like the PuzzleScript editor.
- PuzzleScript's editor shows a thin vertical line separating the line numbers from the file contents, but Vim does not. As far as I know, there's no way to do this in Vim.
- PuzzleScript's editor shows the object art in the colors that the art is actually in, whereas this doesn't. It might yet be possible to do this, but I haven't figured out how.
- PuzzleScript's editor detects and highlights the level maps in the LEVELS section, whereas this doesn't. I think there might be a way to do this, but again, I haven't figured it out yet.
- PuzzleScript's editor's highlighting often can indicate errors, whereas this isn't as smart and won't indicate most errors (though it might show a few in certain places.
- In PuzzleScript's editor, some keywords are different colors or weights in different sections (for instance, sfx0-sfx9 are normal weight in the SOUNDS section, but bold weight in the RULES section). This should be fixable, but I haven't gotten it working yet.


## License

Copyright © Joe Miragliuolo.  Distributed under the same terms as Vim itself.
See `:help license` in Vim.


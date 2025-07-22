# puzzlescript.vim

This is a plugin primarily to add syntax highlighting to PuzzleScript (.pz) files.

For more about PuzzleScript, see here: https://www.puzzlescript.net

Initially, the colors will be hardcoded in the syntax highlighting and they'll match the colors in the PuzzleScript editor as closely as possible. But I'd like to break the colors out into their own colorscheme which gets loaded when you open a PuzzleScript file (and can be optionally disabled, if you want to use your own colorscheme for syntax highlighting). And eventually I'd like to add some functionality that's useful for PuzzleScript development, such as rotating objects and error detection like how the original editor does it.

Admittedly this plugin will be of limited use, since most people developing PuzzleScript just use the editor built-in to the PuzzleScript site, but I wanted to make this anyway for some practice and since I've been viewing some PuzzleScript games in vim.

General to-do:

- [ ] Clean everything up!
- [ ] Put on github

Look to some Tim Pope plugins to see probably best-practices:
https://github.com/tpope/vim-vinegar

## Installation

Install using your favourite package manager, or use Vim's built-in package support:

    mkdir -p ~/.vim/pack/tpope/start
    cd ~/.vim/pack/tpope/start
    git clone https://github.com/tpope/vim-vinegar.git

## Usage

**TODO: Maybe move this bit up to the main section??**

Whenever you load a PuzzleScript file with the `.pz` extension (or manually set the filetype with `:set ft=puzzlescript`), this plugin will highlight the file for you. By default the colors are set to mimic the PuzzleScript editor in dark mode.

{TODO: Insert screenshot here!}

{TODO: Mention what background color to optimally set, and how to do it.}

You can switch the PuzzleScript colors to light mode by adding the following to your `.vimrc`:

```vim
" Set the custom PuzzleScript colors to light theme instead of the default dark:
let g:pz_light_colors = 1
```

{TODO: Insert screenshot here!}

{TODO: Mention what background color to optimally set, and how to do it.}

*NOTE: The light colors haven't been set up yet, so this will just make no highlighting occur.*

Or you can disable these colors entirely and let Vim highlight them according to your current colorscheme. To do so, add this line to your `.vimrc`:

```vim
" Disable the custom PuzzleScript syntax colors and stick to standard groups:
let g:pz_disable_custom_colors = 1
```

*NOTE: The standard highlight groups haven't been set up yet, so this will just make no highlighting occur.*


## ftdetect/puzzlescript.vim

**TODO: Remove this section when I no longer need the notes/todos!**

clean this up

look at other ftdetect scripts to see if there's anything else I should do


## syntax/puzzlescript.vim

**TODO: Remove this section when I no longer need the notes/todos!**

Still to do:

- [ ] Highlight the object names in the OBJECTS section
- [ ] Highlight the characters and names in the LEGEND section
- [ ] Highlight the object names in the SOUNDS section
- [ ] Highlight the object names in the COLLISIONLAYERS section
- [ ] Get `[>` and `|>` highlighting working right (in the RULES section, or everywhere)
- [ ] Highlight object names in WINCONDITIONS section
- [ ] Highlight the levels in the LEVELS section
- [ ] ...and fix anything with a TODO or FIXME label

" TODO: These pzRuleCommandWords show up bold in the rules section, but the
" ones that are also in pzSoundEvents (like `restart`) don't show up bold in
" the sounds section.

" TODO: Make 'no' get highlighted differently in rules vs winconditions!

" TODO: Do `highlight link` instead of just `highlight` so you can link them
" to proper highlight groups so that people can use whatever colorscheme works
" for them.
" See https://vimhelp.org/syntax.txt.html#group-name for the available groups.

" TODO: ALSO Add all these colors as a color scheme and set up some rules to
" optionally use them just for puzzlescript files.
" See the following for help with that:
" https://stackoverflow.com/questions/50134833/set-a-colorscheme-for-a-filetype-in-vim
" https://stackoverflow.com/questions/5171184/how-to-set-a-different-colorscheme-for-each-file-type-in-vim

clean up the file and all the temporary lines throughout and at the end


## License

Copyright © Joe Miragliuolo.  Distributed under the same terms as Vim itself.
See `:help license` in Vim.


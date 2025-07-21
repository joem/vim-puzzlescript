# vim-puzzlescript

This is a plugin primarily to add syntax highlighting to PuzzleScript (.pz) files.

For more about PuzzleScript, see here: https://www.puzzlescript.net

Initially, the colors will be hardcoded in the syntax highlighting and they'll match the colors in the PuzzleScript editor as closely as possible. But I'd like to break the colors out into their own colorscheme which gets loaded when you open a PuzzleScript file (and can be optionally disabled, if you want to use your own colorscheme for syntax highlighting). And eventually I'd like to add some functionality that's useful for PuzzleScript development, such as rotating objects and error detection like how the original editor does it.

Admittedly this plugin will be of limited use, since most people developing PuzzleScript just use the editor built-in to the PuzzleScript site, but I wanted to make this anyway for some practice and since I've been viewing some PuzzleScript games in vim.

General to-do:

- [ ] Clean everything up!
- [ ] Put on github

Look to some Tim Pope plugins to see probably best-practices:
https://github.com/tpope/vim-vinegar


## colors/puzzlescript.vim

TODO: Add all the colors from the syntax as a color scheme and set up some rules to optionally use them just for puzzlescript files.
See the following for help with that:
https://stackoverflow.com/questions/50134833/set-a-colorscheme-for-a-filetype-in-vim
https://stackoverflow.com/questions/5171184/how-to-set-a-different-colorscheme-for-each-file-type-in-vim

Checkout vim's default colorschemes to see how they're set up and formatted and such.

- https://github.com/vim/vim/blob/master/runtime/colors/elflord.vim
- https://github.com/vim/vim/blob/master/runtime/colors/

and some more complex themes:
https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim

some help:
https://vi.stackexchange.com/questions/2782/how-can-i-create-my-own-colorscheme


## ftdetect/puzzlescript.vim

clean this up

look at other ftdetect scripts to see if there's anything else I should do


## ftplugin/puzzlescript.vim

Set it up to use colors/puzzlescript.vim colorscheme when and only when using puzzlescript (.pz) files.
See the following for help with that:
https://stackoverflow.com/questions/50134833/set-a-colorscheme-for-a-filetype-in-vim
https://stackoverflow.com/questions/5171184/how-to-set-a-different-colorscheme-for-each-file-type-in-vim

Make it able to be set to not use the puzzlescript colorscheme, if desired.


## syntax/puzzlescript.vim

Still to do:

- [ ] Highlight the object names in the OBJECTS section
- [ ] Highlight the characters and names in the LEGEND section
- [ ] Highlight the object names in the SOUNDS section
- [ ] Highlight the object names in the COLLISIONLAYERS section
- [ ] Get `[>` and `|>` highlighting working right (in the RULES section, or everywhere)
- [ ] Highlight object names in WINCONDITIONS section
- [ ] Highlight the levels in the LEVELS section

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




" syntax/puzzlescript.vim

" Unofficial syntax highlighting for Puzzlescript (https://www.puzzlescript.net)
" By Joe Miragliuolo

" Still to do:
" - [ ] Highlight the object names in the OBJECTS section
" - [ ] Highlight the characters and names in the LEGEND section
" - [ ] Highlight the object names in the SOUNDS section
" - [ ] Highlight the object names in the COLLISIONLAYERS section
" - [ ] Get `[>` and `|>` highlighting working right (in the RULES section, or everywhere)
" - [ ] Highlight object names in WINCONDITIONS section
" - [ ] Highlight the levels in the LEVELS section


syntax case ignore

syntax match pzBrackets /[\[\]\|]/


" const sectionNames = ['objects', 'legend', 'sounds', 'collisionlayers', 'rules', 'winconditions', 'levels'];
syntax keyword pzSectionNames objects legend sounds collisionlayers rules winconditions levels

"var PRELUDE_COMMAND_WORDS = [
"    "METADATA",//tag
" With arguments:
"    ["again_interval", "0.1"],
"    ["author", "Gill Bloggs"],
"    ["flickscreen", "8x5"],
"    ["homepage", "www.puzzlescript.net"],
"    ["key_repeat_interval", "0.1"],
"    ["title", "My Amazing Puzzle Game"],
"    ["zoomscreen", "WxH"]
"    ["realtime_interval", ""],
" With arguments, but the highlighting is handled differently:
"    ["background_color", "blue"],
"    ["color_palette", "arne"],
"    ["text_color", "orange"],
" No arguments:
"    ["debug", ""],
"    ["noaction", ""],
"    ["norepeat_action", ""],
"    ["norestart", ""],
"    ["noundo", ""],
"    ["require_player_movement", ""],
"    ["run_rules_on_level_start", ""],
"    ["scanline", ""],
"    ["throttle_movement", ""],
"    ["verbose_logging", ""],

syntax match pzPreludeCommandWordsKeys /\<again_interval\>/
syntax match pzPreludeCommandWordsKeys /\<author\>/
syntax match pzPreludeCommandWordsKeys /\<flickscreen\>/
syntax match pzPreludeCommandWordsKeys /\<homepage\>/
syntax match pzPreludeCommandWordsKeys /\<key_repeat_interval\>/
syntax match pzPreludeCommandWordsKeys /\<realtime_interval\>/
syntax match pzPreludeCommandWordsKeys /\<title\>/
syntax match pzPreludeCommandWordsKeys /\<zoomscreen\>/
syntax match pzPreludeCommandWordsValues /\<again_interval\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<author\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<flickscreen\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<homepage\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<key_repeat_interval\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<realtime_interval\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<title\>.*/ contains=pzPreludeCommandWordsKeys
syntax match pzPreludeCommandWordsValues /\<zoomscreen\>.*/ contains=pzPreludeCommandWordsKeys

syntax keyword pzPreludeCommandWordsWithArgsButEasy background_color color_palette text_color
syntax keyword pzPreludeCommandWords debug noaction norepeat_action norestart noundo require_player_movement run_rules_on_level_start scanline throttle_movement verbose_logging

"var COLOR_WORDS = [ "COLOR",//special tag "black", "blue", "brown", "darkblue", "darkbrown", "darkgray", "darkgreen", "darkred", "gray", "green", "lightblue", "lightbrown", "lightgray", "lightgreen", "lightred", "orange", "pink", "purple", "red", "transparent", "white", "yellow"];
syntax match pzcolorblack       /\<black\>/
syntax match pzcolorblue        /\<blue\>/
syntax match pzcolorbrown       /\<brown\>/
syntax match pzcolordarkblue    /\<darkblue\>/
syntax match pzcolordarkbrown   /\<darkbrown\>/
syntax match pzcolordarkgray    /\<darkgray\>\|\<darkgrey\>/
syntax match pzcolordarkgreen   /\<darkgreen\>/
syntax match pzcolordarkred     /\<darkred\>/
syntax match pzcolorgray        /\<gray\>\|\<grey\>/
syntax match pzcolorgreen       /\<green\>/
syntax match pzcolorlightblue   /\<lightblue\>/
syntax match pzcolorlightbrown  /\<lightbrown\>/
syntax match pzcolorlightgray   /\<lightgray\>\|\<lightgrey\>/
syntax match pzcolorlightgreen  /\<lightgreen\>/
syntax match pzcolorlightred    /\<lightred\>/
syntax match pzcolororange      /\<orange\>/
syntax match pzcolorpink        /\<pink\>/
syntax match pzcolorpurple      /\<purple\>/
syntax match pzcolorred         /\<red\>/
syntax match pzcolortransparent /\<transparent\>/
syntax match pzcolorwhite       /\<white\>/
syntax match pzcoloryellow      /\<yellow\>/

"var RULE_COMMAND_WORDS = [ "COMMAND", "again", "cancel", "checkpoint", "message", "restart", "win"];
syntax keyword pzRuleCommandWords again cancel checkpoint restart win
" Omitted 'message' so that can be handled differently
" TODO: These pzRuleCommandWords show up bold in the rules section, but the
" ones that are also in pzSoundEvents (like `restart`) don't show up bold in
" the sounds section.

"var SFX_COMMAND_LIST = ["sfx0", "sfx1", "sfx2", "sfx3", "sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10"];
syntax keyword pzSfxCommandList sfx0 sfx1 sfx2 sfx3 sfx4 sfx5 sfx6 sfx7 sfx8 sfx9 sfx10
" NOTE: Might need to handle this different in order to highlight the numbers?

"var CARDINAL_DIRECTION_WORDS = [ "DIRECTION", "up","down","left","right","horizontal","vertical"]
syntax keyword pzCardinalDirectionWords up down left right horizontal vertical

"var RULE_DIRECTION_WORDS = [ "DIRECTION",//tag "up", "down", "left", "right", "random", "horizontal", "vertical","late","rigid"]
syntax keyword pzRuleDirectionWords random late rigid
" Removed the duplicates this shared with pzCardinalDirectionWords

"var LOOP_WORDS = [ "BRACKET",//tag "startloop","endloop"]
" syntax match pzloops /\<startloop\>\|\<endloop\>/
syntax keyword pzLoopWords startloop endloop

"var PATTERN_DIRECTION_WORDS = [ "DIRECTION", "up", "down", "left", "right", "moving", "stationary", "no", "randomdir", "random", "horizontal", "vertical", "orthogonal", "perpendicular", "parallel", "action"]
syntax keyword pzPatternRuleDirectionWords moving stationary no randomdir orthogonal perpendicular parallel action
" Removed the duplicates this shared with pzRuleDirectionWords
" TODO: Make 'no' get highlighted differently in rules vs winconditions!

"var SOUND_EVENTS = [ "SOUNDEVENT", "cancel", "closemessage", "endgame", "endlevel", "restart", "showmessage", "startgame", "startlevel", "titlescreen", "undo", "sfx0", "sfx1", "sfx2", "sfx3", "sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10"
syntax keyword pzSoundEvents closemessage endgame endlevel showmessage startgame startlevel titlescreen undo
" Removed duplicates this shared with pzRuleCommandWords and pzSfxCommandList

"var SOUND_VERBS = [ "SOUNDVERB", "action", "cantmove", "create", "destroy", "move"
syntax keyword pzSoundVerbs cantmove create destroy move 
" Removed dupes with pzPatternRuleDirectionWords

"var SOUND_DIRECTIONS = [ "DIRECTION", "up","down","left","right","horizontal","vertical","orthogonal"]
" Skipped all these since they're all dupes and use the same color.

"var WINCONDITION_WORDS = [ "LOGICWORD", "some", "on", "no", "all"]
syntax keyword pzWinconditionWords some on all
" Removed duplicates with pzPatternRuleDirectionWords
" TODO: Make 'no' get highlighted differently in rules vs winconditions!

"var LEGEND_LOGICWORDS = [ "LOGICWORD", "and","or"
syntax keyword pzLegendLogicwords and or

"var PRELUDE_COLOR_PALETTE_WORDS = [ "amiga", "amstrad", "arnecolors", "atari", "c64", "ega", "famicom", "gameboycolour", "mastersystem", "pastel", "proteus_mellow", "proteus_night", "proteus_rich", "whitingjp"
syntax keyword pzPreludeColorPaletteWords amiga amstrad arnecolors atari c64 ega famicom gameboycolour mastersystem pastel proteus_mellow proteus_night proteus_rich whitingjp

"TODO: Get v and ^ and > and < all working here!
" This basic approach only works for V:
" syntax keyword pzRuleDirectionChars v
" This approach highlights them, but messes up the [ at the start of the line
" with a v or > or <, and it doesn't highlight ^ at all. Also it highlights
" the v in LEVELS:
" syntax match pzRuleDirectionChars /v\|^\|>\|</
" This approach makes v work great and doesn't mess up any [ but it doesn't
" highlight < or > or ^:
" syntax match pzRuleDirectionChars /\<v\>\|\<^\>\|\<>\>\|\<<\>/
" ChatGPT gave me this, which matches them everywhere no matter what:
" syntax match pzRuleDirectionChars /[v><^]/
" It refined it to this:
" syntax match pzRuleDirectionChars /\v<([v><^])>/
" And then refined it further to this, but I wanted it to match when things
" immediately follow [ or | too:
" syntax match pzRuleDirectionChars /\(^\|\s\)\zs[v><^]\ze\(\s\|$\)/
" When I asked it to fix it for that, it gave me this, which didn't do it:
" syntax match pzRuleDirectionChars /\(^\|\s\|\[|\)\zs[v><^]\ze\(\s\|$\)/
" And then I asked it again and it did this which was even worse:
" syntax match pzRuleDirectionChars /\(^\|[\s[|]\)\zs[v><^]\ze\(\s\|$\)/
syntax match pzRuleDirectionChars /\(^\|\s\|\[\||\)\zs[v><^]\ze\(\s\|$\)/




" syntax region objectsRegion start=/objects/ end=/legend/
" This includes OBJECTS and LEGEND
" syntax region objectsRegion start=/OBJECTS/ end=/LEGEND/
" This hopefully doesn't include OBJECTS and LEGEND
" syntax region objectsRegion start="OBJECTS\s*"ms=e+1 end="\s*LEGEND"me=s-1
" syntax region objectsRegion start="OBJECTS\s*"ms=e+1 end="\s*LEGEND"me=s-1 contains=ParagraphFirstWord


" " syntax region preludeRegion start=/\%^/ end="\s*OBJECTS"me=s-1
" " syntax match preludeRegion /^\%(^\n\n\|\%^\)\zs.*$/
" " syntax region preludeRegion start=/\%^\_.*/ end=/^.*OBJECTS.*$/ keepend contains=puzzlescriptComments
" " syntax region preludeRegion start=/\%^\_.*/ end=/^.*OBJECTS.*$/ keepend
" syntax region preludeRegion start=/\%^\_.*/ end=/^ *OBJECTS *$/me=s-1

" syntax region objectsRegion start=/^ *OBJECTS *$/ms=e+1 end=/^ *LEGEND *$/me=s-1
" " syntax region objectsRegion start=/^ *OBJECTS *$/ms=e+1 end=/^ *LEGEND *$/me=s-1 contains=FirstParaWord

" syntax region legendRegion start=/^ *LEGEND *$/ms=e+1 end=/^ *SOUNDS *$/me=s-1
" " transparent contains=LeftOfEquals,RightOfEquals

" " syntax match notEquals /[^=]\+/ containedin=legendRegion

" syntax region soundsRegion start=/^ *SOUNDS *$/ms=e+1 end=/^ *COLLISIONLAYERS *$/me=s-1


syntax region pzComment start=/(/ end=/)/ containedin=ALLBUT,pzMsgLineAfterMessage

syntax match pzSeparators /^==\+$/ containedin=ALL

" Can't seem to get this working right.....
" syntax match FirstParaWord /^\%(^\n\|\%^\)\n*\zs\w\+/ containedin=objectsRegion
" syntax match FirstParaWord /^\%(^\n\|\%^\)\n*\zs\w\+/ containedin=ALL
" " Highlight first word of each paragraph inside PreObjects
" syntax region FirstParaRegion start=/^\s*$/ end=/^\s*\S/me=e-1 contains=FirstParaWord containedin=objectsRegion transparent
" " Then match the first word on the following line
" syntax match FirstParaWord /^\s*\zs\S\+/ contained containedin=FirstParaRegion


" " Match everything before the first = on the line (but not including it)
" syntax match LeftOfEquals /^[^=]\+/ contains=NONE containedin=legendRegion

" " Match everything after the first = (but not including it)
" syntax match RightOfEquals /=\zs.*/ contains=NONE containedin=legendRegion



" For in the RULES section
syntax match pzArrow "->"

" For in the LEGEND section
syntax match pzEquals " = "

" syntax match ParagraphFirstWord "\\%(\n\n\\|\%^\\)\\s*\\w\\+" containedin=objectsRegion
" syntax match ParagraphFirstWord "\\%(\n\n\\|\%^\\)\\s*\\w\\+"
" syntax match ParagraphFirstWord /^\%(^\n\n\|\%^\)\zs.*$/


" Match and highlight the word 'message' itself
syntax match pzMsgKeyword /\<message\>/
" Match the word 'message' plus everything after it
syntax match pzMsgLineAfterMessage /\<message\>.*/ contains=pzMsgKeyword


" This works for the sound number since no other place would have numbers at
" the end of the line following a space. It's not perfect but it's good enough.
syntax match pzSoundNumber /\s\zs\d\+\ze$/
" There might be errant highlighting if a line of someone's level were all
" numbers AND they for some reason put a space in front of their level, which
" I'm not even sure if it's valid or not.


" Built-in colors that are safe to use for terminal:
" Number Name        Appearance (may vary)
" 0      Black       🖤 Black
" 1      DarkRed     ❤️  Dark Red
" 2      DarkGreen   💚 Dark Green
" 3      Brown       💛 Brown / Dark Yellow
" 4      DarkBlue    💙 Dark Blue
" 5      DarkMagenta 💜 Dark Magenta
" 6      DarkCyan    🩵 Dark Cyan
" 7      LightGray   🤍 Light Gray / Light Grey
" 8      DarkGray    🩶 Dark Gray / Grey
" 9      Red         ❤️  Bright Red
" 10     Green       💚 Bright Green
" 11     Yellow      💛 Bright Yellow
" 12     Blue        💙 Bright Blue
" 13     Magenta     💜 Bright Magenta
" 14     Cyan        🩵 Bright Cyan
" 15     White       🤍 Bright White

" TODO: Do `highlight link` instead of just `highlight` so you can link them
" to proper highlight groups so that people can use whatever colorscheme works
" for them.
" See https://vimhelp.org/syntax.txt.html#group-name for the available groups.
" TODO: ALSO Add all these colors as a color scheme and set up some rules to
" optionally use them just for puzzlescript files.
" See the following for help with that:
" https://stackoverflow.com/questions/50134833/set-a-colorscheme-for-a-filetype-in-vim
" https://stackoverflow.com/questions/5171184/how-to-set-a-different-colorscheme-for-each-file-type-in-vim

" highlight pzSeparators ctermfg=White guifg=#ffffff

highlight pzComment ctermfg=Gray guifg=#428BDD

highlight pzArrow ctermfg=Red guifg=#C11D16

highlight pzEquals ctermfg=Magenta guifg=#AE81FF

" Highlight 'message' and the text after it
highlight pzMsgKeyword ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold
highlight pzMsgLineAfterMessage ctermfg=Yellow cterm=italic guifg=#FFA500 gui=italic

highlight pzBrackets ctermfg=White guifg=#D1EDFF

" COMMAND color
highlight pzSectionNames ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold

highlight pzPreludeCommandWordsKeys ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold
highlight pzPreludeCommandWordsValues ctermfg=Yellow cterm=italic guifg=#FFA500 gui=italic
highlight pzPreludeCommandWordsWithArgsButEasy ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold
highlight pzPreludeCommandWords ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold

" The ctermfg colors are as good as I can do with the standard 16, I think.
highlight pzcolorblack       ctermfg=DarkGray    guifg=#555555
highlight pzcolorblue        ctermfg=Blue        guifg=#31A2F2
highlight pzcolorbrown       ctermfg=Brown       guifg=#A46422
" alt brown: #ba7f41
highlight pzcolordarkblue    ctermfg=DarkBlue    guifg=#005784
highlight pzcolordarkbrown   ctermfg=Brown       guifg=#493C2B
" alt darkbrown: #9a5f11
highlight pzcolordarkgray    ctermfg=DarkGray    guifg=#6D6D6D
highlight pzcolordarkgreen   ctermfg=DarkGreen   guifg=#2F484E
highlight pzcolordarkred     ctermfg=DarkRed     guifg=#732930
highlight pzcolorgray        ctermfg=LightGray   guifg=#9D9D9D
highlight pzcolorgreen       ctermfg=Green       guifg=#44891A
highlight pzcolorlightblue   ctermfg=Cyan        guifg=#B2DCEF
highlight pzcolorlightbrown  ctermfg=Yellow      guifg=#EEB62F
highlight pzcolorlightgray   ctermfg=LightGray   guifg=#c1c1c1
highlight pzcolorlightgreen  ctermfg=Green       guifg=#A3CE27
highlight pzcolorlightred    ctermfg=Red         guifg=#e06f8b
highlight pzcolororange      ctermfg=Yellow      guifg=#EB8931
" alt orange: #ff7700
highlight pzcolorpink        ctermfg=Magenta     guifg=#E06F8B
highlight pzcolorpurple      ctermfg=DarkMagenta guifg=#580780
highlight pzcolorred         ctermfg=Red         guifg=#BE2633
highlight pzcolortransparent ctermfg=LightGray   guifg=#777777
highlight pzcolorwhite       ctermfg=White       guifg=#FFFFFF
highlight pzcoloryellow      ctermfg=Yellow      guifg=#F7E26B
" alt yellow: #ffce00

" COMMAND color
highlight pzRuleCommandWords ctermfg=Magenta cterm=bold guifg=#AE81FF gui=bold

" COMMAND color
highlight pzSfxCommandList ctermfg=Magenta guifg=#AE81FF

" BRACKET color
highlight pzLoopWords ctermfg=White guifg=#D1EDFF

" DIRECTION color
highlight pzCardinalDirectionWords ctermfg=DarkMagenta guifg=#C11DC1
highlight pzRuleDirectionWords ctermfg=DarkMagenta guifg=#C11DC1
highlight pzPatternRuleDirectionWords ctermfg=DarkMagenta guifg=#C11DC1

" SOUNDEVENT color (same as COMMAND color)
highlight pzSoundEvents ctermfg=Magenta guifg=#AE81FF

" SOUNDVERB color (same as COMMAND color)
highlight pzSoundVerbs ctermfg=Magenta guifg=#AE81FF

" LOGICWORD color (same as COMMAND color)
highlight pzWinconditionWords ctermfg=Magenta guifg=#AE81FF

" LOGICWORD color (same as COMMAND color)
highlight pzLegendLogicwords ctermfg=Magenta guifg=#AE81FF

" These pzPreludeColorPaletteWords words aren't actually getting highlighted
" specifically in the editor, so maybe we shouldn't do it here. You can
" mispell them and they're still highlighted, as long as it's in the prelude
" after _any_ command.
" METADATATEXT color
highlight pzPreludeColorPaletteWords ctermfg=Yellow cterm=italic guifg=#FFA500 gui=italic

" DIRECTION color
highlight pzRuleDirectionChars ctermfg=DarkMagenta guifg=#C11DC1

highlight pzSoundNumber ctermfg=Yellow cterm=italic guifg=#FFA500 gui=italic


" ----------------------------------------------------------------------------
"  Colors from the OG editor:
" ----------------------------------------------------------------------------
" These come from src/css/midnight.css but I'm not 100% sure they're right.

" #203040 is the background color of the active line, I think?
" #0F192A is the main background color of the editor, I think?
" Setting these background colors are for a colorscheme, though, not a syntax
" highlighting.

" #AE81FF is the purple that's used for metadata labels, section names, equal
" signs in legend, and in legend, or in legend, verbs in sound, etc
"
" .cm-s-midnight span.cm-HEADER {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-ASSIGNMENT {
"     color: light-dark(#7c699e, #AE81FF);
" .cm-s-midnight span.cm-LOGICWORD {
"     color: light-dark(rgb(185, 95, 219), #AE81FF);
" .cm-s-midnight span.cm-COMMAND {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-MESSAGE_VERB {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-METADATA {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-SOUNDVERB {
"     color: #AE81FF;
" .cm-s-midnight span.cm-SOUNDEVENT {
"     color: #AE81FF;
" .cm-s-midnight span.cm-header {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-atom {
"     color: light-dark(#7b47db, #AE81FF);
" .cm-s-midnight span.cm-link {
"     color: #AE81FF;


" COMMENTS
" .cm-s-midnight span.cm-comment {
"     color: #428BDD;
"     font-style: italic;


" The green used for names of objects and stuff
" .cm-s-midnight span.cm-NAME {
"     color: #1DC116;
" .cm-s-midnight span.cm-IDENTIFIER {
"     color: #1DC116;
"     font-weight: bold;
" .cm-s-midnight span.cm-string {
"     color: #1DC116;


" The color used for brackets and pipes in the rules, I think.
" .cm-s-midnight span.cm-BRACKET {
"     color: light-dark(rgb(81, 112, 231), #D1EDFF);


" The red of an arrow in the rules:
" .cm-s-midnight span.cm-ARROW {
"     color: #C11D16;


" The slightly different purple of a direction in the rules:
" .cm-s-midnight span.cm-DIRECTION {
"     color: #C11DC1;


" The orange of the metadata text and the sound number:
" (#FFA500)
" .cm-s-midnight span.cm-MESSAGE {
"     color: orange;
"     font-style: italic;
" .cm-s-midnight span.cm-METADATATEXT {
"     color: light-dark(rgb(255, 127, 0), orange);
"     font-style: italic;
" span.cm-SOUND {
"     color: orange;
"     text-decoration: underline;


" The light gray of a level:
" .cm-s-midnight span.cm-LEVEL {
"     color: light-dark(rgb(17, 99, 93), #AAAAAA);


" The color colors

" .cm-s-midnight span.cm-COLOR-TRANSPARENT { color: light-dark(rgb(199, 199, 199), #777777);

" .cm-s-midnight span.cm-COLOR-BLACK { color: light-dark(black, #555555);

" .cm-s-midnight span.cm-COLOR-WHITE { color: light-dark(#dedede, #FFFFFF);

" .cm-s-midnight span.cm-COLOR-GREY { color: #9D9D9D;

" .cm-s-midnight span.cm-COLOR-DARKGREY { color: #6D6D6D;

" .cm-s-midnight span.cm-COLOR-DARKGRAY { color: #6D6D6D;

" .cm-s-midnight span.cm-COLOR-LIGHTGREY { color: light-dark(rgb(171, 171, 171), #c1c1c1);

" .cm-s-midnight span.cm-COLOR-LIGHTGRAY { color: light-dark(rgb(171, 171, 171), #c1c1c1);

" .cm-s-midnight span.cm-COLOR-GRAY { color: #9D9D9D;

" .cm-s-midnight span.cm-COLOR-RED { color: #BE2633;

" .cm-s-midnight span.cm-COLOR-DARKRED { color: #732930;

" .cm-s-midnight span.cm-COLOR-LIGHTRED { color: #e06f8b;

" .cm-s-midnight span.cm-COLOR-BROWN { color: light-dark(#ba7f41, #A46422);

" .cm-s-midnight span.cm-COLOR-DARKBROWN { color: light-dark(#9a5f11, #493C2B);

" .cm-s-midnight span.cm-COLOR-LIGHTBROWN { color: #EEB62F;

" .cm-s-midnight span.cm-COLOR-ORANGE { color: light-dark(#ff7700, #EB8931);

" .cm-s-midnight span.cm-COLOR-YELLOW { color: light-dark(#ffce00, #F7E26B);

" .cm-s-midnight span.cm-COLOR-GREEN { color: #44891A;

" .cm-s-midnight span.cm-COLOR-DARKGREEN { color: #2F484E;

" .cm-s-midnight span.cm-COLOR-LIGHTGREEN { color: #A3CE27;

" .cm-s-midnight span.cm-COLOR-BLUE { color: #31A2F2;

" .cm-s-midnight span.cm-COLOR-DARKBLUE { color: #005784;

" .cm-s-midnight span.cm-COLOR-LIGHTBLUE { color: #B2DCEF;

" .cm-s-midnight span.cm-COLOR-PURPLE { color: #580780;

" .cm-s-midnight span.cm-COLOR-PINK { color: #E06F8B;




" ----------------------------------------------------------------------------
"  Thoughts on how to highlight stuff:
" ----------------------------------------------------------------------------

" Identifier
" any variable name
" - get all of these from the objects section and match them later in the file

" Constant
" any constant
" - treat the section names as these?
"   - technically they're keywords, but they're highlighted different in the OG editor
" - treat the numbers in the sounds as these?
"   - if so, treat the values of `title`, `author`, `homepage`, etc as these!

" Type
" int, long, char, etc.
" - use this for `<, >, ^, v, moving, stationary, left, right, up, down` etc things, since they're like types?

" Special
" any special symbol
" - use this for the `->` in the rules

" Statement
" any statement
" (also includes all Conditional, Repeat, Label, Operator, Keyword, Exception)
" - use this for remaining keywords, once you remove the above noted things

" Underlined
" - use this for the numbers of sounds
"   - or maybe the sound numbers should be Constant ???









" ----------------------------------------------------------------------------
"  Stuff from `/src/js/languageConstants.js`:
" ----------------------------------------------------------------------------

" const relativedirs = ['^', 'v', '<', '>', 'moving','stationary','parallel','perpendicular', 'no'];
" const sectionNames = ['objects', 'legend', 'sounds', 'collisionlayers', 'rules', 'winconditions', 'levels'];
" const commandwords = ["sfx0","sfx1","sfx2","sfx3","sfx4","sfx5","sfx6","sfx7","sfx8","sfx9","sfx10","cancel","checkpoint","restart","win","message","again"];
" const commandwords_sfx = ["sfx0", "sfx1", "sfx2", "sfx3", "sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10"];
" const reg_name = /[\p{L}\p{N}_]+[\p{Z}\s]*/u;///\w*[a-uw-zA-UW-Z0-9_]/;
" const reg_soundseed = /\d+\b/u;
" const reg_sectionNames = /(objects|collisionlayers|legend|sounds|rules|winconditions|levels)(?![\p{L}\p{N}_])[\p{Z}\s]*/u;
" const reg_equalsrow = /[\=]+/;
" const reg_notcommentstart = /[^\(]+/;
" const reg_match_until_commentstart_or_whitespace = /[^\p{Z}\s\()]+[\p{Z}\s]*/u;
" const reg_csv_separators = /[ \,]*/;
" const reg_soundverbs = /(move|action|create|destroy|cantmove)\b[\p{Z}\s]*/u;
" const soundverbs_directional = ['move','cantmove'];
" const reg_soundevents = /(undo|restart|titlescreen|startgame|cancel|endgame|startlevel|endlevel|showmessage|closemessage|sfx0|sfx1|sfx2|sfx3|sfx4|sfx5|sfx6|sfx7|sfx8|sfx9|sfx10)\b[\p{Z}\s]*/u;
" const reg_directions = /^(action|up|down|left|right|\^|v|\<|\>|moving|stationary|parallel|perpendicular|horizontal|orthogonal|vertical|no|randomdir|random)$/;
" const reg_loopmarker = /^(startloop|endloop)$/;
" const reg_ruledirectionindicators = /^(up|down|left|right|horizontal|vertical|orthogonal|late|rigid)$/;
" const reg_sounddirectionindicators = /[\p{Z}\s]*(up|down|left|right|horizontal|vertical|orthogonal)(?![\p{L}\p{N}_])[\p{Z}\s]*/u;
" const reg_winconditionquantifiers = /^(all|any|no|some)$/;
" const keyword_array = ['checkpoint','objects', 'collisionlayers', 'legend', 'sounds', 'rules', '...','winconditions', 'levels','|','[',']','up', 'down', 'left', 'right', 'late','rigid', '^','v','\>','\<','no','randomdir','random', 'horizontal', 'vertical','any', 'all', 'no', 'some', 'moving','stationary','parallel','perpendicular','action','message', "move", "action", "create", "destroy", "cantmove", "sfx0", "sfx1", "sfx2", "sfx3", "Sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10", "cancel", "checkpoint", "restart", "win", "message", "again", "undo", "restart", "titlescreen", "startgame", "cancel", "endgame", "startlevel", "endlevel", "showmessage", "closemessage"];

" const  directionaggregates = {
"     'horizontal': ['left', 'right'],
"     'horizontal_par': ['left', 'right'],
"     'horizontal_perp': ['left', 'right'],
"     'vertical': ['up', 'down'],
"     'vertical_par': ['up', 'down'],
"     'vertical_perp': ['up', 'down'],
"     'moving': ['up', 'down', 'left', 'right', 'action'],
"     'orthogonal': ['up', 'down', 'left', 'right'],
"     'perpendicular': ['^', 'v'],
"     'parallel': ['<', '>']
" };

" const relativeDirections = ['^', 'v', '<', '>', 'perpendicular', 'parallel'];
" const simpleAbsoluteDirections = ['up', 'down', 'left', 'right'];
" const simpleRelativeDirections = ['^', 'v', '<', '>'];
" const reg_directions_only = /^(\>|\<|\^|v|up|down|left|right|moving|stationary|no|randomdir|random|horizontal|vertical|orthogonal|perpendicular|parallel|action)$/;//redeclaring here, i don't know wh

" const REGEX_HEX = /^#([0-9A-F]{3}){1,2}$/i;

" const reg_color = /(black|white|gray|darkgray|lightgray|grey|darkgrey|lightgrey|red|darkred|lightred|brown|darkbrown|lightbrown|orange|yellow|green|darkgreen|lightgreen|blue|lightblue|darkblue|purple|pink|transparent|#(?:[0-9a-f]{3}){1,2})\s*/;

" // lots of hardcoded stuff for autocomplete in anyword-hint also, but 
" // it's not including here because I don't want to bloat the standalone
" // runtime unnecessarily.




" ----------------------------------------------------------------------------
"  Some stuff from `/src/js/codemirror/anyword-hint.js`:
"  (There's also a bunch of code in that file, but I don't know if it'd help.)
" ----------------------------------------------------------------------------

"var PRELUDE_COMMAND_WORDS = [
"    "METADATA",//tag
"    ["again_interval", "0.1"],
"    ["author", "Gill Bloggs"],
"    ["background_color", "blue"],
"    ["color_palette", "arne"],
"    ["debug", ""],
"    ["flickscreen", "8x5"],
"    ["homepage", "www.puzzlescript.net"],
"    ["key_repeat_interval", "0.1"],
"    ["noaction", ""],
"    ["norepeat_action", ""],
"    ["norestart", ""],
"    ["noundo", ""],
"    ["realtime_interval", ""],
"    ["require_player_movement", ""],
"    ["run_rules_on_level_start", ""],
"    ["scanline", ""],
"    ["text_color", "orange"],
"    ["throttle_movement", ""],
"    ["title", "My Amazing Puzzle Game"],
"    ["verbose_logging", ""],
"    ["zoomscreen", "WxH"]                    
"];

"var COLOR_WORDS = [
"    "COLOR",//special tag
"    "black", "blue", "brown", "darkblue", "darkbrown", "darkgray", "darkgreen", "darkred", "gray", "green", "lightblue", "lightbrown", "lightgray", "lightgreen", "lightred", "orange", "pink", "purple", "red", "transparent", "white", "yellow"];
"var RULE_COMMAND_WORDS = [
"    "COMMAND",
"    //sfx added manually based on definitions
"    "again", "cancel", "checkpoint", "message", "restart", "win"];
"var SFX_COMMAND_LIST = ["sfx0", "sfx1", "sfx2", "sfx3", "sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10"];

"var CARDINAL_DIRECTION_WORDS = [
"    "DIRECTION",
"    "up","down","left","right","horizontal","vertical"]

"var RULE_DIRECTION_WORDS = [
"    "DIRECTION",//tag
"    "up", "down", "left", "right", "random", "horizontal", "vertical","late","rigid"]

"var LOOP_WORDS = [
"    "BRACKET",//tag
"    "startloop","endloop"]

"var PATTERN_DIRECTION_WORDS = [
"    "DIRECTION",
"    "up", "down", "left", "right", "moving", "stationary", "no", "randomdir", "random", "horizontal", "vertical", "orthogonal", "perpendicular", "parallel", "action"]


"var SOUND_EVENTS = [
"    "SOUNDEVENT",
"    "cancel", "closemessage", "endgame", "endlevel", "restart", "showmessage", "startgame", "startlevel", "titlescreen", "undo", "sfx0", "sfx1", "sfx2", "sfx3", "sfx4", "sfx5", "sfx6", "sfx7", "sfx8", "sfx9", "sfx10"
"];

"var SOUND_VERBS = [
"    "SOUNDVERB",
"    "action", "cantmove", "create", "destroy", "move"
"];

"var SOUND_DIRECTIONS = [
"    "DIRECTION",
"    "up","down","left","right","horizontal","vertical","orthogonal"]

"var WINCONDITION_WORDS = [
"    "LOGICWORD",
"    "some", "on", "no", "all"]

"var LEGEND_LOGICWORDS = [
"        "LOGICWORD",
"        "and","or"
"    ]

"var PRELUDE_COLOR_PALETTE_WORDS = [
"    "amiga", "amstrad", "arnecolors", "atari", "c64", "ega", "famicom", "gameboycolour", "mastersystem", "pastel", "proteus_mellow", "proteus_night", "proteus_rich", "whitingjp"
"]



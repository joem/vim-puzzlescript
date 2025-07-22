" Vim syntax file
" Language:     PuzzleScript
" Maintainer:   Joe Miragliuolo (joem on github)
" Filenames:    *.pz
" Note:         The definitions below are taken from the PuzzleScript
"               sourcecode as of July 2025.
"               Most of the groupings come from:
"                 `src/js/codemirror/anyword-hint.js`.
"               A few groupings come from:
"                 `src/js/languageConstants.js`.
"               The colors come from:
"                 `src/css/midnight.css`.
" Last Change:  2025 Jul 22 by Joe Miragliuolo

if exists("b:current_syntax")
  finish
endif


" Still to do:
" - [ ] Highlight the object names in the OBJECTS section
" - [ ] Highlight the characters and names in the LEGEND section
" - [ ] Highlight the object names in the SOUNDS section
" - [ ] Highlight the object names in the COLLISIONLAYERS section
" - [ ] Get `[>` and `|>` highlighting working right (in the RULES section, or everywhere)
" - [ ] Highlight object names in WINCONDITIONS section
" - [ ] Highlight the levels in the LEVELS section
" - [ ] ...and fix any of the areas here marked TODO or FIXME.


" PuzzleScript is case sensitive, but we want this to only match `todo` in allcaps
syn case match
syn keyword pzTodo contained  TODO

" Back to PuzzleScript is case sensitive
syn case ignore

" region is needed instead of simpler "(.*)" so that it catches multiline
" comments, I think.
syntax region pzComment start=/(/ end=/)/ contains=pzTodo,@Spell containedin=ALLBUT,pzMsgLineAfterMessage

syn match pzBrackets /[\[\]\|]/


" sectionNames
syntax keyword pzSectionNames objects legend sounds collisionlayers rules winconditions levels

" PRELUDE_COMMAND_WORDS
" These are key and value matches
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
" These are like above (keys & values) but values are handled elsewhere
syntax keyword pzPreludeCommandWordsWithArgsButEasy background_color color_palette text_color
" These are straight keywords
syntax keyword pzPreludeCommandWords debug noaction norepeat_action norestart noundo require_player_movement run_rules_on_level_start scanline throttle_movement verbose_logging

" COLOR_WORDS
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

" RULE_COMMAND_WORDS
syntax keyword pzRuleCommandWords again cancel checkpoint restart win
" Omitted 'message' so that can be handled differently
" TODO: These pzRuleCommandWords show up bold in the rules section, but the
" ones that are also in pzSoundEvents (like `restart`) don't show up bold in
" the sounds section.

" SFX_COMMAND_LIST
syntax keyword pzSfxCommandList sfx0 sfx1 sfx2 sfx3 sfx4 sfx5 sfx6 sfx7 sfx8 sfx9 sfx10
" NOTE: Might need to handle this different in order to highlight the numbers?

" CARDINAL_DIRECTION_WORDS
syntax keyword pzCardinalDirectionWords up down left right horizontal vertical

" RULE_DIRECTION_WORDS
syntax keyword pzRuleDirectionWords random late rigid
" Removed the duplicates this shared with pzCardinalDirectionWords

" LOOP_WORDS
syntax keyword pzLoopWords startloop endloop

" PATTERN_DIRECTION_WORDS
syntax keyword pzPatternRuleDirectionWords moving stationary no randomdir orthogonal perpendicular parallel action
" Removed the duplicates this shared with pzRuleDirectionWords
" TODO: Make 'no' get highlighted differently in rules vs winconditions!

" SOUND_EVENTS
syntax keyword pzSoundEvents closemessage endgame endlevel showmessage startgame startlevel titlescreen undo
" Removed duplicates this shared with pzRuleCommandWords and pzSfxCommandList

" SOUND_VERBS
syntax keyword pzSoundVerbs cantmove create destroy move 
" Removed dupes with pzPatternRuleDirectionWords

" SOUND_DIRECTIONS
" Skipped all these since they're all dupes and use the same color.

" WINCONDITION_WORDS
syntax keyword pzWinconditionWords some on all
" Removed duplicates with pzPatternRuleDirectionWords
" TODO: Make 'no' get highlighted differently in rules vs winconditions!

" LEGEND_LOGICWORDS
syntax keyword pzLegendLogicwords and or

" PRELUDE_COLOR_PALETTE_WORDS
syntax keyword pzPreludeColorPaletteWords amiga amstrad arnecolors atari c64 ega famicom gameboycolour mastersystem pastel proteus_mellow proteus_night proteus_rich whitingjp

" TODO: Get v and ^ and > and < all working here!
" This mostly works right, but I want it to match when things immediately
" follow [ or | (with no space between) too:
syntax match pzRuleDirectionChars /\(^\|\s\|\[\||\)\zs[v><^]\ze\(\s\|$\)/

" These aren't highlighted, but we might as well match them to something.
syntax match pzSeparators /^=\+$/ containedin=ALL
" TODO: Make the ===.... matching work correctly!
" - The group of equals signs can have spaces before and/or after
" - Comments can appear after a group of equals signs, opt. separated by a space

" For in the RULES section
syntax match pzArrow "->"
" TODO: Make this work 100% correctly.
" This shouldn't appear anywhere else, except for maybe in LEVELS where it
" shouldn't be highlighted.

" For in the LEGEND section
syntax match pzEquals " = "
" TODO: Make this equals matching really work the way it does in LEGEND.
" A single equals shouldn't appear surrounded by spaces anywhere else, I
" think. Though it doesn't actually need to have spaces around it in the
" LEGEND section.

" Match and highlight the word 'message' itself
syntax match pzMsgKeyword /\<message\>/
" Match the word 'message' plus everything after it
syntax match pzMsgLineAfterMessage /\<message\>.*/ contains=pzMsgKeyword

" This works for the sound number since no other place would have numbers at
" the end of the line following a space. It's not perfect but it's good enough.
syntax match pzSoundNumber /\s\zs\d\+\ze$/
" TODO: Make this work 100% correctly.
" There might be errant highlighting if a line of someone's level were all
" numbers AND they for some reason put a space in front of their level, which
" I'm not even sure if it's valid or not.


" Check whether to apply custom colors or link to standard ones
if !exists("g:pz_disable_custom_colors") || g:pz_disable_custom_colors == 0
  " Custom colors
  " TODO: Move the colors that don't change between light or dark out to
  " here!!!!!!!!!!!!!!!!!!!!!!!!!!!
  if !exists("g:pz_light_colors") || g:pz_light_colors == 0
    " dark theme colors

    " These separatores aren't actually highlighted in the puzzlescript editor, so
    " this is just a reminder.
    " highlight pzSeparators ctermfg=White guifg=#ffffff

    highlight pzComment ctermfg=Gray guifg=#428BDD
    " Treat todo the same as comments
    highlight pzTodo ctermfg=Gray guifg=#428BDD

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

  else
    " light theme colors

    " TODO: Figure these out!

  endif
else
  " Link to standard groups for compatibility with user's colorscheme

  " TODO: Figure these out!

endif

" Force vim to sync at least x lines. This solves the multiline comment not
" being highlighted issue
syn sync minlines=100

" put at end of file
let b:current_syntax = "puzzlescript"

" TODO: Remove this line and everything after it, once you don't need these
" references anymore!

" ----------------------------------------------------------------------------
"  Colors from the OG editor:
" ----------------------------------------------------------------------------
" These come from src/css/midnight.css but I'm not 100% sure they're right.
"
" Note: Don't delete this comment section yet. I still need to get the light
" version colors!

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





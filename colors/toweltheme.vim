" toweltheme.vim
" A colorscheme inspired by the colorful towels

set background=light

hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "toweltheme"

" Define the colors based on the towel image
let s:green    = '#A8C6A3'
let s:teal     = '#87A8A0'
let s:purple   = '#B7A8C3'
let s:pink     = '#F4C2D8'
let s:beige    = '#D9C2A8'
let s:red      = '#C24D5A'
let s:yellow   = '#E8D07A'

" Highlight groups
exe 'hi Normal       guifg=' . s:red     . ' guibg=' . s:beige
exe 'hi Comment      guifg=' . s:teal    . ' gui=italic'
exe 'hi Constant     guifg=' . s:pink    . ' gui=bold'
exe 'hi Identifier   guifg=' . s:purple  . ' gui=none'
exe 'hi Statement    guifg=' . s:green   . ' gui=bold'
exe 'hi PreProc      guifg=' . s:yellow  . ' gui=underline'
exe 'hi Type         guifg=' . s:teal    . ' gui=none'
exe 'hi Special      guifg=' . s:red     . ' gui=italic'
exe 'hi Underlined   guifg=' . s:purple  . ' gui=underline'
exe 'hi Ignore       guifg=' . s:beige
exe 'hi Error        guifg=' . s:red     . ' guibg=' . s:pink
exe 'hi Todo         guifg=' . s:yellow  . ' guibg=' . s:green . ' gui=bold'

" Cursor and selection
exe 'hi Cursor       guifg=' . s:beige   . ' guibg=' . s:purple
exe 'hi Visual       guibg=' . s:pink    . ' guifg=' . s:green
exe 'hi MatchParen   guibg=' . s:teal    . ' guifg=' . s:red . ' gui=bold'

" Status line
exe 'hi StatusLine   guifg=' . s:yellow  . ' guibg=' . s:teal . ' gui=bold'
exe 'hi StatusLineNC guifg=' . s:beige   . ' guibg=' . s:pink

" Line numbers
exe 'hi LineNr       guifg=' . s:teal    . ' guibg=' . s:beige

" Towel – a light Vim colorscheme inspired by a 10‑color towel set
" Author: ChatGPT (GPT-5 Thinking)
" URL: n/a
" Licence: MIT

if exists('g:colors_name')
  highlight clear
endif
if has('nvim') || has('gui_running')
  if exists('+termguicolors')
    set termguicolors
  endif
endif
let g:colors_name = 'towel'

" ------------------------------------------------------------
" Palette (from left → right in the towel pack)
"  1. Cream       #F5F5DC
"  2. Peach       #FFDAB9
"  3. Orange      #FFA500
"  4. Lime        #ADFF2F
"  5. Mint        #98FB98
"  6. LightBlue   #ADD8E6
"  7. Lavender    #E6E6FA
"  8. Pink        #FFC0CB
"  9. Coral       #F88379
" 10. Crimson     #DC143C
"
" Neutrals chosen for legibility on a light background
let s:bg       = '#F5F5DC'   " cream
let s:fg       = '#2E2E2E'   " dark neutral text
let s:muted    = '#6E6E6E'   " for comments
let s:border   = '#BDBDAA'   " light border/line numbers

let s:peach    = '#FFDAB9'
let s:orange   = '#FFA500'
let s:lime     = '#ADFF2F'
let s:mint     = '#98FB98'
let s:blue     = '#ADD8E6'
let s:lavender = '#E6E6FA'
let s:pink     = '#FFC0CB'
let s:coral    = '#F88379'
let s:crimson  = '#DC143C'

function! s:Hi(group, fg, bg, attr)
  let l:cmd = ['hi', a:group]
  if a:fg !=# ''
    call add(l:cmd, 'guifg=' . a:fg)
  endif
  if a:bg !=# ''
    call add(l:cmd, 'guibg=' . a:bg)
  endif
  if a:attr !=# ''
    call add(l:cmd, 'gui=' . a:attr)
  else
    call add(l:cmd, 'gui=NONE')
  endif
  execute join(l:cmd, ' ')
endfunction

" Core UI
call s:Hi('Normal',       s:fg,      s:bg,      '')
call s:Hi('Cursor',       s:bg,      s:crimson, '')
call s:Hi('CursorLine',   '',        '#EFEFDA', '')
call s:Hi('CursorColumn', '',        '#EFEFDA', '')
call s:Hi('LineNr',       s:border,  s:bg,      '')
call s:Hi('CursorLineNr', s:orange,  '',        'bold')
call s:Hi('VertSplit',    s:border,  s:bg,      '')
call s:Hi('SignColumn',   '',        s:bg,      '')
call s:Hi('FoldColumn',   s:border,  s:bg,      '')
call s:Hi('Folded',       s:muted,   '#EEEED8', 'italic')
call s:Hi('Visual',       '',        '#E6F7FF', '')
call s:Hi('Search',       '#000000', s:peach,   'bold')
call s:Hi('IncSearch',    '#000000', s:orange,  'bold')
call s:Hi('MatchParen',   s:crimson, '#FFE9E9', 'bold')

" Popup menu
call s:Hi('Pmenu',        s:fg,      '#EEEED8', '')
call s:Hi('PmenuSel',     '#000000', s:lime,    'bold')
call s:Hi('PmenuSbar',    '',        '#E2E2CF', '')
call s:Hi('PmenuThumb',   '',        '#C8C8B6', '')

" Statusline / Tabline
call s:Hi('StatusLine',   '#000000', s:mint,    'bold')
call s:Hi('StatusLineNC', s:muted,   '#E8E8D4', '')
call s:Hi('TabLine',      s:muted,   '#E8E8D4', '')
call s:Hi('TabLineSel',   '#000000', s:blue,    'bold')
call s:Hi('TabLineFill',  s:border,  s:bg,      '')

" Syntax
call s:Hi('Comment',      s:muted,   '',        'italic')
call s:Hi('Constant',     s:pink,    '',        '')       " numbers, booleans
call s:Hi('String',       '#104010', '#EAF8EC', '')       " readable green string
call s:Hi('Character',    s:pink,    '',        '')
call s:Hi('Identifier',   s:coral,   '',        '')       " variables
call s:Hi('Function',     s:orange,  '',        'bold')
call s:Hi('Statement',    s:lavender,'',        'bold')   " if, for, return
call s:Hi('Conditional',  s:lavender,'',        'bold')
call s:Hi('Repeat',       s:lavender,'',        'bold')
call s:Hi('Operator',     s:crimson, '',        '')
call s:Hi('PreProc',      s:orange,  '',        '')
call s:Hi('Type',         s:blue,    '',        'bold')
call s:Hi('Special',      s:coral,   '',        '')
call s:Hi('Underlined',   s:blue,    '',        'underline')
call s:Hi('Todo',         '#000000', s:peach,   'bold')

" Diagnostics (Neovim LSP)
call s:Hi('DiagnosticError', s:crimson, '', '')
call s:Hi('DiagnosticWarn',  s:orange,  '', '')
call s:Hi('DiagnosticInfo',  s:blue,    '', '')
call s:Hi('DiagnosticHint',  s:mint,    '', '')
call s:Hi('DiagnosticOk',    s:lime,    '', '')

" Diffs / VCS
call s:Hi('DiffAdd',     '#103810',  '#EAF8EC', '')
call s:Hi('DiffChange',  '#103040',  '#EAF2F8', '')
call s:Hi('DiffDelete',  s:crimson,  '#FFECEC', '')
call s:Hi('DiffText',    '#000000',  s:blue,    'bold')

" Git signs (popular plugins)
call s:Hi('GitSignsAdd',    s:lime,   '', '')
call s:Hi('GitSignsChange', s:orange, '', '')
call s:Hi('GitSignsDelete', s:crimson,'', '')

" End

call plug#begin('~/.vim/plugged') " roughly ordered by importance

" VISUAL CHANGES
" ##############
" Very useful
Plug 'itchyny/lightline.vim' " lightline
"Plug 'sheerun/vim-polyglot' " syntax highlighting lang pack
" Less necessary
Plug 'mengelbrecht/lightline-bufferline' " add bufferline through lightline
Plug 'romainl/vim-cool' " turns off highlighting when done searching
Plug 'gko/vim-coloresque' " color codes are hilighted with the appropriate color
Plug 'Yggdroot/indentLine' " indentation line and leading spaces
Plug 'rakr/vim-one'

"Plug 'unblevable/quick-scope' " hilight 2-keystroke ftFT destinations
"Plug 'psliwka/vim-smoothie' " smooth scrolling for jump commands

" FUNCTIONALITY CHANGES
" #####################
" Quite useful for coding
Plug 'neoclide/coc.nvim', {'branch': 'release'} " intellisense / VSCode features
Plug 'KabbAmine/vCoolor.vim' " color picker
"Plug 'andymass/vim-matchup' " extends % to syntax, hl {} TODO: learn more about
Plug 'easymotion/vim-easymotion' " label-style jumps
Plug 'justinmk/vim-sneak'
Plug 'jiangmiao/auto-pairs' " autoindent and closing brace on {<CR>
Plug 'xolox/vim-session' " Session manager / automatically open buffers
Plug 'xolox/vim-misc' " Dependency for vim-session
Plug 'tpope/vim-fugitive' " git integration
Plug 'tpope/vim-surround' " matching tags text object
Plug 'tpope/vim-repeat' " . repeats plugin operations
Plug 'honza/vim-snippets' " snippets for all languages
" Seemingly less necessary... for now
Plug 'preservim/nerdtree' " file explorer
Plug 'preservim/nerdcommenter' " comment/uncomment binds
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " TODO: learn features
Plug 'junegunn/fzf.vim' " TODO: learn features
Plug 'michaeljsmith/vim-indent-object' " text object based on indentation
"Plug 'machakann/vim-highlightedyank' " briefly hilight yank
"Plug 'tibabit/vim-templates' "create templates for file extensions
"Plug 'artur-shaik/vim-javacomplete2' "autocomplete, code generation, guess imports

call plug#end()

" ################
" ### MAPPINGS ###
" ################
let mapleader = ","

" NEW FUNCTIONALITY / HIGH IMPORTANCE QOL
" #######################################

"set clipboard=unnamedplus
vnoremap r "_dP | " replace selection with yank register
nnoremap <Space> za | " toggle folds with space
nnoremap <expr> <leader><space> &foldlevel ? 'zM' :'zR' | " toggle ALL folds
tnoremap <Esc> <C-\><C-n> | " exit terminal mode with esc

" TAB MANAGEMENT
map <leader>tn :tabnew<cr>
map <leader>t<leader> :tabnext<CR>
map <leader>tm :tabmove
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>

" BUFFER MANAGEMENT
nnoremap ,, ,
nnoremap <leader>o :Files<cr>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader><Tab> :Buffers<CR>
nnoremap <silent><Leader><C-q> :bd!<Cr>
nnoremap <silent><C-q> :bn<bar>:bd!#<CR>
nnoremap <silent>,h :bp<CR>
nnoremap <silent>,. :bn<CR>
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Copy to system clipboard (aka + register)
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
" Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" MINOR TWEAKS
" ############
nnoremap / /\v | " Search with "very magic" regexs
vnoremap / /\v

nnoremap <CR> o<Esc>
nnoremap ZZ :wqall<CR>
nnoremap <silent> <C-s> :update<CR> 
vnoremap <silent> <C-s> <C-C>:update<CR>
inoremap <silent> <C-s> <C-O>:update<CR><Esc>
"nnoremap <silent> <C-p> :update<CR> 
"vnoremap <silent> <C-p> <C-C>:update<CR>
"inoremap <silent> <C-p> <C-O>:update<CR><Esc>
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
" Refresh when plugins fuck up.
noremap <F12> <Esc>:syn off <bar> syn on <bar> highlight clear SignColumn <bar> bp <bar> bn<CR>
vnoremap c <esc>v

" Don't use Ex mode, use Q for formatting.
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" PLUGIN MAPPINGS
" ###############
" 2-character Sneak (default)
nmap <Del> <Plug>Sneak_s
nmap <BS> <Plug>Sneak_S
" visual-mode
xmap <Del> <Plug>Sneak_s
xmap <BS> <Plug>Sneak_S
" operator-pending-mode
omap <Del> <Plug>Sneak_s
omap <BS> <Plug>Sneak_S

"nnoremap s s
"nnoremap S S
"xnoremap s s
"onoremap s s
"onoremap S S

" Fugitive


map <C-n> :NERDTreeToggle<CR>

" EasyMotion mappings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'arstgmneioqwfpbjluyzxcdvkh'
map <Leader> <Plug>(easymotion-prefix)
nmap <BS>  <Plug>(easymotion-f)
nmap <Del> <Plug>(easymotion-F)
vmap <BS> <Plug>(easymotion-f)
vmap <Del> <Plug>(easymotion-F)
nmap <leader>w <Plug>(easymotion-w)
nmap <leader>W <Plug>(easymotion-W)
nmap <leader>b <Plug>(easymotion-b)
nmap <leader>B <Plug>(easymotion-B)
nmap <leader>e <Plug>(easymotion-e)
nmap <leader>E <Plug>(easymotion-E)
nmap <leader>ge <Plug>(easymotion-ge)
nmap <leader>gE <Plug>(easymotion-gE)
nmap <leader>n <Plug>(easymotion-n)
nmap <leader>N <Plug>(easymotion-N)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap <leader>/ /
omap <leader>/ /
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)


" ####################
" ### VIM SETTINGS ###
" ####################

" Fold fix - must be at top
filetype plugin indent on
set foldenable
set foldmethod=indent
au FileType sh let g:sh_fold_enabled=5
au FileType sh let g:is_bash=0
au FileType sh set foldmethod=syntax
syntax enable

" check for and load file changes
autocmd WinEnter,BufWinEnter,FocusGained * checktime

" disable swapfile to avoid errors on load
"set noswapfile

" VISUAL
set number " line numbers
set cursorline " Show current line
"set relativenumber " Line numbers as an offset from cursor position
set termguicolors " 24 bit colors (Essential for color code preview)
" Enable true color 启
"if (has("termguicolors"))
  "set termguicolors
"endif
set list " show whitespace characters as defined by listchars
set listchars=tab:ŝ·,trail:~,extends:»,precedes:«,nbsp:⣿
set ruler " cursor coordinates
set wrap " no horizontal scrolling
set linebreak " break lines in viewport at allowed characters only
set breakindent " indent lines wrapped in the view
set scrolloff=4 " minimum 3 lines below and above cursor
set laststatus=2 " always show status bar (in my case lightline)
set noshowmode " disable -- INSERT -- since lightline has it
set showcmd " show selection size and last command
set display=truncate " show @@@ in the last line if it is truncated.
set ttimeout  " time out for key codes
set ttimeoutlen=100 " wait up to 100ms after Esc for special key
set history=200  " keep 200 lines of command line history
hi Pmenu guibg=#7E13CE

" FUNCTIONAL
set hidden " Allow hidden buffers
set backspace=indent,eol,start " <BS> deletes newline etc
set autowrite " Auto save changes before switching buffer
set matchpairs+=<:> " use % to jump between pairs, this adds <>
set whichwrap+=<,>,h,l,[,] " when at end/beginning of line, left/j/etc wraps

set incsearch " highlights all current search matches
set hlsearch " ?? TODO: figure out exactly how this and vim-cool interact
set ignorecase
set smartcase " Don't ignore case if you input caps

"set foldmethod=syntax
"set foldnestmax=1
"set nofoldenable
"set foldlevel=1

set mouse=a " Mouse support in all modes
set textwidth=80 " used by autoformatter
set formatoptions=qn1
set tabstop=4 " length of real tabs
set shiftwidth=4 " autoindent step size
set noexpandtab " when pressing tabs insert spaces instead
set softtabstop=4 " number of spaces that is inserted when pressing tab
set shiftround " autoindent must be rounded to shiftwidth
set pastetoggle=<F2>
set wildcharm=<C-z>
set wildmenu " tab completion
set wildmode=longest,list,full
set shortmess=a
set autoindent
set smartindent
set smarttab        " Smart tab adding and removing
set nrformats-=octal " Do not recognize octal numbers for Ctrl-A and Ctrl-X

syntax on " syntax highlighting
filetype plugin on " filetype detection

augroup CursorLine " hide cursorline on non-focused windows
    au!
    au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype markdown setlocal expandtab tabstop=4 shiftwidth=4

""" Customize colors
"func! s:my_colors_setup() abort
    "" this is an example
    "hi Pmenu guibg=#d7e5dc gui=NONE
    "hi PmenuSel guibg=#b7c7b7 gui=NONE
    "hi PmenuSbar guibg=#bcbcbc
    "hi PmenuThumb guibg=#585858
"endfunc

"augroup colorscheme_coc_setup | au!
    "au ColorScheme * call s:my_colors_setup()
"augroup END

syntax enable
set background=dark
"colorscheme one

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"if has('langmap') && exists('+langremap')
  "" Prevent that the langmap option applies to characters that result from a
  "" mapping.  If set (default), this may break plugins (but it's backward
  "" compatible).
  "set nolangremap
"endif
"
" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \ |   exe "normal! g`\""
    \ | endif

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" STUFF
set modelines=0 "security
set encoding=utf-8

" Get the defaults that most users want.
"source $VIMRUNTIME/defaults.vim


" ########################
" ### PLUGIN SETTINGS ###
" #######################

" EASY ESCAPE
let g:easyescape_chars = { "j": 1, "k": 1 }
let g:easyescape_timeout = 100
cnoremap jk <ESC>
cnoremap kj <ESC>
"let g:smoothie_base_speed = 15 " scrolling animationspeed

" VIM-SESSION: Autosave/load session
let g:session_autosave = 'yes'
let g:session_autoload = 'no'
let g:session_verbose_messages = 0
set sessionoptions-=buffers

" QUICKSCOPE: highlight good ft destinations
" Set style
  "autocmd!
  "autocmd ColorScheme * highlight QuickScopePrimary guifg='#C52C9A' gui=underline ctermfg=155 cterm=underline
  "autocmd ColorScheme * highlight QuickScopeSecondary guifg='#64938C' gui=underline ctermfg=81 cterm=underline
"augroup END
"" Disable quickscope in terminal windows
"let g:qs_buftype_blacklist = ['terminal']

" MATCHUP: expand % to keywords
"let g:matchup_matchparen_deferred = 1 " performance improvement
"let g:matchup_matchparen_hi_surround_always = 1 " always highlights surrounding {}

" LIGHTLINE: Statusbar
"set background=light
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename' ],
      \             [ 'CurrentFunction' ] ],
      \  'right': [ [ 'lineinfo' ],
      \             [ 'percent' ],
      \             [ 'statuslinetabs' ] ],
      \ },
      \ 'inactive': {
      \ 'left': [ [ 'filename' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'statuslinetabs': 'LightlineStatuslineTabs',
      \   'CurrentFunction': 'CocCurrentFunction',
      \   'cocstatus': 'coc#status',
      \ }
      \ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
function! LightlineStatuslineTabs() abort
  return join(map(range(1, tabpagenr('$')),
        \ '(v:val == tabpagenr() ? " •" : " ·") . lightline#tab#tabnum(v:val)  . (v:val == tabpagenr() ? "" : "")'), "")
endfunction

function! LightlineStatuslineTabs() abort
    return join(map(range(1, tabpagenr('$')),
            \ '(v:val == tabpagenr() ? " •" : " ·") . lightline#tab#tabnum(v:val)  . (v:val == tabpagenr() ? "" : "")'), "")
  endfunction

function! CocCurrentFunction() abort
  let cur = get(b:, 'coc_current_function', '')
  if (cur!="")
    return "›" . get(b:, 'coc_current_function', '')
  else
    return ""
  endif
endfunction
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
let g:lightline.tabline          = {'left': [['buffers']], 'right': [] }
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
set showtabline=2 " show tabline always
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#number_separator = "."
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#filename_modifier = ':t:r:s?^\.??'
let g:lightline#bufferline#more_buffers = "»"
 function! CocCurrentFunction()
   return get(b:, 'coc_current_function', '')
 endfunction

" INDENTLINE (show leading spaces)
"let g:indentLine_leadingSpaceChar = '·'
""let g:indentLine_leadingSpaceChar = '•'
"let g:indentLine_leadingSpaceEnabled = 1
"let g:indentLine_char = '·'
""let g:indentLine_char = '•'
"autocmd VimEnter * LeadingSpaceEnable
"autocmd BufRead,BufEnter,BufNewFile * LeadingSpaceEnable

"TEMPLATES
"let g:tmpl_search_paths = ['~/templates']


" ###############################
" ### COC SETTINGS AND BINDS ###
" ##############################
" Coc gets its own section because of how finicky it is to set up.


"let g:node_client_debug = 1
"let $NODE_CLIENT_LOG_FILE = '~'

" correct comment highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+

" Up and Down don't traverse coc autocomplete
inoremap <expr> <down> pumvisible() ? "\<C-e> \<Down>" : "\<Down>"
inoremap <expr> <up> pumvisible() ? "\<C-e> \<up>" : "\<up>"
 ""nnoremap <Leader>c :CocCommand<space>

set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
set statusline^=%{coc#status()}
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Formatting selected code.
xmap <leader><leader>f  <Plug>(coc-format-selected)
nmap <leader><leader>f  <Plug>(coc-format-selected)

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"inoremap <silent><expr> <Tab>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<Tab>" :
      "\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-n>" : "\<C-h>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation() abort
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

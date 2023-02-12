set encoding=utf8
set nocompatible

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'           " git integration
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-surround'
"linting Plug 'dense-analysis/ale'
Plug 'justinmk/vim-sneak'
Plug 'chrisbra/Colorizer'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/vim-peekaboo'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'xolox/vim-misc'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'prettier/vim-prettier'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'arcticicestudio/nord-vim'
Plug 'haishanh/night-owl.vim'
Plug 'phanviet/vim-monokai-pro'
Plug 'exitface/synthwave.vim'
Plug 'michalbachowski/vim-wombat256mod'
Plug 'jdkanani/vim-material-theme'
Plug 'joshdick/onedark.vim'
Plug 'liuchengxu/space-vim-dark'
Plug 'rafalbromirski/vim-aurora'
Plug 'ryanoasis/vim-devicons'
Plug 'luochen1990/rainbow'
call plug#end()

" # General
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable filetype plugins
filetype plugin on
filetype indent on

"Set auto read when a file is changed from the outside
set autoread
" Trigger `autoread` when files changes on disk
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
" Notification after file change
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"Copy to system clipboard
set clipboard=unnamed

" Set leader key 
"nnoremap <SPACE> <Nop>
let mapleader = "\<Space>"

" :W sudo saves the file
command W w !sudo tee % > /dev/null

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Save folds
augroup remember_folds
  autocmd!
  au BufWinLeave ?* mkview 1
  au BufWinEnter ?* silent loadview 1
augroup END

" vim-notes
let g:notes_directories = ['~/Documents/Notes']

" Markdown 
set foldmethod=manual
set foldcolumn=2

let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_override_foldtext = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_auto_insert_bullets = 1

" fenced code block
let g:markdown_fenced_languages = ['html', 'css', 'php', 'javascript', 'js', 'python', 'bash', 'bash=sh', 'vim', 'git']

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
augroup END


" open markdown preview in chrome
autocmd BufEnter *.md exe 'noremap <silent> <leader>gc :!open % -a Google\ Chrome <cr>'

" tab expands/contracts folds in markdown mode
autocmd BufEnter *.md exe 'nnoremap <tab> za'

" spell check
set spellfile=~/.vim/spell/en.utf-8.add

" lazy drawing
" set lazyredraw
set ttyfast

" change cursors depending on mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" highlight line when in insert mode
autocmd InsertEnter,InsertLeave * set cul!

" # Color schemes
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax and plugins
syntax enable

" Set colorscheme
" Color schemes I like: nord, space-vim-dark, one, night-owl, palenight
set background=dark
set termguicolors
"let g:palenight_terminal_italics=1

"colorscheme nord
"colorscheme monokai_pro
colorscheme night-owl
"colorscheme material-theme
"colorscheme space-vim-dark
"colorscheme aurora

" Set comment color
" purpley:
"hi Comment guifg=#8b7da2 ctermfg=8
hi Comment guifg=#6C718B ctermfg=8
hi Folded guifg=#b6aae4 ctermfg=8

" Make background transparent
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE guifg=#6c718B
hi SignColumn ctermbg=NONE guibg=NONE
hi FoldColumn ctermbg=NONE guibg=NONE

"let g:nord_italic = 1
"let g:nord_bold = 1

" # Interface
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor when moving vertically using j/k
set so=7

" scrolling up and down
nnoremap <C-j> 10jzz
nnoremap <C-k> 10kzz

" Display all matching files when we tab complete
set wildmenu

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Search settings
set smartcase " smart cases when search
set hlsearch " highlight search results
set incsearch " incremental searching
set ignorecase " ignore case when searching

" For regular expressions turn magic on
set magic

set showmatch " shows matching brackets
set mat=2

" Disable sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit of margin to left
set foldcolumn=2

" # Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" # Text, tab, and indent stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" Disable auto-wrap
set nowrap
set textwidth=0 
set wrapmargin=0

" Set word wrap in markdown files
au BufRead,BufNewFile *.md set wrap linebreak nolist
au BufRead,BufNewFile *.md setlocal textwidth=80

set ai " Auto indent
set si " Smart indent

" Line numbers
set number
highlight LineNr ctermfg=24

" # Visual mode stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection

" Operating on a complete search match
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function s:VSetSearch()
 let temp = @s
 norm! gv"sy
 let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
 let @s = temp
endfunction

" # Moving around, tabs, windows, and buffers 
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" toggle folds in markdown files (vim-fold-toggle plugin)
nnoremap <leader>ft :FoldToggle<CR>

" Split vertically to bottom
set splitbelow

" cycle between buffers
nnoremap <M-`> <C-`>

" # Status line 
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" # Key bindings 
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Make `jj` and `jk` throw you into normal mode
inoremap jj <esc>
inoremap jk <esc>

" Remap HJKL to something more useful
"nnoremap H ^
"nnoremap L $
nnoremap J <C-d>
nnoremap K <C-u>

" <leader>d to delete and without copying
nnoremap <leader>d "_d
xnoremap <leader>d "_d
xnoremap <leader>p "_dP

" Find & replace helpers

" /foo<CR>, press CMD+d, fill and hit return
nnoremap <C-g> :%s///g<Left><Left>

" and here for those who have 'gdefault' enabled
nnoremap gs :%s//<Left>

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Moves the matches for your search to the center of the screen when you press n or N 
nnoremap n nzz
nnoremap N Nzz

" Type ,w to save, ,q to exit
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Type ,wq  to save and exit
nmap <leader>wq :wq!<cr>

set conceallevel=0 

" # Misc 
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Briefly highlight the part of the buffer that was yanked.
function! s:hl_yank() abort
    let [sl, el, sc, ec] = [line("'["), line("']"), col("'["), col("']")]
    if sl == el
        let pos_list = [[sl, sc, ec - sc + 1]]
    else
        let pos_list = [[sl, sc, col([sl, "$"]) - sc]] + range(sl + 1, el - 1) + [[el, 1, ec]]
    endif

    for chunk in range(0, len(pos_list), 8)
        call matchaddpos('IncSearch', pos_list[chunk:chunk + 7])
    endfor
    redraw!
    call timer_start(500, {t_id -> clearmatches()})
endfunction

augroup HlYank
    autocmd!
    autocmd TextYankPost * if v:event.operator ==# 'y' | call s:hl_yank() | endif
augroup END

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Fix esc lag
set timeoutlen=1000 ttimeoutlen=0

" # Functions 
"""""""""""""""""""""""""""""""""""""""""""""""""""

" # Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Rainbow levels
hi! link RainbowLevel0 Constant
hi! link RainbowLevel1 Type
hi! link RainbowLevel2 Function
hi! link RainbowLevel3 String
hi! link RainbowLevel4 PreProc
hi! link RainbowLevel5 Statement
hi! link RainbowLevel6 Identifier
hi! link RainbowLevel7 Normal
hi! link RainbowLevel8 Comment

" vim-sneak
let g:sneak#label = 1

" Bracket highlighting
let g:rainbow_active = 1

" Search down into subfolders, provides tab-completion
set path+=**

" Emmet
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" Git gutter
set updatetime=100
"
" Fuzzy Find :FZF
nmap <leader>f :FZF<cr>
nmap <leader>fg :GFiles<cr>

nmap <leader>p :CtrlP<cr>

nnoremap <C-p> :CtrlP<Cr>

" NERDTree
nmap <leader>ne :NERDTreeToggle<cr>

nmap <leader>of :NERDTreeFromBookmark

" alternate shortcut
map <silent> <C-\> :NERDTreeToggle<CR>

" open NT automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left is NT
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let NERDTreeMinimalUI = 1
let NERDTreeShowBookmarks = 0
"let NERDTreeDirArrows = 0

hi Directory guifg=#838CBF ctermfg=6d
hi NERDTreeClosable guifg=#89DDFF ctermfg=175
hi NERDTreeOpenable guifg=#89DDFF ctermfg=108

" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'cyan', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('less', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" NERDTree git plugin
let  g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Airline
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

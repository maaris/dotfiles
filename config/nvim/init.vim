
set nocompatible
filetype off

call plug#begin('~/.local/share/nvim/plugged')

Plug 'tpope/vim-rails'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim' 

Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'garbas/vim-snipmate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'shougo/neocomplcache'
Plug 'tomtom/tcomment_vim'
Plug 'ecomba/vim-ruby-refactoring'
Plug 'tpope/vim-bundler'
Plug 'Keithbsmiley/rspec.vim'
Plug 'Townk/vim-autoclose'
Plug 'asux/vim-capybara'
Plug 'scrooloose/syntastic'
Plug 'ngmy/vim-rubocop'
Plug 'Lokaltog/vim-easymotion'
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-vspec'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'takac/vim-hardtime'
Plug 'tmhedberg/matchit'
Plug 'jgdavey/vim-blockle'
Plug 'xolox/vim-misc'
Plug 'groenewege/vim-less'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'slim-template/vim-slim'
Plug 'whatyouhide/vim-gotham'
Plug 'davb5/wombat256dave'
Plug 'vim-airline/vim-airline'
Plug 'mxw/vim-jsx'
Plug 'Shougo/neocomplete'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
Plug 'janko-m/vim-test'
" React code snippets
Plug 'epilande/vim-react-snippets'
Plug 'xolox/vim-colorscheme-switcher'
Plug 'flazz/vim-colorschemes'

cal plug#end()


let g:FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null" 

if executable('ag')
  let g:FZF_DEFAULT_COMMAND = 'ag --ignore={build,.git,.project,*.o,*.d,hw_1_5/*} %s -l --hidden -g ""'
endif

set runtimepath^=~/.config/nvim/bundle/ctrlp.vim

nnoremap <silent> <C-f> :FZF -m<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>h :History<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>


filetype plugin indent on

let mapleader=","

let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" rubocop
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>

nmap <leader>rc :call Rubocop()<CR>

function! Rubocop()
  exe "w"
  silent exe "!rubocop -a -R % &> /dev/null"
  silent exe "e %"
  SyntasticCheck()
endfun

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

runtime macros/matchit.vim

set cursorline

" syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_highlighting=0
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_check_on_open = 0
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 0
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': [],
                           \ 'passive_filetypes': ['html', 'c', 'scss'] }

" bindings fir managing vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <F3> :%s/:\([^ ]*\)\(\s*\)=>/\1:/g<CR>

" binding.pry
map <Leader>bp orequire'pry';binding.pry<esc>:w<cr>

" Disabling arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

nnoremap ; :

set backspace=2
set nobackup
set nowritebackup
set noswapfile
set history=50
set ruler
set showcmd
set laststatus=2
set autowrite

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·
set textwidth=80
set colorcolumn=80
set numberwidth=5
set relativenumber
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab
set nowrap " dont wrap lines
set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set visualbell
set noerrorbells
set pastetoggle=<F2>
set tags=./tags;
set grepprg=ag
set hidden
set guifont=Monaco:h12
set autochdir

filetype plugin indent on

colorscheme brogrammer

" Neo complete cache configuration
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" hides buffers instead of closing them

let g:loaded_python3_provider=1
let g:python_host_prog = '/usr/bin/python'

" Exiting insert mode
:imap jj <Esc>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Saving files on focus lost
:au FocusLost * silent! wa

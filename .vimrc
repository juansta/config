" Allow loading local .vimrc files
set exrc
set secure

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t.git'
Plugin 'scrooloose/syntastic'
Plugin 'lervag/vimtex'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'kana/vim-operator-user'
Plugin 'nanotech/jellybeans.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rhysd/vim-clang-format'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" options for youcompleteme
let g:ycm_confirm_extra_conf = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set so=7     " Set 7 lines to the cursor - when moving vertically using j/k
set wildmenu " Turn on the WiLd menu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
	set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
	set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler       " Always show current position
set cmdheight=2 " Height of the command bar
set hid         " A buffer becomes hidden when it is abandoned

set backspace=eol,start,indent      " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set ignorecase   " Ignore case when searching
set smartcase    " When searching try to be smart about cases
set hlsearch     " Highlight search results
set incsearch    " Makes search act like search in modern browsers
set lazyredraw   " Don't redraw while executing macros (good performance config)
set magic        " For regular expressions turn magic on
set showmatch    " Show matching brackets when text indicator is over them
set mat=2        " How many tenths of a second to blink when matching brackets
set noerrorbells " No annoying sound on errors
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1 " Add a bit extra margin to the left

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable                     " Enable syntax highlighting
set background=dark
set encoding=utf8                 " Set utf8 as standard encoding
set ffs=unix,dos,mac              " Use Unix as the standard file type
let g:airline_powerline_fonts = 1 " Enable powerline-fonts

try
    colorscheme jellybeans
catch
endtry

" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=T
	set guioptions-=e
	set t_Co=256
	set guitablabel=%M\ %t
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup
set nowb
set noswapfile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab         " Use spaces instead of tabs
set smarttab          " Be smart when using tabs ;)
set shiftwidth=4      " 1 tab == 4 spaces
set tabstop=4
set lbr               " Linebreak on 500 characters
set tw=500
set ai                " Auto indent
set si                " Smart indent
set wrap              " Wrap lines
set foldmethod=syntax " add folds based on syntax
set foldnestmax=1     " only nest folds to a single level

let g:vim_markdown_folding_disabled = 1
let g:airline#extensions#tabline#enabled = 1        " Airline Configuration

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Code Formatting and Completion Tools
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:clang_format#detect_style_file = 1
let g:ycm_confirm_extra_conf = 0

" go to first position if in a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

" map ',cf' to ':ClangFormat' only on cpp files
autocmd FileType h,c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType h,c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

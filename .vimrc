set nocompatible " disable vi compatibility (emulation of old bugs)
set exrc
set secure

" ---------------------------------------------------------------------------- "
" Plugin Management                                                            "
" ---------------------------------------------------------------------------- "

call plug#begin()
Plug 'morhetz/gruvbox', { 'as': 'gruvbox' }
Plug 'vim-scripts/a.vim'        " Switch between header and src
Plug 'othree/xml.vim'	          " Better xml support			
Plug 'yegappan/mru'             " Show recent files
Plug 'scrooloose/nerdtree'      " File tree
Plug 'vim-syntastic/syntastic'  " Shows detailed errors
Plug 'vim-airline/vim-airline'  " Status bar/tabline
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'SirVer/ultisnips'         " Snippets
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround' " Better support for parentheses, brackets, etc.. 
Plug 'junegunn/goyo.vim' " Distraction free
Plug 'vim-scripts/doxygentoolkit.vim',      { 'for': 'cpp' }  " Automatic comments
Plug 'kgreenek/vim-ros-ycm'
Plug 'Valloric/YouCompleteMe', { 'commit':'d98f896' }
Plug 'preservim/nerdcommenter' " toggle comments
call plug#end()

filetype plugin indent on

" ---------------------------------------------------------------------------- "
" Main configurations                                                          "
" ---------------------------------------------------------------------------- "

" set UTF-8 encoding
set encoding=utf-8            
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoread                    " Auto reload file after external command
set backspace=indent,eol,start  " Delete over line breaks
set binary                      " Enable binary support
set colorcolumn=80             " Show ruler columns
set hidden                      " Hide buffers instead of closing them
set laststatus=2                " Always display the status line
set nofoldenable                " Disable folding
set lazyredraw                  " Use lazy redrawing
set noshowmode                  " Don't show mode
set number        " Show line numbers
set pastetoggle=<F2>            " Toggle paste mode with F2
set ruler                       " Show ruler
set showcmd                     " Show current command
set showmatch                   " Show matching bracket/parenthesis/etc
set showmode                    " Show current mode
set title                       " Change terminal title
set ttyfast                     " Fast terminal
set wildmenu                    " Visual autocomplete for command menu
set clipboard^=unnamed,unnamedplus " Use system clipboard
set backspace=indent,eol,start  " Proper backspace behavior.
set path+=**                    " Search down into subfolders
set cursorline                  " Line where the cursor is

" Indentation
set smarttab                    " Better tabs
set smartindent                 " Insert new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
"set cindent                     " Turn on automatic C-code indentation
set expandtab                   " Always use spaces instead of tabs

" Mouse
"set mousehide                   " Hide mouse when typing
set mouse:a                     " Add mouse capability
if has("mouse_sgr")             " tmux stuff
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

" Splits
set splitbelow                  " Horizontal split below
set splitright                  " Vertical split right

" Search
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ...unless search contains uppercase letter

" Spell checking
set spelllang=en_us             " English as default language
set spell                       " Enable by default

" Make completion menu behave like an IDE
set completeopt=longest,menuone,preview

" Disable modelines as a security precaution
set modelines=0
set nomodeline

"read .launch files like xml
au BufNewFile,BufRead *.launch set filetype=xml
au BufNewFile,BufRead,BufReadPost *.launch set syntax=xml

set comments=sl:/*,mb:\ *,elx:\ */ " intelligent comments

"color scheme available:[gruvbox, vim-monokai-tasty]
colorscheme gruvbox
set background=dark
set t_Co=256
let g:gruvbox_contrast_dark='default'

" Tweaks for browsing with netrw
" let g:netrw_banner=0        " disable annoying banner
" let g:netrw_browse_split=4  " open in prior window
" let g:netrw_altv=1          " open splits to the right
" let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" ---------------------------------------------------------------------------- "
" Key mapping stuff                                                            "
" ---------------------------------------------------------------------------- "

"let g:mapleader = "\<Space>"
let g:mapleader = "\,"

" NERDTree
nnoremap <silent> <leader>ft :NERDTreeToggle<CR>

" Windows
nnoremap <silent> <leader>wv :vsplit<CR>
nnoremap <silent> <leader>ws :split<CR>
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wd :close<CR>

" Files
nnoremap <silent> <leader>fs :update<CR>
nnoremap <silent> <leader>fd :e $MYVIMRC<CR>
nnoremap <silent> <leader>fr :MRU<CR>

" Buffers
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>

" Windows
nnoremap <leader>wd <C-w>c
nnoremap <leader>wo <C-w>o

" YCM
nnoremap <silent> <leader>fm :YcmCompleter Format<CR>
nnoremap <silent> <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <silent> <leader>fix :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>def :YcmCompleter <CR>

" ---------------------------------------------------------------------------- "
" Plugin Configuration                                                         "
" ---------------------------------------------------------------------------- "

"define python version: python for version 2 or python3 for version 3
let g:pymode_python = 'python3'

imap <C-A> <esc>a<Plug>snipMateNextOrTrigger
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="-------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="-------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Joao Cruz"
let g:DoxygenToolkit_licenseTag="My own license"  

" NERDTree
let NERDTreeMinimalUI  = 1
let NERDTreeShowHidden = 0
let g:NERDTreeWinSize  = 36

" YCM
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" UltiSnips
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

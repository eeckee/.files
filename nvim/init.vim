" vim: fdm=marker tw=0
" NeoVim
" This script contains all my plugins and settings
" The different settings for all plugins are located in ./after/plugin/
" Mappings are located in ./after/plugin/mappings/
"
" Unicode characters: https://www.w3schools.com/charsets/ref_utf_dingbats.asp

" Variables and Paths {{{
let g:HOSTNAME = substitute(system('hostname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:HOME = substitute(system('echo $HOME'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:UNAME = substitute(system('uname'), '\n', '', '') " What the hostname of the computer is /desktop/laptop
let g:BROWSER = "brave-browser"

let mapleader = ','
let localleader = '\'
let g:tex_flavor = "latex"     " assuem *.tex are all latex files

" RunTimePath. Add fzf
set rtp+=~/.fzf

" Set Python/Npm paths {{{
if has("unix")  "Python & Node
	" This is probably not necessary and $HOME or similar might work.
    let g:loaded_python_provider = 0
		let g:python3_host_prog=g:HOME . '/miniconda3/envs/neovim3/bin/python'
		let g:python_host_prog=g:HOME . '/miniconda3/envs/neovim2/bin/python'
		" let g:node_host_prog=g:HOME . '/.nvm/versions/node/v13.1.0/bin/neovim-node-host'
endif "}}}
" }}}

" Install Vim-Plug (if not installed) {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  echo "No Vim-Plug available... Downloading and running PlugInstall"
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
              \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif "}}}

" Plugins {{{
call plug#begin('~/.vim/bundle')

" ================ Not used anymore ================
" Plug 'sjl/gundo.vim'                   " Visualize undo tree
" Plug 'tpope/vim-obsession'             " :mksession | saves a vim instance | used when saving tmux session
" Plug 'machakann/vim-highlightedyank'   " Highlight yanks[DEPRECATED] Built-in now
"
" Not that useful
" Plug 'romainl/vim-cool'                " unhighlights searches when it is not needed anymor
" Plug 'romainl/vim-qf'
" Plug 'junegunn/goyo.vim'               " Distraction free writing
" Plug 'junegunn/vim-after-object'       " change everything after something
" Plug 'dhruvasagar/vim-zoom'
"
" Plug 'mxw/vim-jsx'
" Plug 'lepture/vim-jinja'

" ================ Interesting? ================
" Folding for python
" https://github.com/tmhedberg/SimpylFold
" Plug 'tmhedberg/SimpylFold'
" https://github.com/Konfekt/FastFold
" Plug 'Konfekt/FastFold'


" testing
Plug 'haorenW1025/floatLf-nvim'

Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
" ES2015 code snippets (Optional)
Plug 'epilande/vim-es2015-snippets'
" React code snippets
Plug 'epilande/vim-react-snippets'

Plug 'jiangmiao/auto-pairs'


" completion / LSP
Plug 'neovim/nvim-lsp'
Plug 'haorenW1025/completion-nvim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/neco-vim'
Plug 'SirVer/ultisnips'                " XXX snippet engine
Plug 'honza/vim-snippets'              " XXX snippets


" Filemanager
Plug 'kyazdani42/nvim-tree.lua'
" Plug 'scrooloose/nerdtree'             " XXX Project and file navigation
Plug 'Xuyuanp/nerdtree-git-plugin'     " XXX show git status of files
Plug 'ivalkeen/nerdtree-execute'       " XXX open files from nerdtree
Plug 'tpope/vim-fugitive'              " XXX git tools

" Tools
" Plug 'terryma/vim-multiple-cursors'    " XXX Really great but could try with coc
Plug 'vimwiki/vimwiki'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'KabbAmine/vCoolor.vim'           " XXX pick color from menu
Plug 'Yggdroot/indentLine'             " XXX see where there is indent
Plug 'tpope/vim-commentary'            " XXX commenting
Plug 'tpope/vim-repeat'                " XXX repeat commands not repeatable by 'vanilla' vim
Plug 'tpope/vim-surround'              " XXX Surround objects with quotes, brackets ...
Plug 'wellle/targets.vim'              " XXX ci' works on (, [, {, < on entire line
Plug 'easymotion/vim-easymotion'       " XXX visualize targets tot move to specific words
Plug 'godlygeek/tabular'

Plug 'junegunn/fzf.vim'                " XXX fuzzy filefinding
Plug 'alok/notational-fzf-vim'
Plug 'chengzeyi/fzf-preview.vim'

Plug 'junegunn/vim-easy-align'         " XXX better alignment than tabular
Plug 'junegunn/vim-peekaboo'           " XXX when pressing quotes shows what's stored in the different registers
Plug 'nelstrom/vim-visual-star-search' " * on visual select searches for the snippet
Plug 'lotabout/slimux'                 " XXX

Plug 'christoomey/vim-tmux-navigator'  " XXX navigate between vim and tmuz seemlessly
Plug 'tmux-plugins/vim-tmux-focus-events' " Focus events correctly triggered. Leaving/Returning to vim inside tmux
let g:tmux_navigator_no_mappings = 1

" Code Formatting / Syntax / Preview
Plug 'norcalli/nvim-colorizer.lua'  " faster color disable coc-highlight
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}  " better python syntax highlight
" Plug 'ambv/black'                         " Linter/formatter
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'       " XXX latex compiler, preview latex pdf, highlight and syntax. alot more.
Plug 'mhinz/neovim-remote' " Needed for vimtex. Error: 'compiler_progranme=nvr' / '--remote'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Statusline
Plug 'airblade/vim-gitgutter'          " XXX see git changes in file in the numberline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'arzg/vim-substrata'
Plug 'benburrill/potato-colors'
Plug 'crusoexia/vim-monokai'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'dracula/vim'
Plug 'tomasr/molokai'
Plug 'arcticicestudio/nord-vim'
Plug 'kaicataldo/material.vim'
Plug 'sheerun/vim-wombat-scheme'
Plug 'w0ng/vim-hybrid'


call plug#end()

" Nvim-lsp
" lua << EOF
" require'nvim_lsp'.bashls.setup{}
" require'nvim_lsp'.vimls.setup{}
" require'nvim_lsp'.pyls_ms.setup{
"   filetypes = { "python" };
"   settings = {
"     python = {
"       condaPath = { "miniconda3/bin/conda" };
"       venvPath = { "miniconda3/envs" };
"       analysis = {
"         disabled = {};
"         errors = {};
"         information = { "unresolved-import" };
"       },
"     };
"   };
"   init_options = {
"     analysisUpdates = true;
"     asyncStartup = true;
"     interpreter = {
"       properties = {
"       InterpreterPath = "/home/erik/miniconda3/envs/neovim3/bin/python",
"       Version = "3.8",
"       };
"     };
"     displayOptions = {};
"   };
" }
" EOF

" " require'nvim_lsp'.vimls.setup{on_attach=require'completion'.on_attach}
" " require'nvim_lsp'.pyls_ms.setup{on_attach=require'completion'.on_attach}

" " greg hurell
" sign define LspDiagnosticsErrorSign text=✖
" sign define LspDiagnosticsWarningSign text=⚠
" sign define LspDiagnosticsInforgmationSign text=ℹ
" sign define LspDiagnosticsHintSign text=➤

" function! s:SetUpLspHighlights()
"   execute 'highlight LspDiagnosticsError guifg=#e43a21'
"   execute 'highlight LspDiagnosticsWarning guifg=#db8d23'
"   execute 'highlight LspDiagnosticsInformation guifg=#d4d51b'
"   execute 'highlight LspDiagnosticsHint gui=bold,italic,underline guifg=#22d85e'
" endfunction

" augroup ErikLanguageClientAutocmds
"   autocmd!
"   " autocmd WinEnter * call s:Bind()
"   " autocmd FileType javascript,typescript,vim  call s:ConfigureBuffer()
"   autocmd ColorScheme * call s:SetUpLspHighlights()
" augroup END

" nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
" nnoremap <silent> gh <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
" " nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
" nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
" nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
" nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>

" " Completion
" " Use completion-nvim in every buffer
" set completeopt=menuone,noinsert,noselect

" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'
" let g:completion_enable_auto_paren = 1
" " Set completeopt to have a better completion experience
" let g:completion_customize_lsp_label = {
"       \ 'Function': "\uf794",
"       \ 'Method': "\uf6a6",
"       \ 'Variable': "\uf71b",
"       \ 'Constant': "\uf8ff",
"       \ 'Struct': "\ufb44",
"       \ 'Class': "\uf0e8",
"       \ 'Interface': "\ufa52",
"       \ 'Text': "\ue612",
"       \ 'Enum': "\uf435",
"       \ 'EnumMember': "\uf02b",
"       \ 'Module': "\uf668",
"       \ 'Color': "\ue22b",
"       \ 'Property': "\ufab6",
"       \ 'Field': "\uf93d",
"       \ 'Unit': "\uf475",
"       \ 'File': "\uf471",
"       \ 'Value': "\uf8a3",
"       \ 'Event': "\ufacd",
"       \ 'Folder': "\uf115",
"       \ 'Keyword': "\uf893",
"       \ 'Operator': "\uf915",
"       \ 'Reference': "\uf87a",
"       \ 'Snippet': "\uf64d",
"       \ 'TypeParameter': "\uf278",
"       \ 'Default': "\uf29c"
"       \}


" nvim-tree.lua
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default, not working on mac atm
let g:lua_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
" let g:lua_tree_follow = 1 "0 by default, this option will bind BufEnter to the LuaTreeFindFile command
" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':        'o',
    \ 'edit_vsplit': '<C-v>',
    \ 'edit_split':  '<C-x>',
    \ 'edit_tab':    '<C-t>',
    \ 'cd':          '.',
    \ 'create':      'a',
    \ 'remove':      'd',
    \ 'rename':      'r'
    \ }

nnoremap <leader>ne :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help lua_tree_highlight`
highlight LuaTreeFolderName guibg=cyan gui=bold,underline
highlight LuaTreeFolderIcon guibg=blue
" filetypes = { "python" }
" init_options = {
"   analysisUpdates = true,
"   asyncStartup = true,
"   displayOptions = {},
"   interpreter = {
"     properties = {
"       InterpreterPath = "/usr/bin/python",
"       Version = "2.7"
"     }
"   }
" }
" on_new_config = <function 1>
" root_dir = vim's starting directory
" settings = {
"   python = {
"     analysis = {
"       disabled = {},
"       errors = {},
"       info = {}
"     }
"   }
" }

" }}}

" Basic Settings {{{

set termguicolors " Enable true color support.
filetype plugin indent on
syntax enable
syntax on
set hls                        " highlighting!
set background=dark

" Colorschemes -----------------------------------
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'darker'
" colorscheme material
" colorscheme molokai
" colorscheme monokai
colorscheme onedark
" colorscheme gruvbox
" colorscheme Tomorrow-Night 
" colorscheme hybrid
" colorscheme wombat
" colorscheme substrata
" colorscheme nord
" colorscheme OceanicNext

hi Folded guibg=clear
hi FoldColumn guibg=clear
hi MatchParen guifg=#ff008b

" hi Search guibg=None guifg=#d400aa gui=underline,bold
hi Search gui=underline,bold
hi IncSearch guibg=#cbcbcb guifg=#d400aa gui=underline,bold

let g:background_color = synIDattr(hlID("Normal"), "bg")
let g:custom_focus=1  " enables custom focus in ./plugin/focus_background.vim

" COLORIZER TEST
lua require'colorizer'.setup()

" Settings
set spelllang=sv,en_us                " US English spelling
set ffs=unix,dos,mac                  " File Format (relevant to line ending type)
set backspace=indent,eol,start        " Make backspace work like most other apps.
set history=1000                      " Keep 1000 lines of command-line history.
set undolevels=1000                   " Keep 1000 lines of undo history.
set showcmd                           " Display incomplete commands.
set noshowmode                        " stops vims own showing below the statusbar.
set hidden                            " Allow unsaved background buffers.
set shortmess=I                       " Don't show Vim's welcome message.
set shortmess+=a                      " Make the save message shorter. Helps avoid the 'Hit ENTER to continue' message.
set shortmess+=c                      " see :help deoplete -> Configuration FAQ (ins-completion-menu)
set modeline                          " example at top of script:  " vim: ft=vim
set foldmethod=indent
set foldlevelstart=0                 " start with fold everything
set foldclose=                        " all
set foldtext=erik#settings#foldtext() " see nvim/autoload/erik/settings.vim
set conceallevel=0
set autoindent                        " enable auto-indentation
set bs=indent,eol,start               " allow backspacing over everything
set tabstop=4                         " no. of spaces for tab in file
set shiftwidth=4                      " no. of spaces for step in autoindent
set softtabstop=4                     " no. of spaces for tab when editing
set expandtab                         " expand tabs into spaces
set smarttab                          " smart tabulation and backspace
set nonumber                            " number lines

" Trying out without relative for speed and I dont use it
" set relativenumber
set scrolloff=3                       " visual rows above and below cursor
set sidescrolloff=3                  " visual columns on sides of cursor
set cursorline                        " highlight line where cursor is
set lazyredraw                 " don't redraw screen during macros
set formatoptions+=j           " smart line joining. uncomments comments.
set formatoptions+=n           " smart autoindenting inside numbered lists
" set nowrap
set wrapmargin=5
let &showbreak="↪"
set breakindent                " wrapped line s keep indentation (set bri)
set cpo+=n
set breakindentopt+=shift:2    " how far in the showbreak: " ↪ " is
set breakindentopt+=min:20
set list
set listchars=tab:\ \ ,trail:·,extends:▶,nbsp:·
" set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:·
" set listchars=tab:\|\ ,trail:·,extends:▶,nbsp:·,conceal:\#
" set listchars=tab:▶\ ,trail:·,extends:\#,nbsp:.
set numberwidth=3              " width of numberline
set mouse=a                    " mouse functionality
" set mousemodel=popup
set timeoutlen=400               " ms to wait for command completion
set ttimeoutlen=0              " don't wait for <esc>
set incsearch                  " search starts when typing instead of waiting for <enter>
set virtualedit=block          " onemore 'block' makes it possible to edit empty space in visualblock
set ignorecase                 " (in)case sensitive search
set smartcase
set switchbuf=usetab
set splitbelow
set splitright
set signcolumn=yes
set gdefault                   " with this:  s/foo/bar --> s/foo/bar/g by default. ´g´ reverses its meaning.
set inccommand=nosplit
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize,resize

if has('windows')
  " ┃ line with no breaks between vertical splits
  set fillchars=vert:\│
endif

" Transparancy

" PMenu
set pb=20
" hi PmenuSel gui='bold'

" Floating windows
" set winblend=20


if exists("g:gui_oni")
	source ~/.config/nvim/oni/mappings/oni.vim
	set laststatus=0 "always show status bar
else
	set laststatus=2 "always show status bar
endif

" Wildmenu completion {{{
set wildoptions=pum
set wildmenu
set wildmode=full
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files
set wildignore+=*.fasl                           " Lisp FASLs

" }}}
" Large Files {{{

" file is large from 5mb
let g:LargeFile = 1024 * 1024 * 5
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 " setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" }}}
" Backups {{{

" Backup
if exists('$SUDO_USER')
  set nobackup                        " enable backups
  set nowritebackup                        " enable backups
else
  set backupdir=~/.vim/tmp/backup/ " backups
  " Create folder if it does note exists
  if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
  endif
endif

" Swapfile
if exists('$SUDO_USER')
  set noswapfile  enable backups
else
  set directory=~/.vim/tmp/swap//   " swap files
endif

" Undo
if exists('$SUDO_USER')
  set noundofile  " don't create root-owned files
else
  set undodir=~/.vim/tmp/undo//
  set undofile  "use undo files
endif

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
	call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&directory))
	call mkdir(expand(&directory), "p")
endif
" }}}
"}}}


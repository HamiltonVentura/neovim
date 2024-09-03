" ========================
" Plugins Configuration
" ========================
call plug#begin()
  Plug 'sainnhe/sonokai'                               " Sonokai color scheme
  Plug 'vim-airline/vim-airline'                       " Vim-airline status/tab line
  Plug 'vim-airline/vim-airline-themes'                " Themes for vim-airline
  Plug 'ryanoasis/vim-devicons'                        " Filetype icons
  Plug 'dense-analysis/ale'                            " Asynchronous Linting Engine
  Plug 'sheerun/vim-polyglot'                          " Language packs
  Plug 'preservim/nerdtree'                            " File system explorer
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'       " Syntax highlighting for NERDTree
  Plug 'Xuyuanp/nerdtree-git-plugin'                   " Git integration for NERDTree
  Plug 'neoclide/coc.nvim', { 'branch' : 'release' }   " Conquer of Completion (auto-completion)
  Plug 'honza/vim-snippets'                            " Snippet collection for various languages
  Plug 'jiangmiao/auto-pairs'                          " Auto close brackets, quotes, etc.
  Plug 'nvim-lua/popup.nvim'                           " Popup API implementation for Neovim
  Plug 'nvim-lua/lsp-status'                           " Status updates for LSP
  Plug 'nvim-lua/lsp_extensions.nvim'                  " LSP extensions like inlay hints
  Plug 'glepnir/lspsaga.nvim'                          " LSP UI enhancements
  Plug 'onsails/lspkind-nvim'                          " Pictograms for LSP completion items
  Plug 'ray-x/lsp_signature.nvim'                      " Show function signature while typing
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " Fuzzy finder for files, buffers, etc.
  Plug 'junegunn/fzf.vim'                              " FZF integration with Vim
  Plug 'aklt/plantuml-syntax'                          " PlantUML syntax highlighting
  Plug 'weirongxu/plantuml-previewer.vim'              " Preview PlantUML diagrams in Vim
  Plug 'tyru/open-browser.vim'                         " Open URLs in the browser
call plug#end()

" ========================
" General Settings
" ========================
syntax on            " Enable syntax highlighting
set nu               " Show line numbers
set relativenumber   " Show relative line numbers
set tabstop=4        " Number of spaces that a <Tab> in the file counts for
set softtabstop=4    " Number of spaces that a <Tab> counts for while editing
set shiftwidth=4     " Number of spaces to use for each step of (auto)indent
set expandtab        " Use spaces instead of tabs
set smarttab         " Insert tabs on the start of a line according to shiftwidth
set smartindent      " Smart indentation
set hidden           " Allow buffer switching without saving
set incsearch        " Incremental search
set ignorecase       " Ignore case in search patterns
set smartcase        " Override ignorecase if search pattern contains uppercase letters
set scrolloff=8      " Keep 8 lines visible above/below the cursor
set colorcolumn=100  " Highlight the 100th column
set signcolumn=yes   " Always show the sign column to avoid shifting text
set cmdheight=2      " More space for displaying messages
set updatetime=100   " Faster update time for CursorHold events
set encoding=utf-8   " Use UTF-8 encoding
set nobackup         " Don't keep backup files
set nowritebackup    " Don't keep backup files
set splitright       " Vertical splits open to the right
set splitbelow       " Horizontal splits open below
set autoread         " Automatically read changed files
set mouse=a          " Enable mouse support

filetype on          " Enable file type detection
filetype plugin on   " Enable file type-specific plugins
filetype indent on   " Enable file type-specific indentation

" ========================
" Colors and Themes
" ========================
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

" ========================
" Coc.nvim Configuration
" ========================
let g:coc_global_extensions = ['coc-snippets', 'coc-explorer', 'coc-pairs']

" ========================
" Key Mappings
" ========================
" Leader key
let mapleader = " "  " Set the leader key to space

" FZF key mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :BLines<CR>
nnoremap <leader>fh :Helptags<CR>

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" NERDTree toggle
nnoremap <C-a> :NERDTreeToggle<CR>

" Snippets expansion and navigation
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-k> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<c-k>'

" Convert visual selection to snippet
xmap <leader>x <Plug>(coc-convert-snippet)

" Additional key mappings
nnoremap <space>el :CocList explPreset
nnoremap oo A<CR>
nnoremap te :tabe<CR>
nnoremap ty :bn<CR>
nnoremap tr :bp<CR>
nnoremap td :bd<CR>
nnoremap th :split<CR>
nnoremap tv :vsplit<CR>
nnoremap tt :q<CR>
nnoremap tc :!echo "Hello, World!"<CR> " Exemplo de comando shell

" ========================
" Functions
" ========================
" Check if backspace key was pressed
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"



" Configurações do CoC.nvim

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Fim das configurações do CoC.nvim


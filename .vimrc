vim9script noclear

###PLUGINS

if !filereadable(expand('~/plug.vim'))
  silent !curl -fLo ~/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

plug#begin('~/.vim/plugged')
    Plug 'will133/vim-dirdiff'
    Plug 'vim-jp/vim-vimlparser'
    Plug 'Eliot00/auto-pairs'
    Plug 'greeschenko/vim9-lsp'
    Plug 'greeschenko/vim-fugitive'
    Plug 'greeschenko/vim9-line.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'airblade/vim-gitgutter'
    Plug 'Yggdroot/indentLine'
    Plug 'mityu/vim-alith'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/scrooloose/nerdcommenter.git'
    Plug 'https://github.com/terryma/vim-multiple-cursors'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'monkoose/vim9-stargate'
    Plug 'greeschenko/daytask'
    Plug 'greeschenko/cyberpunk99.vim'
    Plug 'sago35/tinygo.vim'
    Plug 'dyng/ctrlsf.vim'
plug#end()

#### SETTINGS

set wildmenu               #visual autocomplete for command menu
set autoread               #auto reread file after change
set nobackup               #no backups files
set noswapfile             #no swap files
set termencoding=utf-8     #default terminal encoding
set encoding=utf8          #default encoding
set clipboard=unnamed      #use vim clipboard for all terminals
set clipboard+=unnamedplus #use vim clipboard for Xorg(global) clipboard
set hidden                 #do not unload buffer then select enother
set modifiable             #switching from an unsaved buffer
set mmp=5000               #Maximum amount of memory (in Kbyte) to use for pattern matching.
set nu                     #on line numbers
set relativenumber         #on relative numbers by default
set showmatch              #on show match breakets
set showtabline=1          #on tabline alveys show
set incsearch              #on search by typing
set hlsearch               #on search result highlite
set ignorecase             #on ignore search register
set expandtab              #use spaces to insert <Tab>
set shiftwidth=4           #default tabulation spaces number for indentation
set softtabstop=4          #default tabulation spaces number for <Tab> or <BS>
set tabstop=4              #default tabulation staces for auto indentation
set smartindent
set nowrap                 #off wrap logn lines
set signcolumn=yes         #Whether or not to draw the signcolumn.
set lazyredraw             #on lazy redraw screen
set ttyfast                #on fast terminal
#set cursorcolumn           #on cursor column
#set cursorline             #on cursor column
set colorcolumn=80         #is a comma-separated list of screen columns that are highlighted with ColorColumn
set updatetime=300         # Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable

set background=dark
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme cyberpunk99

set complete=
set complete+=. #from current buffer
set complete+=k #from dictionary
set complete+=b #from other buffers
set completeopt=menuone,noinsert,noselect,preview

set timeoutlen=100

g:statusline_fmt = '%s'  #fugitive status formating

g:qline_config = {
  active: {
    left: [
      ['mode', 'paste'],
      ['gin_branch', 'filename', 'gitgutter'],
      ['bufstate']
    ],
  },
  component: {
      filename: {
          content: () => ' %F',
      },
      gin_branch: {
          #content: () => substitute(gin#component#branch#ascii(), '^\(\S\+\).*', '\1', ''),
          content: () => '%{FugitiveStatusline()}',
          highlight: 'Git',
      },
      gitgutter: {
          content: () =>
              g:GitGutterGetHunkSummary()
              ->mapnew((idx, val) => !val ? '' : ['+', '~', '-'][idx] .. val)
              ->filter((_, val) => !!val)
              ->join(),
          visible_condition: () => g:GitGutterGetHunks(),
      },
  },
}

g:indentLine_char = '┆'

g:UltiSnipsExpandTrigger = "<tab>"
g:UltiSnipsJumpForwardTrigger = "<tab>"
g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
g:UltiSnipsListSnippets = "<leader><tab>"
g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"
g:UltiSnipsSnippetDirectories = ["UltiSnips"]

g:NERDTreeDirArrowExpandable = '|'
g:NERDTreeDirArrowCollapsible = '-'
g:NERDTreeIgnore = ['^node_modules$']
var NERDTreeShowLineNumbers = 0
var NERDTreeShowHidden = 1
var NERDTreeMinimalUI = 1

g:multi_cursor_exit_from_insert_mode = 0

g:sneak#label = 1
g:ctrlsf_context = '-B 2 -A 7'

lsp#options#OptionsSet({
    showDiagWithVirtualText: v:true,
    showInlayHints: v:false,
    showDiagOnStatusLine: v:false,
    showDiagInPopup: v:false,
    completionMatcher: "fuzzy",
    snippetSupport: v:false,
    diagSignErrorText: '◆ ',
    diagSignWarningText: '◆ ',
    diagSignInfoText: '◆ ',
    diagSignHintText: '◆ ',
    ultisnipsSupport: v:true,
    completionTextEdit: v:false,
})

var lspServers = [
    {
        'filetype': ['vim'],
        'path': 'vim-language-server',
        'args': ['--stdio']
    },
    {
        'filetype': ['javascript', 'typescript'],
        'path': 'typescript-language-server',
        'args': ['--stdio']
    },
    {
        'filetype': ['go', 'gomod'],
        'path': '/home/olex/prodev/go/bin/gopls',
        'args': [],
    }
]

lsp#lsp#AddServer(lspServers)

###HIGHLITE

highlight Git guibg=#F34F29 guifg=#FFFFFF ctermbg=202 ctermfg=231
highlight link LspDiagLine NONE
highlight link LspDiagVirtualText WarningMsg

###KEYMAPS

g:mapleader = "\<Space>"
g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader>      :<c-u>WhichKeyVisual '<Space>'<CR>
nmap <leader>e :UltiSnipsEdit<cr>
#set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

nmap <leader>q ZZ
nmap <leader>s :w<cr>


nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

#all line selected without whitespaces
nmap <leader>vl ^v$h

nmap <silent> <esc> :nohlsearch<return>

vmap < <gv
vmap > >gv
nmap > :bn<CR>
nmap < :bp<CR>
#nmap <leader>c :bd<CR>
nmap <leader>/ :BLines<CR>
nmap <leader>b :Buffers<CR>

nmap <leader>ff :Files<cr>
nmap <leader>fl :Lines<cr>
nmap <leader>fr :Rg<cr>
nmap <leader>fm :Marks<cr>
nmap <leader>fh :History<cr>
nmap <leader>f: :History:<cr>
nmap <leader>f/ :History/<cr>
nmap <leader>fs :Snippets<cr>
nmap <leader>fC :Commits<cr>
nmap <leader>fc :BCommits<cr>

noremap <leader>mf <Cmd>call stargate#OKvim(1)<CR>
noremap <leader>mF <Cmd>call stargate#OKvim(2)<CR>
noremap <leader>mw <Cmd>call stargate#Galaxy()<CR>
noremap <leader>mW <Cmd>call stargate#OKvim('\<')<CR>
noremap <leader>me <Cmd>call stargate#OKvim('\S\>')<CR>
noremap <leader>ml <Cmd>call stargate#OKvim('\_^')<CR>
noremap <leader>mE <Cmd>call stargate#OKvim('\S\s*$')<CR>
noremap <leader>m$ <Cmd>call stargate#OKvim('$')<CR>
noremap <leader>m[ <Cmd>call stargate#OKvim('[(){}[\]]')<CR>

nmap <leader>no :NERDTree<cr>
nmap <leader>nf :NERDTreeFind<cr>

nmap <silent> <leader>lD :LspGotoDeclaration<CR>
nmap <silent> <leader>ld :LspGotoDefinition<CR>
nmap <leader>li          :LspGotoImpl<CR>
nmap <leader>lt          :LspGotoTypeDef<CR>
nmap <leader>lr          :LspShowReferences<CR>
nmap <leader>la          :LspCodeAction<CR>
nmap <leader>ln          :LspRename<CR>
nmap <leader>K           :LspHover<CR>
nmap <leader>len         :LspDiagNext<CR>
nmap <leader>lep         :LspDiagPrev<CR>
nmap <leader>lel         :LspDiagShow<CR>
nmap <leader>l=          :LspFormat<CR>

nmap <leader>gc :Git commit -a<CR>
nmap <leader>ga :Git add .<CR>
nmap <leader>gD :Git diff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gb :Git blame<CR>
nmap <leader>gm :Git mergetool<CR>
nmap <leader>gt :Git difftool<CR>
nmap <leader>gs :Gsplit<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gh :GitGutterLineHighlightsToggle<CR>

###AUTOCMD

#autocmd BufWritePre *.go  execute('LspFormat')
#autocmd BufWritePre *.js  execute('LspFormat')
#autocmd BufWritePre *.ts  execute('LspFormat')

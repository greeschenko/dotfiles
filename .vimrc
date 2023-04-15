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

#:Git commit
#:Git rebase -i
#:Git diff
#:Git log
#:Git blame
#:Git mergetool
#:Git difftool

#:Gedit
#:Gsplit
#loads the current file as it existed 3 commits ago.
#:Gedit HEAD~3:%
#:Gdiffsplit
#:Gwrite
#:Ggrep
#:GMove
#:GRename
#:GDelete
#:GRemove

    Plug 'greeschenko/vim9-line.vim'
    Plug 'liuchengxu/vim-which-key'
    Plug 'airblade/vim-gitgutter'



## You can explicitly turn vim-gitgutter off and on (defaults to on):
## 
## turn off with :GitGutterDisable
## turn on with :GitGutterEnable
## toggle with :GitGutterToggle.
## To toggle vim-gitgutter per buffer:
## 
## turn off with :GitGutterBufferDisable
## turn on with :GitGutterBufferEnable
## toggle with :GitGutterBufferToggle
## You can turn the signs on and off (defaults to on):
## 
## turn on with :GitGutterSignsEnable
## turn off with :GitGutterSignsDisable
## toggle with :GitGutterSignsToggle.
## And you can turn line highlighting on and off (defaults to off):
## 
## turn on with :GitGutterLineHighlightsEnable
## turn off with :GitGutterLineHighlightsDisable
## toggle with :GitGutterLineHighlightsToggle.
## 
## nmap ]h <Plug>(GitGutterNextHunk)
## nmap [h <Plug>(GitGutterPrevHunk)


    Plug 'Yggdroot/indentLine'

## :IndentLinesToggle

    Plug 'mityu/vim-alith'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'https://github.com/scrooloose/nerdtree.git'
    Plug 'https://github.com/scrooloose/nerdcommenter.git'
    Plug 'https://github.com/terryma/vim-multiple-cursors'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'

##  -----------------------+--------------------------------------------------------------------------------------
##   `:Files [PATH]`         | Files (runs  `$FZF_DEFAULT_COMMAND`  if defined)
##   `:GFiles [OPTS]`        | Git files ( `git ls-files` )
##   `:GFiles?`              | Git files ( `git status` )
##   `:Buffers`              | Open buffers
##   `:Colors`               | Color schemes
##   `:Ag [PATTERN]`         | {ag}{7} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
##   `:Rg [PATTERN]`         | {rg}{8} search result ( `ALT-A`  to select all,  `ALT-D`  to deselect all)
##   `:Lines [QUERY]`        | Lines in loaded buffers
##   `:BLines [QUERY]`       | Lines in the current buffer
##   `:Tags [QUERY]`         | Tags in the project ( `ctags -R` )
##   `:BTags [QUERY]`        | Tags in the current buffer
##   `:Marks`                | Marks
##   `:Windows`              | Windows
##   `:Locate PATTERN`       |  `locate`  command output
##   `:History`              |  `v:oldfiles`  and open buffers
##   `:History:`             | Command history
##   `:History/`             | Search history
##   `:Snippets`             | Snippets ({UltiSnips}{9})
##   `:Commits [LOG_OPTS]`   | Git commits (requires {fugitive.vim}{10})
##   `:BCommits [LOG_OPTS]`  | Git commits for the current buffer; visual-select lines to track changes in the range
##   `:Commands`             | Commands
##   `:Maps`                 | Normal mode mappings
##   `:Helptags`             | Help tags [1]
##   `:Filetypes`            | File types



    Plug 'ntpeters/vim-better-whitespace'
    Plug 'maxmellon/vim-jsx-pretty'
    ##Plug 'justinmk/vim-sneak'
    Plug 'monkoose/vim9-stargate'

## # For 1 character to search before showing hints
## noremap <leader>f <Cmd>call stargate#OKvim(1)<CR>
## # For 2 consecutive characters to search
## noremap <leader>F <Cmd>call stargate#OKvim(2)<CR>
##
## nnoremap <leader>w <Cmd>call stargate#Galaxy()<CR>
## # for the start of a word
## noremap <leader>W <Cmd>call stargate#OKvim('\<')<CR>
## # for the end of a word
## noremap <leader>e <Cmd>call stargate#OKvim('\S\>')<CR>
## # for the start of a line
## noremap <leader>l <Cmd>call stargate#OKvim('\_^')<CR>
## # for the last character on the line
## noremap <leader>E <Cmd>call stargate#OKvim('\S\s*$')<CR>
## # for the end of a line
## noremap <leader>$ <Cmd>call stargate#OKvim('$')<CR>
## # for any bracket, parentheses or curly bracket
## noremap <leader>[ <Cmd>call stargate#OKvim('[(){}[\]]')<CR>

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
#nmap <leader>f :Files<cr>



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

###AUTOCMD

#autocmd BufWritePre *.go  execute('LspFormat')
#autocmd BufWritePre *.js  execute('LspFormat')
#autocmd BufWritePre *.ts  execute('LspFormat')

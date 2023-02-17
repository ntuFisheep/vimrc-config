set encoding=UTF-8
set fileencodings=utf-8,cp950	"設定特定檔案的編碼
filetype off
" 編輯喜好設定
syntax on                " 語法上色顯示
set nocompatible         " VIM 不使用和 VI 相容的模式
set shiftwidth=4         " 設定縮排寬度 = 4 
set tabstop=4            " tab 的字元數
set softtabstop=4
set expandtab            " 用 space 代替 tab
set mouse=a
set ruler                " 顯示右下角設定值
set backspace=2          " 在 insert 也可用 backspace
set ic                   " 設定搜尋忽略大小寫
set ru                   " 第幾行第幾個字
set nohlsearch       " 設定高亮度顯示搜尋結果
set ai
set incsearch            " 在關鍵字還沒完全輸入完畢前就顯示結果
set autoindent          " 設定 smartindent
set confirm              " 操作過程有衝突時，以明確的文字來詢問
set history=100          " 保留 100 個使用過的指令
set nu                   " 顯示行號 
" set clipboard=unnamedplus " 直接 default 會將複製的東西丟到 system 裡面
set background=dark
" set termguicolors
" set number relativenumber
" colorscheme torte        " 設定 Vim 的顯示配色
" colorscheme monokai        " 設定 Vim 的顯示配色
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
set rtp+=~/.config/nvim/bundle/Vundle.vim
set rtp+=~/.config/nvim/plugged/vim-code-dark
set rtp+=~/.vim/plugged/sonokai/
" set rtp+=~/.vim/plugged/
colorscheme codedark      " 設定 Vim 的顯示配色
" colorscheme sonokai      " 設定 Vim 的顯示配色
" colorscheme sonokai      " 設定 Vim 的顯示配色
" turn off preview window in vim
let mapleader=";"
set completeopt-=preview

call vundle#begin('~/.config/nvim/bundle')
    " Plugin 'gmarik/Vundle.vim'
    " Plugin 'scrooloose/nerdtree'
    " Plugin 'bfrg/vim-cpp-modern'
    " Plugin 'tomasiser/vim-code-dark'
    Plugin 'mileszs/ack.vim'
call vundle#end()            " required

call plug#begin('~/.config/nvim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'sainnhe/sonokai'
" Plug 'ctrlpvim/ctrlp.vim'

" this highlight plugin will cause some errors in Mac!!!
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'
Plug 'preservim/nerdtree'
Plug 'lfv89/vim-interestingwords'
Plug 'zivyangll/git-blame.vim'

" coc plugin setting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'
Plug 'jremmen/vim-ripgrep'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
filetype plugin on    " required

call plug#end()

" autocmd CursorHold * silent call CocActionAsync('highlight')

" NerdTree 
  " close the tree when you select a file, and create a mapping for find:
  function! ToggleNERDTreeFind()
    if g:NERDTree.IsOpen()
        execute ':NERDTreeClose'
    else
      if bufname('%') == ''
          execute ':NERDTree'
      else
          execute ':NERDTreeFind'
      endif
    endif
  endfunction
  nnoremap <C-d> :call ToggleNERDTreeFind()<cr>
  let g:NERDTreeDirArrowExpandable = '+'
  let g:NERDTreeDirArrowCollapsible = '-'
  let g:NERDTreeWinPos='left'
  let g:NERDTreeSize=30
  let g:NERDTreeShowLineNumbers=1
  let g:NERDTreeShowHidden=1



" Vim Shortcuts
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap [] []<Left>
inoremap <> <><Left>
inoremap {{ {}<Left><CR><Esc>O
inoremap {} {}<Left>
inoremap <C-c> <Esc>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-n> :tabnew<space>

" for suggestion path
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Esc> pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

" for coc-lists
" nnoremap <silent> <space>g :<C-u>CocList --normal gstatus<CR>

" for interestingwords
" let g:interestingWordsRandomiseColors = 1
" let g:interestingWordsRandomiseColors = 1

" if executable('ag')
"   let g:ackprg = 'ag --vimgrep --ignore tags --ignore "cscope.*"'
" endif
" prevent output leak to terminal
set shellpipe=>

" git-blame
nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>

" vim command
command -nargs=1 Count :%s/<args>//gn

" last position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" coc
"" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" fzf
nnoremap <c-p> :Files<CR>

" Ack
" cnoreabbrev Ack Ack!
" nnoremap <Leader>a :Ack!<Space>
" noremap <Leader>a :Ack <cword><cr>

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  command! -bang -nargs=0 RgCWord call fzf#vim#grep('rg --column --line-number --no-heading --color=always --smart-case '.shellescape(expand('<cword>')), 1, fzf#vim#with_preview(), <bang>0)
    nnoremap <silent> <Leader>a :Find<CR> 
    nnoremap <silent> <Leader>fw :RgCWord<CR>
endif

" barbar.nvim tabs settings
" Goto buffer in position...
nnoremap <silent> <leader>1 <Cmd>BufferGoto 1<CR>
nnoremap <silent> <leader>2 <Cmd>BufferGoto 2<CR>
nnoremap <silent> <leader>3 <Cmd>BufferGoto 3<CR>
nnoremap <silent> <leader>4 <Cmd>BufferGoto 4<CR>
nnoremap <silent> <leader>5 <Cmd>BufferGoto 5<CR>
nnoremap <silent> <leader>6 <Cmd>BufferGoto 6<CR>
nnoremap <silent> <leader>7 <Cmd>BufferGoto 7<CR>
nnoremap <silent> <leader>8 <Cmd>BufferGoto 8<CR>
nnoremap <silent> <leader>9 <Cmd>BufferGoto 9<CR>
nnoremap <silent> <leader>0 <Cmd>BufferLast<CR>

let g:coc_global_extensions = ['coc-clangd', 'coc-snippets', 'coc-pyright', 'coc-sh']

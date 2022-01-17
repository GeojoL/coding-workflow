set number
syntax on
colorscheme molokai

map <F5> :call PRUN()<CR>
 func! PRUN()
     exec "w"
     if &filetype == 'python'
         exec "!python %"
     endif
 endfunc

# 下面这一条是打开自动启动Nerdtree， 后期的使用中没有太多用处
# 所以我更改至了<F3>来开关Nerdtree （默认关闭）
# autocmd VimEnter * NERDTree | wincmd p

 nnoremap <F3> :NERDTreeToggle<CR>
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
 
let g:coc_start_at_startup=0
function! CocTimerStart(timer)
    exec "CocStart"
endfunction
call timer_start(500,'CocTimerStart',{'repeat':1})

"解决coc.nvim大文件卡死状况
let g:trigger_size = 0.5 * 1048576

augroup hugefile
  autocmd!
  autocmd BufReadPre *
        \ let size = getfsize(expand('<afile>')) |
        \ if (size > g:trigger_size) || (size == -2) |
        \   echohl WarningMsg | echomsg 'WARNING: altering options for this huge file!' | echohl None |
        \   exec 'CocDisable' |
        \ else |
        \   exec 'CocEnable' |
        \ endif |
        \ unlet size
augroup END


# 加载了很多我也还没太会用但是不影响Default 设定的插件

call plug#begin()

	Plug 'vim-scripts/bash-support.vim'
	Plug 'scrooloose/nerdtree'
	Plug 'scrooloose/syntastic'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'majutsushi/tagbar'
	Plug 'pangloss/vim-javascript'
	Plug 'benmills/vimux'
	Plug 'tomasr/molokai'
	Plug 'valloric/matchtagalways'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}




call plug#end()

# 通过Ctrl键加上hjkl作为视窗移动的方向键

map <C-j> <C-W>j                             
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

# 通过ss 和sv 来分屏上下左右

nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

# 增添新的标签页

nmap tt :tabedit
nmap ww :Unite tab

# 通过d/f + tab来切换标签页

nmap f<Tab> :tabprev<Return>
nmap d<Tab> :tabnext<Return>

let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1


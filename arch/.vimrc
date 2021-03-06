"==========================================  
"General  
"==========================================  
" history存储长度。  
set history=1000         
"检测文件类型  
filetype on  
" 针对不同的文件类型采用不同的缩进格式    
filetype indent on                 
"允许插件    
filetype plugin on  
"启动自动补全  
filetype plugin indent on  
"兼容vi模式。去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
set nocompatible        
set autoread          " 文件修改之后自动载入。  
set shortmess=atI       " 启动的时候不显示那个援助索马里儿童的提示  

" 取消备份。  
"urn backup off, since most stuff is in SVN, git et.c anyway...  
set nobackup  
set nowb  
set noswapfile  

"贴时保持格式  
set paste  
"- 则点击光标不会换,用于复制  
set mouse-=a           " 在所有的模式下面打开鼠标。  
set selection=exclusive    
set selectmode=mouse,key  

" No annoying sound on errors  
" 去掉输入错误的提示声音  
set noerrorbells  
set novisualbell  
set t_vb=  
set tm=500    
syntax enable
"==========================================  
" show and format  
"==========================================  
"显示行号：  
set number  
"set nowrap                    " 取消换行。  
"为方便复制，用F6开启/关闭行号显示:  
nnoremap <F6> :set nonumber!<CR>:set foldcolumn=0<CR>

"括号配对情况  
set showmatch  
" How many tenths of a second to blink when matching brackets  
set mat=2  

"设置文内智能搜索提示  
" 高亮search命中的文本。  
set hlsearch            
" 搜索时忽略大小写  
set ignorecase  
" 随着键入即时搜索  
set incsearch  
" 有一个或以上大写字母时仍大小写敏感  
set smartcase  

" 代码折叠  
" set foldenable  
" 折叠方法  
" manual    手工折叠  
" indent    使用缩进表示折叠  
" expr      使用表达式定义折叠  
" syntax    使用语法定义折叠  
" diff      对没有更改的文本进行折叠  
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}  
" set foldmethod=syntax  
" 在左侧显示折叠的层次  
"set foldcolumn=4  

set tabstop=4                " 设置Tab键的宽度        [等同的空格个数]  
set shiftwidth=4  
set expandtab                " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]  
" 按退格键时可以一次删掉 4 个空格  
set softtabstop=4  

"set ai "Auto indent  
"set si "Smart indent  

"==========================================  
" status  
"==========================================  
"显示当前的行号列号：  
set ruler  
"在状态栏显示正在输入的命令  
set showcmd  

" Set 7 lines to the cursor - when moving vertically using j/k 上下滚动,始终在中间  
set so=7    
set cursorline              " 突出显示当前行

if has("autocmd") 
  " When editing a file, always jump to the last known cursor position. 
  " Don't do it when the position is invalid or when inside an event handler 
  " (happens when dropping a file on gvim). 
  autocmd BufReadPost * 
    \ if line("'\"") > 0 && line("'\"") <= line("$") | 
    \   exe "normal g`\"" | 
    \ endif 
 
endif " has("autocmd")

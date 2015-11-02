" 一个简单的 vimrc 配置 
" by leebaok

set nocompatible    " 不使用vi的键盘模式
" 设定默认解码
set fenc=utf-8      " 详细信息可以见 :help fenc/fileencoding
" 设置读取文件时尝试的编码方式
set fencs=utf-8,usc-bom,gb18030,gbk,gb2312,cp936
" 允许backspace处理indent,eol,start(缩进、行尾、开头)
set backspace=indent,eol,start
set autoindent      " 自动缩进
set ts=4            " 设置 tab 为4个空格
set sw=4            " 设置缩进为4空格
set history=50		"  保存50跳记录
set ruler		    " 在右下角显示光标所在地方
set showcmd		    " 在输入命令过程中，显示没有输完的命令
set incsearch		" 增量搜索，每输入一个字符就立即进行搜索
set cursorline      " 在正在编辑的该行加一条横线
set showmatch       " 高亮 {[()]} 的匹配 
set hlsearch        " 高亮搜索结果 
set nu              " 显示行号
set wrap            " 自动折行，当文本太长时，折行显示

syntax enable       " 高亮
filetype plugin indent on   " 根据文件类型加载插件、缩进、语法检查

" 关于备份 
set backup		" 备份文件
set backupdir=~/.vim-backup " 备份文件的位置
set undofile		" 保存一份未修改的文件
set undodir=~/.vim-backup

set mouse-=a        " 禁用鼠标
" 打开鼠标支持
"if has('mouse')
"  set mouse=a
"endif

" 打开文件时，跳转到上次编辑到的地方，除非第一行有标记
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" 使用pathogen来管理插件
" pathogen.vim 放在 .vim/autoload 下
" 其他插件都放在 .vim/bundle 下
" 安装其他插件： 
" 	1. cd .vim/bundle 
" 	2. git clone https://github.com/...
" 	3. in Vim :   :Helptags  生成帮助文档
execute pathogen#infect()


" solarized 配置 ( 需要在 terminal 中选择 solarized 配色，否则很难看)
" 	cd .vim/bundle
"	git clone git://github.com/altercation/vim-colors-solarized.git
" 终端使用solarized时，vim 背景色可能会产生冲突，需要指定 t_Co解决，貌似不需要 
" 如果terminal 也想使用 solarized，参见：
" 	https://github.com/Anthony25/gnome-terminal-colors-solarized
" 如果 ls 的配色也使用 solarized，参见：
" 	https://github.com/seebi/dircolors-solarized
set t_Co=16 " 指定颜色数目 
set background=light
colorscheme solarized
" 如果terminal没有使用solarized，那么指定solarized使用256兼容模式
" let g:solarized_termcolors=256  

" airline 配置
" 	cd .vim/bundle 
"  	git clone https://github.com/bling/vim-airline
"  	apt-get install fonts-powerline
set laststatus=2     " airline 一直显示
let g:airline#extensions#tabline#enabled = 1   " tabline 一直在顶部显示
let g:airline_powerline_fonts=1  " 让airline使用powerline的符号字体显示
" 禁用 trailing space check 和 mixed-indent check
" 如果不禁用，那么 trailing space/mixed indent 会在ariline末尾显示
" trailing space就是行尾空格，他会显示之后行尾有空格的行号
" mixed-indent就是混合使用space、tab来缩进，他会显示之后混合缩进的行的行号
let g:airline#extensions#whitespace#enabled=0
" 设置 airline 的主题（所有主题在 .vim/bundle/vim-airline/autoload/airline/themes 下面）
" 在 solarized 配色下，这几个主题不错：solarized base16 bubblegum dark kalisi lucius luna tomorrow understated zenburn 
" let g:airline_theme='solarized'
" 是否在顶栏显示buffers （如果显示，那么当只有一个tab时，会将buffers显示出来）
let g:airline#extensions#tabline#show_buffers = 0


" NERD Tree 配置
" ToDo ： http://vimawesome.com/plugin/the-nerd-tree
" autocmd vimenter * NERDTree

" vimcdoc (vim中文文档)安装
" 	cd .vim/bundle
" 	git clone https://github.com/asins/vimcdoc.git
" 	in Vim :  :helptags ~/.vim/bundle/vimcdoc/doc
" 	然后可以使用了

" indentLine 配置
"   cd .vim/bundle
"   git clone https://github.com/Yggdroot/indentLine
" 默认indentLine可以将空格缩进转化为垂直对其线，对tab不起作用
" 要想对 tab 起作用，可以 :set list lcs=tab:\|\
" 设置对其线颜色
" let g:indentLine_color_term=239
" 设置对其字符,  比如 ¦, ┆, ︙ or │
" let g:indentLine_char='¦'   
" 默认关闭对其线，在vim中可以通过 IndentLinesToggle 切换
" 如果要在 vim 中查看 g:indentLine_enabled，输入 let g:indentLine_enabled 就可以了
let g:indentLine_enabled=0

" vim 在做语法检查的时候需要依赖一些语法检查器
" 比如，python 的检查需要依赖 python-flake8 或者 pylint 或者 pyflakes
" 我们这里用 pyflakes 检查（apt-get install pyflakes）
" 安装之后，通过下面指令指定检查器
" 注意： pyflakes是一个PATH路径下的可执行文件，为 /usr/bin/pyflakes
"        flake8(python-flake8)之前使用过，检查的太严了，烦死了
" 补充： 使用python的语法检查还需要安装vim相关的插件
"        因为vim默认编译不支持python的插件自动加载（进入vim, :version 查看选项）
"        一种方法是安装 scrooloose/syntastic，这个插件支持无数语言的检查
"        	cd .vim/bundle
"        	git clone https://github.com/scrooloose/syntastic
let g:syntastic_python_checkers=['pyflakes']

" c 语法检查器配置
" include 文件的目录
" let g:syntastic_c_include_dirs = ['/usr/include/', '/usr/include/gtk-3.0/']



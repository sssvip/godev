" 关闭兼容模式
set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8
set nu " 设置行号
set cursorline "突出显示当前行
"set cursorcolumn " 突出显示当前列
set showmatch " 显示括号匹配

" tab 缩进
set tabstop=4 " 设置Tab长度为4空格
set shiftwidth=4 " 设置自动缩进长度为4空格
set autoindent " 继承前一行的缩进方式，适用于多行注释


syntax enable
syntax on                    " 开启文件类型侦测



set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" go 主要插件
"Plugin 'fatih/vim-go' ", { 'tag': '*' }
"
Plugin 'fatih/molokai'
Plugin 'fatih/vim-go', { 'tag': '*' }
" go 中的代码追踪，输入 gd 就可以自动跳转
Plugin 'dgryski/vim-godef'

" 可以快速对齐的插件
Plugin 'junegunn/vim-easy-align'

" 用来提供一个导航目录的侧边栏
Plugin 'scrooloose/nerdtree'

" 可以使 nerdtree 的 tab 更加友好些
Plugin 'jistr/vim-nerdtree-tabs'

" 可以在导航目录中看到 git 版本信息
Plugin 'Xuyuanp/nerdtree-git-plugin'


" 自动补全括号的插件，包括小括号，中括号，以及花括号
Plugin 'jiangmiao/auto-pairs'

" Vim状态栏插件，包括显示行号，列号，文件类型，文件名，以及Git状态
Plugin 'vim-airline/vim-airline'

" 代码自动完成，安装完插件还需要额外配置才可以使用
Plugin 'Valloric/YouCompleteMe'

" 可以在文档中显示 git 信息
Plugin 'airblade/vim-gitgutter'

" 查看当前代码文件中的变量和函数列表的插件，
" 可以切换和跳转到代码中对应的变量和函数的位置
" 大纲式导航, Go 需要 https://github.com/jstemmer/gotags 支持
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required

"airline
let g:airline_detect_paste=1
"NERDTree快捷键
nnoremap <silent> <F5> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeAutoCenter=1
let NERDTreeShowLineNumbers=1
"let NERDTreeShowHidden=1

"Golang
let g:go_fmt_command = "goimports"
set autowrite " :GoBuild 自动保存现场进行build
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let mapleader = ","
"autocmd FileType go nmap <leader>r <Plug>(go-run) %<CR>
autocmd FileType go nmap <Leader>r :!go run %<CR>
autocmd FileType go nmap <Leader>vt :!go test -v ./...<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:rehash256 = 1
let g:molokai_original = 1
"colorscheme molokai

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

nmap <F8> :TagbarToggle<CR>

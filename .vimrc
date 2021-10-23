set re=2
set timeoutlen=1000
set ttimeoutlen=0
"filetype off

"aici
"set termguicolors

set background=dark
set clipboard=unnamed
"set shortmess=I
set cinoptions+=t0
set cinoptions+=l1
set cindent
set autowrite
"set makeprg=make\ -kj$(nproc)
set ai
syntax on
syntax enable
set wildmenu
set showcmd
set nohlsearch
set backspace=indent,eol,start
set nostartofline
set ruler
set laststatus=2
set encoding=utf-8
autocmd bufwinleave *.* mkview
autocmd bufwinenter *.* silent loadview
"set lazyredraw
set undofile
set undodir=$XDG_CONFIG_HOME/vim/undo
let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

function! Guard()
  let basename = expand("%:t:r")
  let includeGuard = '__' . basename . '_h__'
  call append(0, "#ifndef " . includeGuard)
  call append(1, "#define " . includeGuard)
  call append(line("$"), "#endif /* !" . includeGuard . " */")
endfunction

set noswapfile


call plug#begin('~/.vim/bundle')
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
"Plug 'junegunn/limelight.vim'
"Plug 'joshdick/onedark.vim'
"Plug 'vim-scripts/c.vim'
Plug 'tibabit/vim-templates'
"Plug 'mptre/vim-printf'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lifepillar/vim-gruvbox8'
"Plug 'vim-scripts/OmniCppComplete'
Plug 'honza/vim-snippets'
Plug 'rhysd/vim-clang-format'
Plug 'vim-syntastic/syntastic'
Plug 'NLKNguyen/c-syntax.vim'
"Plug 'junegunn/vim-easy-align'
"Plug 'agfline/c-syntax.vim'
"Plug 'psliwka/vim-smoothie'
"Plug 'chriskempson/base16-vim'
"Plug 'philj56/vim-asm-indent'
"Plug 'Yggdroot/indentLine'
"Plug 'morhetz/gruvbox'
Plug 'drmikehenry/vim-headerguard'
"Plug 'ryanoasis/vim-devicons'
"Plug 'fcpg/vim-fahrenheit'
"Plug 'sonjapeterson/1989.vim'
"Plug 'junegunn/seoul256.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'w0rp/ale'
"Plug 'https://github.com/slakkenhuis/vim-margin'
"Plug 'https://github.com/WolfgangMehner/c-support.git'
"Plug 'joshdick/onedark.vim'
"Plug 'bbchung/clighter8'
"Plug 'puremourning/vimspector'
"Plug 'gilligan/vim-lldb'
"Plug 'preservim/nerdcommenter'

"Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'habamax/vim-gruvbit'
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
"Plug 'tpope/vim-fugitive'
call plug#end()


autocmd BufEnter *.hpp :setlocal filetype=hpp
autocmd BufEnter *.h :setlocal filetype=c
autocmd BufEnter *.c :setlocal filetype=c
au! BufRead,BufNewFile *.c       setfiletype c
au! BufRead,BufNewFile *.h       setfiletype c

augroup filetypedetect
  au! BufRead,BufNewFile *.c setfiletype c
  au! BufRead,BufNewFile *.h setfiletype h
augroup END

nnoremap <Leader>f :<C-u>ClangFormat<CR>
nnoremap <Leader>c :<C-u>CocStart<CR>


let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/ultisnips']
filetype plugin indent on
syntax on


"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_enable_c_checker = 1
"let g:syntastic_c_exec='/usr/bin/clang'

let g:clang_library_path='/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'

"let g:syntastic_c_checkers = ['clang_check', 'gcc']
"let g:syntastic_c_compiler ='clang'
"let g:syntastic_c_compiler_options =' -Weverything - Wall -Wextra -Wpedantic -g'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_check_on_w = 1

"let g:syntastic_cursor_column = 0

"let g:syntastic_enable_signs = 1
"let g:syntastic_auto_jump = 1

set visualbell
set modelines=0

"map <C-b> :!clang $(pkg-config --cflags --libs openssl) % -o % && ./% <CR>
map <Leader>g :Goyo <CR> 
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set showmatch

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_loc_list_height = 5
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_wq = 1
"let g:syntastic_check_on_w = 1
"let g:syntastic_error_symbol = '❌'
"let g:syntastic_style_error_symbol = '⁉️'
"let g:syntastic_warning_symbol = '⚠️'

"let g:syntastic_style_warning_symbol = '💩'

"highlight link SyntasticErrorSign SignColumn

"highlight link SyntasticWarningSign SignColumn
"highlight link SyntasticStyleErrorSign SignColumn
"highlight link SyntasticStyleWarningSign SignColumn
set ffs=unix,dos

"let g:syntastic_c_checkers = ['clang']

set cmdheight=2
set updatetime=300
set nobackup
set nowritebackup
set keywordprg+=\ 3
set completeopt +=preview

let g:gruvbox_contrast_dark="soft"
let g:gruvbox_hls_cursor="orange"
let g:gruvbox_number_column="bg1"
let g:gruvbox_improved_strings=1
let g:gruvbox_vert_split="bg0"

colo gruvbox8
"colo gruvbox
highlight Comment cterm=italic

nnoremap <silent> K :call <SID>show_documentation()<CR>

set hidden
set nobackup
set nowritebackup
set cmdheight=2
"set shortmess+=c

" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"let g:coc_start_at_startup = v:false


set wrap
set textwidth=80
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start 
set matchpairs+=<:> " use % to jump between pairs
set nohlsearch
set incsearch
set noignorecase
set smartcase
set showmatch


"aici
"if exists('+termguicolors')
"  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"  set termguicolors
"endif

set nocursorline
set foldmethod=manual
let ruby_no_expensive=1
set norelativenumber
syntax sync minlines=256
set nocursorcolumn
autocmd BufEnter * :syn sync maxlines=500

nnoremap <Leader> g_a;<Esc>
nnoremap <Leader> g0i//<Esc>;

let g:UltiSnipsSnippetDirectories=['~/.vim/bundle/ultisnips']
let g:UltiSnipsUsePythonVersion = 3

vnoremap <silent> <S-Up>  @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <S-Down>  @='"zx"zp`[V`]'<CR>
ca w!! w !sudo tee >/dev/null "%"

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

hi Visual          guifg=#000000 guibg=#FD971F

"setlocal cino="Ls,:0,l1,t0,(s,U1,W4"

setlocal path=.,,*/include/**3,./*/include/**3
setlocal path+=/usr/include

autocmd BufLeave,WinLeave *.c normal! mC
autocmd BufLeave,WinLeave *.cpp normal! mC
autocmd BufLeave,WinLeave *.h normal! mH


if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif " has("autocmd")



inoremap  ,  ,<Space>



inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
"
vnoremap ( s()<Esc>P<Right>%
vnoremap [ s[]<Esc>P<Right>%
vnoremap { s{}<Esc>P<Right>%
"
xnoremap  '  s''<Esc>P<Right>
xnoremap  "  s""<Esc>P<Right>
xnoremap  `  s``<Esc>P<Right>

if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif " has("autocmd")

set t_ZH=^[[3m
set t_ZR=^[[23m

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

"highlight Comment ctermfg=green guifg=green

"aici
"colo gruvbox8

"let g:syntastic_enable_signs=1
"let g:syntastic_cpp_compiler_options = ' --std=cx2'

au BufRead,BufNewFile *.c set ft=c
"nmap ga <Plug>(EasyAlign)

function FormatBuffer()
if &modified "&& !empty (findfile('.clang-format', expand('%:p:h') . ';'))
let cursor_pos = getpos('.')

":%!clang-format -style='{AlignConsecutiveAssignments: true}'
:%! clang-format  -style='{AlignConsecutiveAssignments: true,  AlignConsecutiveBitFields: true}'

",AlwaysBreakTemplateDeclarations : true,AlignConsecutiveDeclarations: true,  AlwaysBreakTemplateDeclarations : true, Standard : C++11, BreakBeforeBraces : Stroustrup, AlignConsecutiveMacros: true, AlignConsecutiveBitFields: true}'
call setpos('.', cursor_pos)
endif
endfunction 

autocmd BufWritePre *.h,*.hpp,*.c,*.cpp,*.vert,*.frag :call FormatBuffer()

hi! link SignColumn LineNr
hi! link SyntasticErrorSign ErrorMsg
hi! link SyntasticWarningSign WarningMsg

augroup sourcing
  autocmd!
  autocmd bufwritepost .vimrc source $MYVIMRC
augroup END

augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END
" Remember info about open buffers on close

function! CmdLine(str)
  exe "menu Foo.Bar :" . a:str
  emenu Foo.Bar
  unmenu Foo
endfunction


let g:easytags_auto_update = 0
let g:easytags_auto_highlight = 0
let g:easytags_on_cursorhold = 0

nmap <leader>2_ cr_
nmap <leader>2c crc
" Convert name to MixedCase
nmap <leader>2m crm
" Convert name to SNAKE_UPPERCASE
nmap <leader>2u cru
" Convert name to dash-case
nmap <leader>2- cr-

set autowrite

"set viminfo^=%"autocmd FileType c ClangFormatAutoEnable

map Q <Nop>

set encoding=utf-8
scriptencoding utf-8
set nobomb
set fileformats=unix,mac,dos
set timeoutlen=5000
set ttimeout
set ttyfast
set updatetime=500
"set backupdir=~/.vim/tmp/backup//
set undofile
set undodir=~/.vim/tmp/undo
nnoremap <silent> <c-u> :call <sid>smoothScroll(1)<cr>
nnoremap <silent> <c-d> :call <sid>smoothScroll(0)<cr>
set splitright


"aici
"
"if has('termguicolors') && $COLORTERM ==# 'truecolor'
"let &t_8f = "\<esc>[38;2;%lu;%lu;%lum" " Needed in tmux
"let &t_8b = "\<esc>[48;2;%lu;%lu;%lum" " Ditto
"set termguicolors
"endif

let g:default_scrolloff = 2
let &scrolloff=g:default_scrolloff

let &t_ti.="\e[2 q"
let &t_SI.="\e[6 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[2 q"
let &t_te.="\e[0 q"
  
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


set notitle

"set shortmess+=Icm
autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit' |
          \   exe "normal! g`\"" |
          \ endif

set nrformats=hex

if has('patch-8.1.1372') " Has g:statusline_winid
  " Build the status line the way I want - no fat light plugins!
  " For the keys, see :h mode()
  let g:lf_stlh = {
        \ 'n': 'NormalMode',  'i': 'InsertMode',      'R': 'ReplaceMode',
        \ 'v': 'VisualMode',  'V': 'VisualMode', "\<c-v>": 'VisualMode',
        \ 's': 'VisualMode',  'S': 'VisualMode', "\<c-s>": 'VisualMode',
        \ 'c': 'CommandMode', 'r': 'CommandMode',     't': 'CommandMode',
        \ '!': 'CommandMode',  '': 'StatusLineNC'
        \ }

  let g:lf_stlm = {
        \ 'n': 'N',           'i': 'I',               'R': 'R',
        \ 'v': 'V',           'V': 'V',          "\<c-v>": 'V',
        \ 's': 'S',           'S': 'S',          "\<c-s>": 'S',
        \ 'c': 'C',           'r': 'P',               't': 'T',
        \ '!': '!'}

  fun! LFStlHighlight()
    return get(g:lf_stlh,
          \    g:statusline_winid ==# win_getid() ? mode() : '',
          \   'Warnings')
  endf

  let s:stl = "%{winnr()} %{&mod?'◦':' '} %t (%n) %{&ma?(&ro?'▪':' '):'✗'}
          \ %<%{empty(&bt)?(winwidth(0)<80?(winwidth(0)<50?'':expand('%:p:h:t')):expand('%:p:~:h')):''}
          \ %=
          \ %a %w %y %{winwidth(0)<80?'':' '.(strlen(&fenc)?&fenc:&enc).(&bomb?',BOM ':' ').&ff.(&et?'':' ⇥ ')}
          \ %l:%v %P
          \ %#Warnings#%{get(b:, 'lf_stl_warnings', '')}%*"

  let s:stlnc = '    ' . "%{winnr()} %{&mod?'◦':' '} %t (%n) %{&ma?(&ro?'▪':' '):'✗'}
          \ %<%{empty(&bt)?(winwidth(0)<80?(winwidth(0)<50?'':expand('%:p:h:t')):expand('%:p:~:h')):''}
          \ %=
          \ %w %y  %l:%v %P "

  fun! LFBuildStatusLine()
    return g:statusline_winid ==# win_getid()
          \ ? '%#'.get(g:lf_stlh, mode(), 'Warnings').'# '
          \ . get(g:lf_stlm, mode(), mode()) . (&paste ? ' PASTE %* ' : ' %* ') . s:stl
          \ : s:stlnc
  endf
else
  call legacy#statusline#init()
endif

fun! s:smoothScroll(up)
    execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
    redraw
    for l:count in range(3, &scroll, 2)
      sleep 10m
      execute "normal " . (a:up ? "\<c-y>" : "\<c-e>")
      redraw
    endfor
  endf

fun! s:enableStatusLine()
    if exists("g:default_stl") | return | endif
    augroup lf_warnings
      autocmd!
      autocmd BufReadPost,BufWritePost * call <sid>update_warnings()
    augroup END
    set noshowmode " Do not show the current mode because it is displayed in the status line
    set noruler
    let g:default_stl = &statusline
    let g:default_tal = &tabline
    set statusline=%!LFBuildStatusLine()
    set tabline=%!LFBuildTabLine()
  endf

nnoremap gQ <nop>

 let g:loaded_getscriptPlugin = 1
    let g:loaded_gzip = 1
    let g:loaded_logiPat = 1
    let g:loaded_rrhelper = 1
    let g:loaded_tarPlugin = 1
    let g:loaded_vimballPlugin = 1
    let g:loaded_zipPlugin = 1

let g:clang_user_options = '-std=c++14'
    let g:clang_complete_auto = 0
    fun! s:clang_complete_lazy_load()
      if has('python') || has('python3')
        packadd clang_complete
      endif
      autocmd! lf_cpp
      augroup! lf_cpp
    endf
    augroup lf_cpp
      autocmd!
      autocmd BufReadPre *.c,*.cpp,*.h,*.hpp call <sid>clang_complete_lazy_load()
    augroup END

fun! s:goyoEnter()
      if has('gui_running')
        "set fullscreen
        set linespace=5
      endif
      set scrolloff=999 " Keep the edited line vertically centered
      setlocal wrap
      set noshowcmd
"      Limelight
    endf

    fun! s:goyoLeave()
      if has('gui_running')
        "set nofullscreen
        let &linespace=s:linespace
      endif
      set showcmd
      setlocal nowrap
      let &scrolloff=g:default_scrolloff
 "     Limelight!
    endf

    autocmd! User GoyoEnter nested call <sid>goyoEnter()
    autocmd! User GoyoLeave nested call <sid>goyoLeave()

let loaded_matchparen = 1
set autowrite
"set list lcs=tab:\|\ 
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
set backup

"Where to store backups
set backupdir=~/.vim/backup//

"Make backup before overwriting the current buffer
set writebackup

"Overwrite the original backup file
set backupcopy=yes

"Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

set undofile " Maintain undo history between sessions
set undodir=~/.vim/undodir


nnoremap <F2> :HeaderguardAdd<CR>


"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set cursorline
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
set ruler
let g:seoul256_background = 236
let g:seoul256_srgb = 1
let g:gruvbox_filetype_hi_groups = 0
autocmd BufNewFile,BufRead *.s *.nasm *.S *.asm set filetype=nasm




"au FileType c Goyo
au FileType nasm Goyo
"%le5
packadd termdebug
let g:termdebug_wide = 1
set formatoptions=qro

colo gruvbox-material
"let g:gruvbox_contrast_dark = 'hard'
hi Type cterm=italic
hi Statement cterm=italic

autocmd VimLeavePre * if get(g:, 'coc_process_pid', 0)
                \       | call system('kill -9 '.g:coc_process_pid) | endif

set tags=tags;/

"noremap <leader>cf :pyf path/to/llvm/source/tools/clang/tools/extra/include-fixer/tool/clang-include-fixer.py<cr>

"highlight link CocErrorSign GruvboxRed
"nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

let g:coc_node_path ='/usr/local/bin/node'

let g:clang_format#command='clang-format'

let g:clang_format#auto_format=1


nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999



"function! s:show_documentation()
 "   if &filetype == 'vim'
  "    execute 'h '.expand('<cword>')
   " else
    "  call CocAction('doHover')
    "endif
  "endfunction


"set makeprg=gcc-11\ -march=native\ --std=c2x\ -o\ %<\ %\ -lpthread\ -lssl\ -lcrypto\ -ljson-c\ -lm\ -lcurl\ -ggdb\ -fstrict-aliasing\ -lwebsockets


set makeprg=clang\ -Weverything\ -fsanitize=integer\ -Wall\ -march=native\ -std=c2x\ -o\ %<\ %\ -lpthread\ -lssl\ -lcrypto\ -ljson-c\ -lm\ -lcurl\ -ggdb\ -lwebsockets\ -ljson-c\ -O3

vnoremap . :normal .<CR>
"set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%)
"
" Return to last edit position when opening files (You want this!)
"autocmd BufReadPost *
 "    \ if line("'\"") > 0 && line("'\"") <= line("$") |
  "   \   exe "normal! g`\"" |
   "  \ endif



let cursor_pos = getpos('.')
call setpos('.', cursor_pos)



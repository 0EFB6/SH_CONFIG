" use :noh to clear previously highlighted search
" addons used - Papercolor, tabline, surround, repeat.vim

set re=1
set nofixendofline
set nocursorcolumn
set nocursorline
set norelativenumber
set scrolloff=3
syntax sync minlines=256
set mouse=
set lazyredraw
set ttyfast
"set backupdir=.backup/,~/.backup/,/tmp//
"set directory=.swp/,~/.swp/,/tmp//
"set undodir=.undo/,~/.undo/,/tmp//

"noremap ; l
"noremap l gk
"noremap k gj
"noremap j h

nnoremap <S-Tab> <<
inoremap <S-Tab> <C-d>

noremap <esc><esc> :noh<return><esc>

"map <silent> <C-w>; :wincmd l<CR>
"map <silent> <C-w>l :wincmd k<CR>
"map <silent> <C-w>k :wincmd j<CR>
"map <silent> <C-w>j :wincmd h<CR>
"
"map <silent> <C-w>: :wincmd L<CR>
"map <silent> <C-w>L :wincmd K<CR>
"map <silent> <C-w>K :wincmd J<CR>
"map <silent> <C-w>J :wincmd H<CR>

"tnoremap <silent> <C-w>; <C-w>l
"tnoremap <silent> <C-w>l <C-w>k
"tnoremap <silent> <C-w>k <C-w>j
"tnoremap <silent> <C-w>j <C-w>h
"
"tnoremap <silent> <C-w>: <C-w>L
"tnoremap <silent> <C-w>L <C-w>K
"tnoremap <silent> <C-w>K <C-w>J
"tnoremap <silent> <C-w>J <C-w>H

noremap <a-y> "+y
noremap <a-p> "+p

"noremap  <silent> <C-e> :Lexplore<CR>
"inoremap <silent> <C-e> <Esc>:Lexplore<CR>
"vnoremap <silent> <C-e> <Esc>:Lexplore<CR>

"noremap <silent> <C-t> :tabnew<CR>
noremap <silent> <C-q> :q<CR>
noremap <silent> <C-F8> :q!<CR>
noremap <silent> <C-F11> :tabnext<CR>
noremap <silent> <C-F10> :tabprevious<CR>
inoremap <silent> <C-t> <Esc>:tabnew<CR>
inoremap <silent> <C-q> <Esc>:q<CR>
inoremap <silent> <C-F8> <Esc>:q!<CR>
inoremap <silent> <C-F11> <Esc>:tabnext<CR>
inoremap <silent> <C-F10> <Esc>:tabprevious<CR>

noremap <C-s> :update<CR>
noremap <C-F9> :execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!<CR>
command -bar Ss execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!
inoremap <C-s> <Esc>:update<CR>
inoremap <C-F9> <Esc>:execute 'silent! write !sudo /usr/bin/tee "%" >/dev/null' <bar> edit!<CR>
set clipboard=unnamed

noremap  <F5> :vert term make run<CR>
inoremap <F5> <Esc>:vert term make run<CR>

noremap <S-F5> :vert term make<CR>
inoremap <S-F5> <Esc>:vert term make<CR>

set showtabline=4
set noshowmode
set number
set shiftwidth=4 
set softtabstop=4
syntax on
set smarttab	
set tabstop=4
set smartindent
set cindent
set cinkeys-=0#
set indentkeys-=0#
"filetype plugin indent on
"set autoindent
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_altv = 1
let g:netrw_winsize = 20
let g:netrw_browse_split=3
"autocmd VimEnter,TabNew * :Vexplore

nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"set t_Co=256

"set background=dark 
colorscheme medic_chalk

set laststatus=2
autocmd BufNewFile,BufRead *.asm set syntax=nasm

set hlsearch  
set smartcase 
set ignorecase
set incsearch

set timeoutlen=100
set ttimeoutlen=5
inoremap kl <Esc>
"vmap kl <Esc>

let s:currentmode={
    \ 'n'  : ["%1*",' NORMAL '],
    \ 'no' : ["%1*",' NORMAL·OPERATOR PENDING '],
    \ 'v'  : ["%3*",' VISUAL '],
    \ 'V'  : ["%3*",' V·LINE '],
    \ "^V" : ["%3*",' V·BLOCK '],
    \ 's'  : ["%5*",' SELECT '],
    \ 'S'  : ["%5*",' S·LINE '],
    \ '^S' : ["%5*",' S·BLOCK '],
    \ 'i'  : ["%2*",' INSERT '],
    \ 'R'  : ["%4*",' REPLACE '],
    \ 'Rv' : ["%4*",' V·REPLACE '],
    \ 'c'  : ["%2*",' COMMAND '],
    \ 'r'  : ["%4*",' PROMPT '],
    \}
"    \ 'cv' : ["%*",' VIM EX '],
"    \ 'ce' : ["%*",' EX '],
"    \ 'rm' : ["%*",' MORE '] ,
"    \ 'r?' : ["%*",' CONFIRM '],
"    \ '!'  : ["%*",' SHELL ' ],
"    \ 't'  : ["%*",' TERMINAL ']

 let s:file_node_extensions = {
	\ 'asm'	     : '',
	\ 'txtfmt'   : '',
        \ 'styl'     : '',
        \ 'sass'     : '',
        \ 'scss'     : '',
        \ 'htm'      : '',
        \ 'html'     : '',
        \ 'slim'     : '',
        \ 'haml'     : '',
        \ 'ejs'      : '',
        \ 'css'      : '',
        \ 'less'     : '',
        \ 'md'       : '',
        \ 'mdx'      : '',
        \ 'markdown' : '',
        \ 'rmd'      : '',
        \ 'json'     : '',
        \ 'webmanifest' : '',
        \ 'js'       : '',
        \ 'mjs'      : '',
        \ 'jsx'      : '',
        \ 'rb'       : '',
        \ 'gemspec'  : '',
        \ 'rake'     : '',
        \ 'php'      : '',
        \ 'py'       : '',
        \ 'pyc'      : '',
        \ 'pyo'      : '',
        \ 'pyd'      : '',
        \ 'coffee'   : '',
        \ 'mustache' : '',
        \ 'hbs'      : '',
        \ 'conf'     : '',
        \ 'ini'      : '',
        \ 'yml'      : '',
        \ 'yaml'     : '',
        \ 'toml'     : '',
        \ 'bat'      : '',
        \ 'jpg'      : '',
        \ 'jpeg'     : '',
        \ 'bmp'      : '',
        \ 'png'      : '',
        \ 'webp'     : '',
        \ 'gif'      : '',
        \ 'ico'      : '',
        \ 'twig'     : '',
        \ 'cpp'      : '',
        \ 'c++'      : '',
        \ 'cxx'      : '',
        \ 'cc'       : '',
        \ 'cp'       : '',
        \ 'c'        : '',
        \ 'cs'       : '',
        \ 'h'        : '',
        \ 'hh'       : '',
        \ 'hpp'      : '',
        \ 'hxx'      : '',
        \ 'hs'       : '',
        \ 'lhs'      : '',
        \ 'nix'      : '',
        \ 'lua'      : '',
        \ 'java'     : '',
        \ 'sh'       : '',
        \ 'fish'     : '',
        \ 'bash'     : '',
        \ 'zsh'      : '',
        \ 'ksh'      : '',
        \ 'csh'      : '',
        \ 'awk'      : '',
        \ 'ps1'      : '',
        \ 'ml'       : 'λ',
        \ 'mli'      : 'λ',
        \ 'diff'     : '',
        \ 'db'       : '',
        \ 'sql'      : '',
        \ 'dump'     : '',
        \ 'clj'      : '',
        \ 'cljc'     : '',
        \ 'cljs'     : '',
        \ 'edn'      : '',
        \ 'scala'    : '',
        \ 'go'       : '',
        \ 'dart'     : '',
        \ 'xul'      : '',
        \ 'sln'      : '',
        \ 'suo'      : '',
        \ 'pl'       : '',
        \ 'pm'       : '',
        \ 't'        : '',
        \ 'rss'      : '',
        \ 'f#'       : '',
        \ 'fsscript' : '',
        \ 'fsx'      : '',
        \ 'fs'       : '',
        \ 'fsi'      : '',
        \ 'rs'       : '',
        \ 'rlib'     : '',
        \ 'd'        : '',
        \ 'erl'      : '',
        \ 'hrl'      : '',
        \ 'ex'       : '',
        \ 'exs'      : '',
        \ 'eex'      : '',
        \ 'leex'     : '',
        \ 'vim'      : '',
        \ 'ai'       : '',
        \ 'psd'      : '',
        \ 'psb'      : '',
        \ 'ts'       : '',
        \ 'tsx'      : '',
        \ 'jl'       : '',
        \ 'pp'       : '',
        \ 'vue'      : '﵂',
        \ 'elm'      : '',
        \ 'swift'    : '',
        \ 'xcplayground' : '',
        \ 'tex'      : 'ﭨ',
        \ 'r'        : 'ﳒ',
        \ 'rproj'    : '鉶'
        \}
"et statusline=
"et statusline+=%0*\ %{g:currentmode[mode()]}
"et statusline+=%1*\ %t\                                "File+path
"et statusline+=%2*\ %y\                                  "FileType
"et statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
"et statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
"et statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
"et statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
"et statusline+=%9*\ col:%03c\                            "Colnr
"et statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

hi User1 ctermfg=235  ctermbg=154 cterm=bold  
hi User2 ctermfg=235  ctermbg=39  cterm=bold
hi User3 ctermfg=235  ctermbg=170 cterm=bold
hi User4 ctermfg=235  ctermbg=204 cterm=bold
hi User5 ctermfg=white  
"hi User5 ctermfg=  ctermbg=
hi User6 ctermfg=235  ctermbg=145 
hi User7 ctermfg=114  ctermbg=236 

function! g:Active() abort
    let l:mode = mode()
    let l:statusline = get(s:currentmode, l:mode, "%1*")[0]  
    let l:statusline.= get(s:currentmode, l:mode, " NORMAL ")[1] 
    let l:statusline.= "%#LineNr#%7*  %t  %5*%="
    let l:statusline.= "%5* [%{toupper(&filetype)} " . get(s:file_node_extensions, &filetype, '') . " ] [Debian  ] [%p%%] "
    return l:statusline
endfunction

function! s:StatusLine(active) abort
    if &buftype ==# 'nofile' || &filetype ==# 'netrw'
        " Likely a file explorer.
        setlocal statusline=%0*\ \%m\
"	setlocal statusline=
    elseif &buftype ==# 'nowrite'
        " Don't set a custom status line for certain special windows.
        return
    elseif a:active == 1
        setlocal statusline=%!g:Active()
    else
        setlocal statusline="%6* INACTIVE "
    endif
endfunction

autocmd WinEnter,BufWinEnter  * call s:StatusLine(1)
autocmd WinLeave              * call s:StatusLine(0)
if exists('##CmdlineEnter')
   autocmd CmdlineEnter      * call s:StatusLine(1) | redraw
endif

inoremap <expr> <Tab> TabComplete()
fun! TabComplete()
    if getline('.')[col('.') - 2] =~ '\K' || pumvisible()
        return "\<C-P>"
    else
        return "\<Tab>"
    endif
endfun

" Minimalist-AutoCompletePop-Plugin
set completeopt=menu,menuone,noinsert
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"
autocmd InsertCharPre * call AutoComplete()
fun! AutoComplete()
    if v:char =~ '\K'
        \ && getline('.')[col('.') - 4] !~ '\K'
        \ && getline('.')[col('.') - 3] =~ '\K'
        \ && getline('.')[col('.') - 2] =~ '\K' " last char
        \ && getline('.')[col('.') - 1] !~ '\K'

        call feedkeys("\<C-P>", 'n')
    end
endfun

set omnifunc=syntaxcomplete#Complete

set backspace=indent,eol,start

"Auto brackets
"inoremap " ""<left>
"inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"
"inoremap ' ''<left>
"inoremap <expr> " strpart(getline('.'), col('.')-1, 1) == "\"" ? "\<Right>" : "\"\"\<Left>"
"inoremap ( ()<left>
"inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
"inoremap [ []<left>
"inoremap <expr> ]  strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"
"inoremap { {}<left>
"inoremap <expr> {  strpart(getline('.'), col('.')-1, 1) == "{" ? "\<Right>" : "{"
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


function! NetrwOpenMultiTab(current_line,...) range
   " Get the number of lines.
   let n_lines =  a:lastline - a:firstline + 1

   " This is the command to be built up.
   let command = "normal "

   " Iterator.
   let i = 1

   " Virtually iterate over each line and build the command.
   while i < n_lines
      let command .= "tgT:" . ( a:firstline + i ) . "\<CR>:+tabmove\<CR>"
      let i += 1
   endwhile
   let command .= "tgT"

   " Restore the Explore tab position.
   if i != 1
      let command .= ":tabmove -" . ( n_lines - 1 ) . "\<CR>"
   endif

   " Restore the previous cursor line.
   let command .= ":" . a:current_line  . "\<CR>"

   " Check function arguments
   if a:0 > 0
      if a:1 > 0 && a:1 <= n_lines
         " The current tab is for the nth file.
         let command .= ( tabpagenr() + a:1 ) . "gt"
      else
         " The current tab is for the last selected file.
         let command .= (tabpagenr() + n_lines) . "gt"
      endif
   endif
   " The current tab is for the Explore tab by default.

   " Execute the custom command.
   execute command
endfunction

" Define mappings.
augroup NetrwOpenMultiTabGroup
   autocmd!
   autocmd Filetype netrw vnoremap <buffer> <silent> <expr> t ":call NetrwOpenMultiTab(" . line(".") . "," . "v:count)\<CR>"
   autocmd Filetype netrw vnoremap <buffer> <silent> <expr> T ":call NetrwOpenMultiTab(" . line(".") . "," . (( v:count == 0) ? '' : v:count) . ")\<CR>"
augroup END

"autocmd VimLeave * call system("xclip -o | xclip -selection c")
"autocmd BufEnter * set noro

nnoremap <A-H> :Hexmode<CR>
inoremap <A-H> <Esc>:Hexmode<CR>
"vnoremap <C-H> :<C-U>Hexmode<CR>
command -bar Hex call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    silent :e " this will reload the file without trickeries 
              "(DOS line endings will be shown entirely )
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modifieon
endfunction

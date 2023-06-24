let g:iabbrev_list = { 
      \ 'abs': 'abstract',
      \ 'scu': 'setClassUnion',
      \ 'sg': 'setGeneric',
      \ 'sgg': 'standardGeneric',
      \ 'sm': 'setMethod',
      \ 'srm': 'setReplaceMethod',
      \ 'sc': 'setClass',
      \ 'pp': '%<>%',
      \ 'rep': 'representation',
      \ 'ct': 'contains',
      \ 'pt': 'prototype',
      \ 'si': 'setValidity',
      \ '2ex': '@export',
      \ '2exc': '@exportClass class',
      \ '2exm': '@exportMethod generic',
      \ '2exp': '@exportPattern pattern',
      \ '2im': '@import package',
      \ '2imc': '@importClassesFrom package class',
      \ '2imf': '@importFrom',
      \ '2imm': '@importMethodsFrom package generic',
      \ '3des': '@description',
      \ '3det': '@details',
      \ '9example': '@example path',
      \ '9examples': '@examples',
      \ '3exai': '@examplesIf condition',
      \ '9nord': '@noRd',
      \ '1p': '@param name description',
      \ '9rawrd': '@rawRd rd',
      \ '9return': '@return description',
      \ '9returns': '@returns description',
      \ '9title': '@title title',
      \ '9usage': '@usage {function_call(arg1, arg2 = default, ...)}',
      \ '9md': '@md',
      \ 'nomd': '@noMd',
      \ '9section': '@section {section title}:',
      \ '9field': '@field name description',
      \ '9format': '@format description',
      \ '9method': '@method generic class',
      \ '9slot': '@slot name description',
      \ '9source': '@source description',
      \ '4desci': '@describeIn destination description'
      \ }

iabbrev ;;; assign("test", , .GlobalEnv)<esc>F,i

let r_indent_align_args = 0
let @s='?if (wwvb%hygistop("p==j'


" R script
iabbrev mda [annotation]: -----------------------------------------
iabbrev pp %>%
iabbrev vv <-
iabbrev ff function(){}<ESC>
iabbrev asss assign("envir_meta", environment(), parent.env(environment()))
iabbrev pbl pbapply::pblapply<ESC>
iabbrev pbs pbapply::pbsapply<ESC>
iabbrev pbm pbapply::pbmapply<ESC>
iabbrev pba pbapply::pbapply<ESC>
iabbrev ii %in%
iabbrev kbl knitr::kable(data, format = "markdown", caption = "")<esc>b

vnoremap ;cu :s/#\'[^a-z]\{0,1\}//g<CR>
vnoremap ;cc :s/^/#\' /g<CR>

" nnoremap ;r :read !Rscript ~/.vim/after/ftplugin/r/
nnoremap ;r :Rinsert 
nnoremap <Left>r :RSend roxygen2::roxygenize("..")
nnoremap <Left><Left> :RSend devtools::load_all("~/utils.tool")
nnoremap <Left>e :RSend devtools::load_all("~/exMCnebula2")
nnoremap <Left>m :RSend devtools::load_all("~/MCnebula2")
nnoremap <Left>t :RSend source("~/.vim/after/ftplugin/r/initialize2.R")
nnoremap <Right> :RSend source("~/.vim/after/ftplugin/r/initialize.R")
nnoremap ;pdf :!R CMD Rd2pdf --title="MCnebula2" -o ../reference.pdf ..
nnoremap ;epdf :!R CMD Rd2pdf --title="exMCnebula2" -o ../reference.pdf ..

tnoremap <Tab> <Tab>

" nnoremap ;r mr/## ========== Run block ========== <CR>
inoremap ;i <C-R>=Get_args(1)<CR><C-w><C-R>=Iabbrev_echo()<CR>
inoremap <silent> ;j <C-R>=Get_args(2)<CR><C-o>d2b<Backspace><C-R>=Fast_print()<CR><Esc>bF)
inoremap <silent> ;m <C-R>=Get_args(2)<CR><C-o>d2b<Backspace><C-R>=Fast_print()<CR><Esc>2kf"
iabbrev cc <<<>>><Esc>2h

function! Get_args(args)
  let l:str_line = getline(".")
  let l:str_before = strpart(l:str_line, 0, col('.') - 1)
  let l:str_args = split(str_before, " ")
  if a:args == 2
    if len(l:str_args) >= 2
      let g:str_ARGs_1 = str_args[-2]
      let g:str_ARGs_2 = str_args[-1]
    else
      let g:str_ARGs_1 = "ERROR"
    endif
  else 
    let g:str_ARGs = str_args[-1]
  endif
  return ""
endfunction
" ## ------------------------------------- 
function! Iabbrev_echo()
  let l:str = g:str_ARGs
  " let l:fun = 'FunEx' . matchstr(str, '[0-9].')
  " let l:fun = g:iabbrev_funex[l:fun]
  let l:res = eval("FunEx_normal" . "(str)")
  return l:res
endfunction

" source ~/.vim/after/ftplugin/r/FunEx.vim
" ## ------------------------------------- 
function! Fast_print()

  let l:arg1 = g:str_ARGs_1
  let l:arg2 = g:str_ARGs_2
  let l:fun = "Fun" . matchstr(arg1, "[0-9].")
  let l:fun = g:iabbrev_fun[l:fun]
  let l:res = eval(l:fun . "(arg1, arg2)")

  return l:res
endfunction

function! Custom_send_p()
  tabmove 0
  execute "normal {"
  let line_start = line(".")
  execute "normal }"
  let line_end = line(".")
  let lines = getline(line_start, line_end)
  call RSourceLines(l:lines, "echo", "NewtabInsert")
  call Tab_org()
endfunction

function! Custom_send_l()
  tabmove 0
  let lines = ['' , getline("."), '']
  call RSourceLines(l:lines, "echo", "NewtabInsert")
  call Tab_org()
endfunction

function! Custom_send_rblock()
  let line = getline(".")
  if line != ""
    execute "normal {"
  endif
  call search("rblock({", "", line("$"))
  execute "normal f{%a, F"
  "
  execute "normal {"
  let line_start = line(".")
  execute "normal }"
  let line_end = line(".")
  let lines = getline(line_start, line_end)
  call RSourceLines(l:lines, "echo")
  "
  normal u
  normal }
endfunction

function! Tab_org()
  sleep 100m
  +tabmove
  normal gT
endfunction

nnoremap <Space>p :call Custom_send_p()
nnoremap <Space>l :call Custom_send_l()
nnoremap <Space>b :call Custom_send_rblock()<cr>

" autocmd Filetype * AnyFoldActivate

function! Custom_send_comment()
  let start = search("^\\s*#\\|^\\s*$", "bn", 0)
  let end = search("^\\s*#\\|^\\s*$", "n", line("$"))
  let lines = getline(start, end)
  call RSourceLines(l:lines, "echo")
endfunction

nnoremap <Space><Space> :call Custom_send_comment()

function! Pretty_function()
  let i = search("<-", "n", line("."))
  if l:i > 0
    execute "normal f("
  endif
endfunction
nnoremap <Space>f :call Pretty_function()<cr>f<Space>a<cr><esc>?<-<cr>f(%%a<cr><esc>``i<cr><esc>

function! Custom_send_args()
  let lines = [""] + split(getline("."), ",") + [""]
  call RSourceLines(l:lines, "echo")
endfunction

nnoremap <Space>a :call Custom_send_args()

nnoremap <C-k> f)%%x``hdiwx
inoremap <C-l> <Esc>f)x;

vnoremap <C-f> :call Fix_string()<cr>:call Fix_string_aft()<cr>
nnoremap <C-f> :call Fix_string_pre()<cr>
function! Fix_string_pre()
  call search("c(", "b", 0)
  execute "normal f(v%gq"
  call search("c(", "b", 0)
  s/c(/c(/
  execute "normal ``f(%"
  s/),\s*$/),/
  ?^\s*c(
  /^\s*[a-zA-Z0-9()]
  let start = line(".")
  /^\s*),\s*$
  let end = line(".") - 1
  call cursor(start, 1)
  normal v
  call cursor(end, 1)
endfunction

function! Fix_string()
  s/\v^\s*/&\"/g
  s/\v\s*$/\",/g
endfunction

function! Fix_string_aft()
  ?\sc(
  execute "normal gJb%bJhx=%"
endfunction


function! Fix_string_ex()
  s/\v^[^\"]*//g
  s/\v\s*$/,/g
endfunction

function! Delete_comment()
  %s/\v^\s*##.*//g
  g/\v^\s*$/d
endfunction

let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'c:Classes',
        \ 'g:Generics',
        \ 'm:Methods',
        \ 'r:ReplaceMethods',
        \ 'f:Functions',
        \ 'v:FunctionVariables',
    \ ]
\ }

function! Pretty_equa()
  s/\v(\s)@!\=(\s)@!/ = /g
endfunction

let g:iabbrev_list = { 
      \ 'abs': 'abstract',
      \ 'scu': 'setClassUnion',
      \ 'sg': 'setGeneric',
      \ 'sgg': 'standardGeneric',
      \ 'sm': 'setMethod',
      \ 'srm': 'setReplaceMethod',
      \ 'sc': 'setClass',
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
" R script
iabbrev mda [annotation]: -----------------------------------------
iabbrev pp %>%
iabbrev vv <-
iabbrev ff function(){}<ESC>
iabbrev env environment(),
iabbrev asss assign("envir_meta", environment(), parent.env(environment()))
iabbrev pbl pbapply::pblapply<ESC>
iabbrev pbs pbapply::pbsapply<ESC>
iabbrev pbm pbapply::pbmapply<ESC>
iabbrev pba pbapply::pbapply<ESC>
iabbrev ii %in%
" ## ---------------------------------------------------------------------- 
vnoremap ;cu :s/#\'[^a-z]\{0,1\}//g<CR>
vnoremap ;cc :s/^/#\' /g<CR>
" ## ---------------------------------------------------------------------- 
nnoremap ;r :read !Rscript ~/.vim/after/ftplugin/r/
" ## ---------------------------------------------------------------------- 
" nnoremap ;r mr/## ========== Run block ========== <CR>
inoremap ;i <C-R>=Get_args(1)<CR><C-w><C-R>=Iabbrev_echo()<CR>
inoremap <silent> ;j <C-R>=Get_args(2)<CR><C-o>d2b<Backspace><C-R>=Fast_print()<CR><Esc>bF)
" inoremap <silent> ;r <C-R>=Get_args(2)<CR><C-o>d2b<Backspace><C-R>=Fast_print()<CR><Esc>3kf)
inoremap <silent> ;m <C-R>=Get_args(2)<CR><C-o>d2b<Backspace><C-R>=Fast_print()<CR><Esc>2kf"
" ## ------------------------------------- 
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

" source ~/.vim/after/ftplugin/java/Fun.vim


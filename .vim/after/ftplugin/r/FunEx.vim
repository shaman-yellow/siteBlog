let g:iabbrev_funex = {
      \ 'FunEx': 'FunEx_normal'
      \ }

function! FunEx_normal(str)
  if has_key(g:iabbrev_list, a:str)
    let l:res = g:iabbrev_list[a:str]
  else
    let l:res = a:str
  endif
  return l:res
endfunction

inoremap ;d <C-R>=FunEx_as_description()<CR><Esc>ka
function! FunEx_as_description()
  let l:res = "# ==========================================================================" .
        \ "\n" .
        \ "# " .
        \ "\n" .
        \ "# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -"
  return l:res
endfunction

inoremap ;cc <C-R>=FunEx_md_comment()<CR>
function! FunEx_md_comment()
  let l:res = "#' "
  return l:res
endfunction

inoremap ;cr <C-R>=FunEx_md_code()<CR><Esc>
function! FunEx_md_code()
  let l:res = "#+ eval = F, echo = F"
  return l:res
endfunction

inoremap ;ct <C-R>=FunEx_md_title()<CR><Esc><End>a
function! FunEx_md_title()
  let l:res = "#' ---" .
        \ "\n" .
        \ "#' title: " .
        \ "\n" .
        \ "#' output:" .
        \ "\n" .
        \ "#'   pdf_document" .
        \ "\n" .
        \ "#' ---"
  return l:res
endfunction



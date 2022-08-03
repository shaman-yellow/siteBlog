let g:iabbrev_fun = {
      \ 'Fun': 'Fun_new_normal',
      \ 'Fun2a': 'Fun_new_array',
      \ 'Fun2l': 'Fun_new_list_type'
      \ }

function! Fun_new_normal(arg1, arg2)
  if has_key(g:iabbrev_list, a:arg1)
    let l:res = g:iabbrev_list[a:arg1] . " " . a:arg2 . " = " . "new " . 
          \ g:iabbrev_list[a:arg1] . "()"
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

" ## ------------------------------------- 
function! Fun_new_array(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "2.*", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] . " " . a:arg2 . "[] = " . "new " .
          \ g:iabbrev_list[l:arg1] . "[]"
    return res
  else
    return ""
  endif
endfunction
" ## ------------------------------------- 

function! Fun_new_list_type(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "2.*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "2.*"), "2.", "", "")

  let l:type = "<"
  for i in range(0, strchars(objs) - 1)

    if i != 0
      let l:type = l:type . ','
    endif

    let l:obj = strpart(objs, i, 1)
    if has_key(g:obj_type, obj)
      let l:type = l:type . g:obj_type[l:obj]
    else
      return ""
    endif
  endfor
  let l:type = l:type . ">"

  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] . l:type . " " . a:arg2 . " = " . "new " .
          \ g:iabbrev_list[l:arg1] . l:type. "()"
    return res
  else
    return ""
  endif
endfunction


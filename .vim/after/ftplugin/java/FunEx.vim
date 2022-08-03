let g:iabbrev_funex = {
      \ 'FunEx': 'FunEx_normal',
      \ 'FunEx2l': 'FunEx_list_type'
      \ }

function! FunEx_normal(str)
  if has_key(g:iabbrev_list, a:str)
    let l:res = g:iabbrev_list[a:str]
  else
    let l:res = a:str
  endif
  return l:res
endfunction

function! FunEx_list_type(arg1)
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
    let l:res = g:iabbrev_list[l:arg1] . l:type
    return res
  else
    return ""
  endif
endfunction


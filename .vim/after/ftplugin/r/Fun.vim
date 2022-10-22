let g:iabbrev_fun = {
      \ 'Fun': 'Fun_new_normal',
      \ 'Fun2g': 'Fun_setGeneric',
      \ 'Fun2v': 'Fun_normal_replace',
      \ 'Fun2c': 'Fun_setClass',
      \ 'Fun2m': 'Fun_setMethod',
      \ 'Fun2n': 'Fun_setMethod_mutate',
      \ 'Fun2r': 'Fun_setReplaceMethod',
      \ 'Fun2i': 'Fun_setValidity',
      \ 'Fun2s': 'Fun_show_object',
      \ 'Fun3c': 'Roxy_class',
      \ 'Fun3m': 'Roxy_method',
      \ 'Fun3g': 'Roxy_getter'
      \ }

function! Fun_new_normal(arg1, arg2)
  if has_key(g:iabbrev_list, a:arg1)
    let l:res = g:iabbrev_list[a:arg1] . '("'. a:arg2 . '", ' .
          \ "\n" .
          \ 'function(x) standardGeneric("' .
          \ a:arg2 . '")' .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

function! Fun_setGeneric(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "[0-9].*"), "[0-9].", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "signature = " .
          \ 'c('. l:objs . ' = "x"),' .
          \ "\n" .
          \ 'function(x) standardGeneric("' .
          \ a:arg2 . '")' .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction


function! Fun_normal_replace(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] . '("'. a:arg2 . '<-", ' .
          \ "\n" .
          \ 'function(x, value) standardGeneric("' .
          \ a:arg2 . '<-")' .
          \ ')'
    return res
  else
    return ""
  endif
endfunction

function! Fun_setClass(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ 'contains = character(),' .
          \ "\n" .
          \ "representation = \nrepresentation(\n)," .
          \ "\n" .
          \ "prototype = NULL" .
          \ "\n" .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

function! Fun_setMethod(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "[0-9].*"), "[0-9].", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "signature = " .
          \ 'c(x = "' . l:objs . '"),' .
          \ "\n" .
          \ "function(x){}" .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

function! Fun_setMethod_mutate(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "[0-9].*"), "[0-9].", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "signature = " .
          \ 'setMissing(' .
          \ '"'. a:arg2 . '",' .
          \ "\n" .
          \ 'x = "' . l:objs . '"),' .
          \ "\n" .
          \ "function(x){}" .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction



function! Fun_setReplaceMethod(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "[0-9].*"), "[0-9].", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "signature = " .
          \ 'c(x = "' . l:objs . '"),' .
          \ "\n" .
          \ "function(x, value){\n" .
          \ "initialize(x, " . a:arg2 . " = value)" .
          \ "\n" .
          \ '})'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

function! Fun_setValidity(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "function(object){\n" .
          \ "\n" .
          \ '})'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction

function! Fun_show_object(arg1, arg2)
  let l:arg1 = substitute(a:arg1, "[0-9].*", "", "")
  let l:objs = substitute(matchstr(a:arg1, "[0-9].*"), "[0-9].", "", "")
  if has_key(g:iabbrev_list, l:arg1)
    let l:res = g:iabbrev_list[l:arg1] .
          \ '("'. a:arg2 . '", ' .
          \ "\n" .
          \ "signature = " .
          \ 'c(object = "' . l:objs . '"),' .
          \ "\n" .
          \ "function(object){" .
          \ "\n" .
          \ ".show(object)" .
          \ "\n" .
          \ "}" .
          \ ')'
  else
    let l:res = a:arg1 . " " . a:arg2 . " = " . "new " . 
          \ a:arg1 . "()"
  endif
  return res
endfunction


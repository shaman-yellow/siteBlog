" # ==========================================================================
" # for class
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_class(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  let l:res = eval("Roxy_class" . "_" . l:control . "(a:arg1, a:arg2)")
  return res
endfunction

function! Roxy_class_v(arg1, arg2)
  " let l:arg1 = substitute(a:arg1, '[0-9].*', '', '')
  " let l:objs = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  let l:res = "#' @aliases VIRTUAL_" . a:arg2 . " " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @title " . "Share slots and methods for classes inherite from VIRTUAL_dataset\n" .
        \ "#'" . "\n" .
        \ "#' @description " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @family " . a:arg2 . "s\n" .
        \ "#'" . "\n" .
        \ "#' @slot " . a:arg2 . " ...\n" .
        \ "#'" . "\n" .
        \ "#' @rdname " . "VIRTUAL_" . a:arg2 . "-class"
  return res
endfunction

function! Roxy_class_c(arg1, arg2)
  " let l:arg1 = substitute(a:arg1, '[0-9].*', '', '')
  " let l:objs = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  let l:res = "#' @exportClass " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @title " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @description " . "...\n" .
        \ "#'" . "\n" .
        \ "# @family " . a:arg2 . "s\n" .
        \ "#' @seealso [fun()]\n".
        \ "#'" . "\n" .
        \ "#' @slot " . "slot ...\n" .
        \ "#'" . "\n" .
        \ "#' @rdname " . a:arg2 . "-class\n" .
        \ "#'" . "\n" .
        \ "#' @examples\n" .
        \ "#' \\dontrun{\n" .
        \ "#' new('" . a:arg2 . "', ...)\n" .
        \ "#' }"
  return res
endfunction

" # ==========================================================================
" # for getter
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_getter(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  let l:res = eval("Roxy_getter" . "_" . l:control . "(a:arg1, a:arg2)")
  return res
endfunction

function! Roxy_getter_g(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description \\code{" . a:arg2 . "}, \\code{" . a:arg2 . "<-}: " .
        \ "getter and setter\n" .
        \ "#' for the \\code{" . a:arg2 . "} slot of the object.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_ge(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description \\code{" . a:arg2 . "} getter \n" .
        \ "#' for the \\code{" . a:arg2 . "} slot of the object.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_s(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "<-\n" .
        \ "#' @aliases " . a:arg2 . "<-\n" .
        \ "#' @param value The value for the slot.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

" # ==========================================================================
" # for method
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_method(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  let l:res = eval("Roxy_method" . "_" . l:control . "(a:arg1, a:arg2)")
  return res
endfunction

function! Roxy_method_m(arg1, arg2)
  " let l:arg1 = substitute(a:arg1, '[0-9].*', '', '')
  " let l:objs = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @title " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @description " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @details " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @param param ...\n" .
        \ "#'" . "\n" .
        \ "# @inheritParams rdname\n" .
        \ "#'" . "\n" .
        \ "#' @return ...\n" .
        \ "#'" . "\n" .
        \ "#' @seealso [fun()]\n".
        \ "#'" . "\n" .
        \ "#' @rdname " . a:arg2 . "-methods\n" .
        \ "#'" . "\n" .
        \ "#' @examples\n" .
        \ "#' \\dontrun{\n" .
        \ "#' " . a:arg2 . "(...)\n" .
        \ "#' }"
  return res
endfunction

function! Roxy_method_n(arg1, arg2)
  " let l:arg1 = substitute(a:arg1, '[0-9].*', '', '')
  " let l:objs = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @description " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @param param ...\n" .
        \ "#'" . "\n" .
        \ "#' @return ...\n" .
        \ "#'" . "\n" .
        \ "#' @seealso [fun()]\n".
        \ "#'" . "\n" .
        \ "#' @rdname " . a:arg2 . "-methods\n" .
        \ "#'" . "\n" .
        \ "#' @examples\n" .
        \ "#' \\dontrun{\n" .
        \ "#' " . a:arg2 . "(...)\n" .
        \ "#' }"
  return res
endfunction



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
        \ "#' @title " . "Share slots and methods for classes inherite from VIRTUAL_" .
        \ a:arg2 . "\n" .
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
        \ "#'" . "\n" .
        \ "# @seealso \\code{\\link{<class>-class}}\n" .
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

function! Roxy_class_n(arg1, arg2)
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
" # for getter or inside class method
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_getter(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  if stridx(l:control, "ggl") == 0
    let l:arg3 = strcharpart(l:control, 3)
    let l:res = eval("Roxy_getter_ggl" . "(a:arg1, a:arg2, l:arg3)")
    return res
  endif
  if stridx(l:control, "ggs") == 0
    let l:arg3 = strcharpart(l:control, 3)
    let l:res = eval("Roxy_getter_ggs" . "(a:arg1, a:arg2, l:arg3)")
    return res
  endif
  if stridx(l:control, "gg") == 0
    let l:arg3 = strcharpart(l:control, 2)
    let l:res = eval("Roxy_getter_gg" . "(a:arg1, a:arg2, l:arg3)")
    return res
  endif
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

function! Roxy_getter_part(arg1, arg2)
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

function! Roxy_getter_gg(arg1, arg2, arg3)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description  \\code{" . a:arg2 . "}: fast channel to obtain\n" .
        \ "#' the downstream slot, getter\n" .
        \ "#' for the \\code{" . a:arg2 . "} slot in sub-object\n" .
        \ "#' of \\code{" . a:arg3 . "} slot of the object. Equals:\n" .
        \ "#' - \\code{" . a:arg2 . "(" . a:arg3 . "(object)" . ")" . "}\n" .
        \ "#' - \\code{" . a:arg2 . "(object)" . "}.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_ggl(arg1, arg2, arg3)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description  \\code{" . a:arg2 . "}: fast channel to obtain\n" .
        \ "#' data (mostly 'tbl' or 'data.frame') inside the downstream slot ('list'), getter\n" .
        \ "#' for the data named \\code{" . a:arg2 . "} in\n" .
        \ "#' \\code{reference} slot (a 'list') in sub-object\n" .
        \ "#' of \\code{" . a:arg3 . "} slot of the object. Equals:\n" .
        \ "#' - \\code{reference(" . a:arg3 . "(object)" . ")$" . a:arg2 . "}\n" .
        \ "#' - \\code{" . a:arg2 . "(object)" . "}.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_ggs(arg1, arg2, arg3)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "<-\n" .
        \ "#' @aliases " . a:arg2 . "<-\n" .
        \ "#' @description  \\code{" . a:arg2 . "<-}: fast channel to replace\n" .
        \ "#' data (mostly 'tbl' or 'data.frame') inside the downstream slot ('list'), setter\n" .
        \ "#' for the data named \\code{" . a:arg2 . "} in\n" .
        \ "#' \\code{reference} slot (a 'list') in sub-object\n" .
        \ "#' of \\code{" . a:arg3 . "} slot of the object.\n" .
        \ "#' \\code{reference(" . a:arg3 . "(object)" . ")$" . a:arg2 . "<-}\n" .
        \ "#' similar to \\code{" . a:arg2 . "(object)" . "<-}.\n" .
        \ "#' But the latter not only replace and also validate.\n" .
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

function! Roxy_getter_meth(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description \\code{" . a:arg2 . "}: " .
        \ "...\n" .
        \ "#' @param param ...\n" .
        \ "# @family ...s\n" .
        \ "# @seealso [fun()]\n".
        \ "#' @rdname " . l:class . "-class\n" .
        \ "#' @examples\n" .
        \ "#' \\dontrun{\n" .
        \ "#' " . a:arg2 . "(...)\n" .
        \ "#' }"
  return res
endfunction

function! Roxy_getter_sh(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_def(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @description " . "\\code{" . a:arg2 . "()}: " .
        \ "get the default parameters for the method \\code{" . a:arg2. "}.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

function! Roxy_getter_deff(arg1, arg2)
  let l:class = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:class != ""
    let g:class = l:class
  else
    let l:class = g:class
  endif
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @description " . "\\code{" . a:arg2 . "(x, ...)}: " .
        \ "use the default parameters whatever 'missing'\n" .
        \ "#' while performing the method \\code{" . a:arg2 . "}.\n" .
        \ "#' @rdname " . l:class . "-class"
  return res
endfunction

" # ==========================================================================
" # for method
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_method(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  if stridx(l:control, "ex") == 0
    let l:arg3 = strcharpart(l:control, 2)
    let l:res = eval("Roxy_method_ex" . "(a:arg1, a:arg2, l:arg3)")
    return res
  endif
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
        \ "#' @param param ...\n" .
        \ "#'" . "\n" .
        \ "# @inheritParams rdname\n" .
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
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @title " . "...\n" .
        \ "#' @description " . "...\n" .
        \ "#' @rdname " . a:arg2 . "-methods"
  return res
endfunction

function! Roxy_method_ex(arg1, arg2, arg3)
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @description " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @param param ...\n" .
        \ "#'" . "\n" .
        \ "#' @seealso [fun()]\n".
        \ "#'" . "\n" .
        \ "#' @rdname " . a:arg3 . "-methods\n" .
        \ "#'" . "\n" .
        \ "#' @examples\n" .
        \ "#' \\dontrun{\n" .
        \ "#' " . a:arg2 . "(...)\n" .
        \ "#' }"
  return res
endfunction

function! Roxy_method_def(arg1, arg2)
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @description " . "\\code{" . a:arg2 . "()}: " .
        \ "get the default parameters for the method\n" .
        \ "#' \\code{" . a:arg2. "}.\n" .
        \ "#' @rdname " . a:arg2 . "-methods"
  return res
endfunction

function! Roxy_method_deff(arg1, arg2)
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @description " . "\\code{" . a:arg2 . "(x, ...)}: " .
        \ "use the default parameters whatever 'missing'\n" .
        \ "#' while performing the method \\code{" . a:arg2 . "}.\n" .
        \ "#' @rdname " . a:arg2 . "-methods"
  return res
endfunction

function! Roxy_method_sh(arg1, arg2)
  let l:res = "#' @exportMethod " . a:arg2 . "\n" .
        \ "#' @rdname " . a:arg2 . "-methods"
  return res
endfunction

" # ==========================================================================
" # for NULL
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function! Roxy_null(arg1, arg2)
  let l:control = substitute(a:arg1, '[0-9].*', '', '')
  let l:res = eval("Roxy_null" . "_" . l:control . "(a:arg1, a:arg2)")
  return res
endfunction

function! Roxy_null_n(arg1, arg2)
  let l:fun = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:fun != ""
    let g:fun = l:fun
  else
    let l:fun = g:fun
  endif
  let l:res = "#' @aliases " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @title " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @description ...\n" .
        \ "#'" . "\n" .
        \ "#' @param ... ...\n" .
        \ "#'" . "\n" .
        \ "#' @details ...\n" .
        \ "#'" . "\n" .
        \ "#' @name " . l:fun . "\n" .
        \ "NULL\n" .
        \ "#> NULL"
  return res
endfunction

function! Roxy_null_m(arg1, arg2)
  let l:fun = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:fun != ""
    let g:fun = l:fun
  else
    let l:fun = g:fun
  endif
  let l:res = "#' @aliases " . a:arg2 . "\n" .
        \ "#'" . "\n" .
        \ "#' @title " . "...\n" .
        \ "#'" . "\n" .
        \ "#' @description ...\n" .
        \ "#'" . "\n" .
        \ "#' @details ...\n" .
        \ "#'" . "\n" .
        \ "#' @name " . l:fun . "-methods\n" .
        \ "#'" . "\n" .
        \ "#' @order 1\n" .
        \ "NULL\n" .
        \ "#> NULL"
  return res
endfunction

function! Roxy_null_sh(arg1, arg2)
  let l:fun = substitute(matchstr(a:arg1, '[0-9].*'), '[0-9].', '', '')
  if l:fun != ""
    let g:fun = l:fun
  else
    let l:fun = g:fun
  endif
  let l:res = "#' @export " . a:arg2 . "\n" .
        \ "#' @aliases " . a:arg2 . "\n" .
        \ "#' @description " . "\\code{" . a:arg2  . "}: " . "...\n" .
        \ "#' @rdname " . l:fun
  return res
endfunction

" # ==========================================================================
" # for functions
" # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


let g:iabbrev_list = { 
      \ 'pub': 'public',
      \ 'sta': 'static',
      \ 'priv': 'private',
      \ 'abs': 'abstract',
      \ 'alist': 'ArrayList',
      \ 'datai': 'DataInputStream',
      \ 'datao': 'DataOutputStream',
      \ 'file': 'File',
      \ 'frame': 'Frame',
      \ 'hmap': 'HashMap',
      \ 'im': 'import',
      \ 'impl': 'implements',
      \ 'int': 'int',
      \ 'obj': 'Object',
      \ 'obji': 'ObjectInputStream',
      \ 'objo': 'ObjectOutputStream',
      \ 'pac': 'package',
      \ 'pt': 'pattern',
      \ 'ptcomp': 'Pattern.compile',
      \ 'pwri': 'PrintWriter',
      \ 'randf': 'RandomAccessFile',
      \ 'seri': 'Serializable',
      \ 'str': 'String'
      \ }
" java import
iabbrev jimpio import java.io.*;
iabbrev jimput import java.util.*;
iabbrev jimpaw import java.awt.*;
iabbrev jimpsw import java.swing.*;
" ## ------------------------------------- 
" java longwords
" ## ------------------------------------- 
" java collection
" iabbrev jnewa new ArrayList<>();<Esc>b
iabbrev jnewlob ArrayList<Object>  = new ArrayList<Object>();<Esc>7bl
iabbrev jnewlstr ArrayList<String>  = new ArrayList<String>();<Esc>7bl
" hashmap
iabbrev jnewm Map<String, Object> mapSet = new HashMap<String, Object>();<Esc>
iabbrev jnewms Map<String, String> mapSet = new HashMap<String, String>();<Esc>
iabbrev jform for(Object key:mapSet.keySet()){<CR><Esc>
" ## ------------------------------------- 
" java gui
iabbrev jbasegui fr.setSize();<CR>fr.setBackground();<CR>fr.setLayout();<CR>fr.setVisible();<Esc>3k
" ## ------------------------------------- 
" java class
iabbrev jpm public static void main(String[] args) {}<Esc>i<CR><Esc>
iabbrev jpmex public static void main(String[] args) throws Exception {}<Esc>i<CR><Esc>
" ## ------------------------------------- 
" java print
iabbrev jpt System.out.println();<Esc>b
" ## ------------------------------------- 
" java forLoop
iabbrev jfori for(int i = 1; i <= ; i++){<CR>}<Esc>kf;;
iabbrev jfori0 for(int i = 0; i <= ; i++){<CR>}<Esc>kf;;
iabbrev jforj for(int j = 1; j <= ; j++){<CR><Esc>kf;;
" ## ------------------------------------- 
" java object
iabbrev jobji ObjectInputStream in = new ObjectInputStream(new FileInputStream(file));<CR>in.close();<Esc>ko<Esc>
iabbrev jobjo ObjectOutputStream out = new ObjectOutputStream(new FileOutputStream(file));<CR>out.close();<Esc>ko<Esc>
" ## ------------------------------------- 
" java file
iabbrev jprinto PrintWriter out = new PrintWriter();<CR>out.close();<Esc>ko<Esc>k<End>h
iabbrev jdatai DataInputStream in = new DataInputStream(new FileInputStream(file));<CR>in.close();<Esc>ko<Esc>
iabbrev jdatao DataOutputStream out = new DataOutputStream(new FileOutputStream(file));<CR>out.close();<Esc>ko<Esc>
iabbrev jnewrf RandomAccessFile rfile = new RandomAccessFile("", "rw");<Esc>9h
" String text = rfile.readUTF();
" ## ------------------------------------- 
" java string
iabbrev jstrbb StringBuffer();<Esc>b
" ## ------------------------------------- 
" java pattern
iabbrev jptt1 String patternString =;<Esc>b
iabbrev jptt2 Pattern p = Pattern.compile(patternString);<Esc>
iabbrev jptt3 Matcher m = p.matcher();<Esc>b
" ## ---------------------------------------------------------------------- 
" function map
inoremap <silent> ;j <C-R>=Get_args(2)<CR><C-w><C-w><C-R>=Fast_print()<CR><Esc>b
inoremap ;i <C-R>=Get_args(1)<CR><C-w><C-R>=Iabbrev_echo()<CR>
" ## ---------------------------------------------------------------------- 
" function 

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

  if has_key(g:iabbrev_list, l:str)
    let l:res = g:iabbrev_list[l:str]
  else
    let l:res = l:str
  endif

  return l:res
endfunction
" ## ---------------------------------------------------------------------- 
" function
function! Fast_print()

  let l:arg1 = g:str_ARGs_1
  let l:arg2 = g:str_ARGs_2
  let l:fun = "Fun" . matchstr(arg1, "2.*")
  let l:fun = g:iabbrev_fun[l:fun]
  let l:res = eval(l:fun . "(arg1, arg2)")

  let l:str_line = getline(".")
  if match(str_line, ";$") < 0
    let l:res = l:res . ";"
  endif

  return l:res
endfunction

let g:iabbrev_fun = {
      \ 'Fun': 'Fun_new_normal',
      \ 'Fun2a': 'Fun_new_array'
      \ }

" ## ---------------------------------------------------------------------- 
function! Fun_new_normal(arg1, arg2)
  if has_key(g:iabbrev_list, a:arg1)
    let l:res = g:iabbrev_list[a:arg1] . " " . a:arg2 . " = " . "new " . 
          \ g:iabbrev_list[a:arg1] . "()"
    return res
  else
    return ""
  endif
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

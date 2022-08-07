let g:iabbrev_list = { 
      \ 'abs': 'abstract',
      \ 'al': 'ArrayList',
      \ 'alist': 'ArrayList',
      \ 'bf': 'BufferedReader',
      \ 'datai': 'DataInputStream',
      \ 'datao': 'DataOutputStream',
      \ 'ext': 'extends',
      \ 'file': 'File',
      \ 'filer': 'FileReader',
      \ 'frame': 'Frame',
      \ 'hm': 'HashMap',
      \ 'hmap': 'HashMap',
      \ 'im': 'import',
      \ 'impl': 'implements',
      \ 'int': 'int',
      \ 'obj': 'Object',
      \ 'obji': 'ObjectInputStream',
      \ 'objo': 'ObjectOutputStream',
      \ 'pac': 'package',
      \ 'pbc': 'public class',
      \ 'pbs': 'public static',
      \ 'priv': 'private',
      \ 'pt': 'pattern',
      \ 'ptcomp': 'Pattern.compile',
      \ 'pub': 'public',
      \ 'pwri': 'PrintWriter',
      \ 'raf': 'RandomAccessFile',
      \ 'seri': 'Serializable',
      \ 'sta': 'static',
      \ 'strbd': 'StringBuilder',
      \ 'thex': 'throws Exception',
      \ 'str': 'String'
      \ }
let g:ale_java_javac_options = "javac -cp /home/echo/.m2/repository/org/projectlombok/lombok/1.18.18/lombok-1.18.18.jar"
let g:ale_java_javac_executable = "javac -cp /home/echo/.m2/repository/org/projectlombok/lombok/1.18.18/lombok-1.18.18.jar"
" java import
" iabbrev jimpio import java.io.*;
" iabbrev jimput import java.util.*;
" iabbrev jimpaw import java.awt.*;
" iabbrev jimpsw import java.swing.*;
" ## ------------------------------------- 
" java longwords
" ## ------------------------------------- 
" java collection
" hashmap
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
iabbrev jptn System.out.println();<Esc>b
iabbrev jpt System.out.print();<Esc>b
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
iabbrev jbufr BufferedReader in = new BufferedReader(new FileReader(filename));<CR>in.close();<Esc>ko<Esc>
" ## ------------------------------------- 
" java pattern
iabbrev jptt1 String patternString =;<Esc>b
iabbrev jptt2 Pattern p = Pattern.compile(patternString);<Esc>
iabbrev jptt3 Matcher m = p.matcher();<Esc>b
" ## ---------------------------------------------------------------------- 
" function map
inoremap <silent> ;j <C-R>=Get_args(2)<CR><C-w><C-w><C-R>=Fast_print()<CR><Esc>b
inoremap ;i <C-R>=Get_args(1)<CR><C-w><C-R>=Iabbrev_echo()<CR>
inoremap ;; <Esc>A;<Esc>
nnoremap ;j :!cd target/classes/; java workflow.
" ## ------------------------------------- 
nnoremap ;mp :Mvn! clean compile
nnoremap ;m :Mvn! clean
nnoremap ;fj :tabe ~/.vim/after/ftplugin/java.vim
nnoremap ;fjd :tabe ~/.vim/after/ftplugin/java/Fun
nnoremap ;sfj :source ~/.vim/after/ftplugin/java.vim
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

" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
let g:obj_type = {
      \ 'o': 'Object',
      \ 's': 'String',
      \ 'i': 'Integer'
      \ }
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
function! Iabbrev_echo()
  let l:str = g:str_ARGs
  let l:fun = "FunEx" . matchstr(str, "2.")
  let l:fun = g:iabbrev_funex[l:fun]
  let l:res = eval(l:fun . "(str)")
  return l:res
endfunction

source ~/.vim/after/ftplugin/java/FunEx.vim
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" ## ---------------------------------------------------------------------- 
" function
function! Fast_print()

  let l:arg1 = g:str_ARGs_1
  let l:arg2 = g:str_ARGs_2
  let l:fun = "Fun" . matchstr(arg1, "2.")
  let l:fun = g:iabbrev_fun[l:fun]
  let l:res = eval(l:fun . "(arg1, arg2)")

  let l:str_line = getline(".")
  if match(str_line, ";$") < 0
    let l:res = l:res . ";"
  endif

  return l:res
endfunction

source ~/.vim/after/ftplugin/java/Fun.vim
" ## ---------------------------------------------------------------------- 


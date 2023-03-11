" Rmarkdown
iabbrev ctr ## ========== Run block ==========
iabbrev ctas ## ^start_________________________
iabbrev ctae ## $start_________________________
iabbrev stf ## @figure
iabbrev fgr \@ref(fig:)<Left>
iabbrev mdi ## [introduction]
iabbrev msp &emsp;&emsp;
iabbrev nsp &ensp;&ensp;
iabbrev mdc [citation]:
iabbrev ffgr {@fig:}{nolink=True}<Esc>4ba
iabbrev ttbl {@tbl:}{nolink=True}<ESC>4ba
iabbrev doci []{.insertion}<Esc>bba
iabbrev docd []{.deletion}<Esc>bba
iabbrev mdcols ::: columns :::<Esc>bi<CR><CR><Esc>k
iabbrev mdcol :::: column ::::<Esc>bi<CR><CR><Esc>k
iabbrev tt treatment<ESC>
iabbrev txtc \textcolor{}{}<Esc>b
iabbrev incc \includegraphics[height=67mm]{}<Esc>
iabbrev inccn \includegraphics{}<Esc>
iabbrev rr \flushright
iabbrev ll \flushleft
nnoremap ;b :RSend bookdown::render_book("index.Rmd")
inoremap ;t1 # {-}<Esc>bi<Space><esc>i
inoremap ;t2 ## {-}<Esc>bi<Space><esc>i
inoremap ;t3 ## {-}<Esc>bi<Space><esc>i

iabbrev vv <-
iabbrev pp %>%
iabbrev ii %in%

inoremap `t ```{r tab.id = "table<esc>:call TabNum()<cr>a<C-r>=g:rtab<cr>", ft.keepnext = T}<cr><cr>```<esc>ka
inoremap `f ```{r fig<esc>:call FigNum()<cr>a<C-r>=g:rfig<cr>, fig.cap = ""}<cr><cr>```<esc>ka

function! FigNum()
  if exists("g:rfig") == 0
    let g:rfig = 1
  endif
  let g:rfig += 1
  echo g:rfig
  return g:rfig
endfunction

function! TabNum()
  if exists("g:rtab") == 0
    let g:rtab = 1
  endif
  let g:rtab += 1
  echo g:rtab
  return g:rtab
endfunction

nnoremap j gj
nnoremap k gk

set fdm=expr
set foldexpr=getline(v:lnum)=~'^[^#]'

inoremap ;d <C-R>=Metadata_yaml()<CR><Esc>ka
function! Metadata_yaml()
  let l:res = "---" .
        \ "\n" .
        \ "" .
        \ "\n" .
        \ "---"
  return l:res
endfunction



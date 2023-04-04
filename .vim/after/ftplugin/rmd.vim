" Rmarkdown
syn sync fromstart

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

iabbrev htimg <center><img src="" width="100%"></center><esc>^f"

nnoremap ;b :RSend custom_render("index.Rmd")
inoremap ;t1 # {-}<Esc>bi<Space><esc>i
inoremap ;t2 ## {-}<Esc>bi<Space><esc>i
inoremap ;t3 ## {-}<Esc>bi<Space><esc>i
inoremap ;t <C-R>=strftime("%Y-%m-%dT%H:%M:%S+00:00")<CR>

iabbrev rfg \@ref(fig:)<esc>F<space>xf)
iabbrev rtb \@ref(tab:)<esc>F<space>xf)

iabbrev lds <!---BLOCK_LANDSCAPE_START---><cr><cr><!---BLOCK_LANDSCAPE_STOP---><esc>k

" temp function

iabbrev fps - 图\@ref(fig:)注：<esc>bb

noremap <C-f> :call TempFix()<cr>
function! TempFix()
  s/ *"*'* *特征 *'*"* */'Features'/g
  s/子星云/Child-Nebulae/g
  s/父星云|母星云/Parent-Nebula/g
  s/星云指数|星云索引|星云目录/Nebula-Index/g
  s/Stardust类|星尘类/Stardust Classes/g
  s/  $//g
endfunction

" temp function end

iabbrev vv <-
iabbrev pp %>%
iabbrev ii %in%

inoremap `t ```{r tab.id = "table<esc>:call TabNum()<cr>a<C-r>=g:rtab<cr>", ft.keepnext = T}<cr><cr>```<esc>ka
inoremap `f ```{r fig<esc>:call FigNum()<cr>a<C-r>=g:rfig<cr>, echo = F, fig.cap = ""}<cr><cr>```<esc>ka
inoremap `h ```{r eval = T, echo = F, results = "asis"}<cr><cr>```<esc>ka
inoremap `` ```{r}<cr><cr>```<esc>ka
inoremap `i ``<esc>i

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



inoremap <buffer> ;r (req, res) => {<CR><CR>}<esc>ki<tab>
inoremap <buffer> ;R (req, res) => {<CR><CR>}<esc>ki<tab>
nnoremap <buffer> Ö A;<esc>

inoremap <buffer> ;co console.log('')<esc>hi

if exists("g:gui_oni")
  call deoplete#disable()
endif

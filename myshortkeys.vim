" KEYBOARD SHORTCUTS
" Author        : Xavier Rave
" Date          : 27/01/2014
" Compatibility : gvim and vim
" vim:expandtab

" Open next or previous buffer
map <F5>     :bn<CR>
map <S-F5>   :bp<CR>
map <A-F5>   :buffers<CR>

" Open next or previous tab
map <F6>     :tabn<CR>
map <S-F6>   :tabp<CR>
map <A-F6>   :tabs<CR>
map <C-F6>   :tabnew<CR>
map <S-C-F6> :tabclose<CR>


" Go to next or previous item in quicklist
map <F8>     :cn<CR>
map <S-F8>   :cp<CR>
map <A-F8>   :copen<CR>
map <S-A-F8> :cclose<CR>

" Go to previous or next change
map <F9>   g,
map <S-F9> g;
map <A-F9> :changes<CR>

" Go to previous or next jump
map <F10>   <C-O>
map <S-F10> <C-I>
map <A-F10> :jumps

" Resize windows
map <F11>       :resize +1<CR>
map <S-F11>     :resize -1<CR>
map <A-F11>     :vertical resize +1<CR>
map <A-S-F11>   :vertical resize -1<CR>

" Map search backward key (search forward is *)
map µ #

" Vertical navigation on long lines
map <A-DOWN> gj
map <A-UP> gk

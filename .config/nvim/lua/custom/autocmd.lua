vim.cmd [[ 
  augroup KeepCentered
    autocmd!
    autocmd CursorMoved * normal! zz
  augroup END

  " Autoformat
  " augroup _lsp
  "   autocmd!
  "   autocmd BufWritePre * lua vim.lsp.buf.formatting()
  " augroup end

  autocmd CursorHold * echon ''

  autocmd BufLeave,FocusLost * silent! wall
]]

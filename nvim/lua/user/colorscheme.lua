local colorscheme = "everforest"

vim.cmd[[
let g:everforest_background = 'medium'
let g:everforest_enable_italic = 1
" let g:everforest_transparent_background = 1
let g:everforest_current_word = "grey background"

exec 'hi NonText guifg=none'
" exec 'hi normal guibg=none'

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

exec 'hi StatusLine guibg=none'

" exec 'hi ColorColumn ctermbg=lightgrey guibg=lightgrey'
]]

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

vim.cmd[[
exec 'hi NonText guifg=none'
" exec 'hi normal guibg=none'

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

exec 'hi StatusLine guibg=none'

" exec 'hi ColorColumn ctermbg=lightgrey guibg=lightgrey'
]]

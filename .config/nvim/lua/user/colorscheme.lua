-- local colorscheme = "tokyonight"
-- local colorscheme = "nightfly"
local colorscheme = "kanagawa"

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
-- vim.g.tokyonight_italic_comments = true
vim.g.nightflyUnderlineMatchParen = 1
vim.g.nightflyWinSeparator = 2

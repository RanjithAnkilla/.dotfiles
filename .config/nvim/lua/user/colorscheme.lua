local colorscheme = "tokyonight"

vim.cmd[[
" " everforest
" let g:everforest_background = 'medium'
" let g:everforest_enable_italic = 1
" " let g:everforest_transparent_background = 1
" let g:everforest_current_word = "grey background"

exec 'hi NonText guifg=none'
" exec 'hi normal guibg=none'

set fillchars=fold:\ ,vert:\│,eob:\ ,msgsep:‾

exec 'hi StatusLine guibg=none'

" exec 'hi ColorColumn ctermbg=lightgrey guibg=lightgrey'
]]

-- Example config in Lua
-- The theme comes in three styles, storm, a darker variant night and day.
vim.g.tokyonight_style = "storm"
vim.g.tokyonight_italic_functions = true
-- vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }

-- Change the "hint" color to the "orange" color, and make the "error" color bright red
-- vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end

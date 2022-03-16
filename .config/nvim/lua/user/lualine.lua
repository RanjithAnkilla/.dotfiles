local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local status_gps_ok, gps = pcall(require, "nvim-gps")
if not status_gps_ok then
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = true,
  diagnostics_color = {
    error = {fg = '#e07a5f'}, -- Changes diagnostics' error color.
    warn  = {fg = '#f2cc8f'},  -- Changes diagnostics' warn color.
    info  = '',  -- Changes diagnostics' info color.
    hint  = '',  -- Changes diagnostics' hint color.
  },
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = true,
  diff_color = {
    added    = {fg = '#81b29a'},
    modified = {fg = '#f2cc8f'},
    removed  = {fg = '#86abdc'},
  },
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
}

-- local branch = {
--   "branch",
--   icons_enabled = true,
--   icon = "",
-- }

local location = {
  "location",
  padding = 0,
}

local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local persent = math.floor(current_line * 100 / total_lines)
  return tostring('|' .. persent .. '|')
end

-- local spaces = function()
--   return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

local nvim_gps = function()
  local gps_location = gps.get_location()
  if gps_location == "error" then
    return ""
  else
    return gps.get_location()
  end
end

-- local buffers = {
--   'buffers',
--   show_filename_only = true,   -- Shows shortened relative path when set to false.
--   show_modified_status = true, -- Shows indicator when the buffer is modified.
--
--   mode = 0, -- 0: Shows buffer name
--   -- 1: Shows buffer index (bufnr)
--   -- 2: Shows buffer name + buffer index (bufnr)
--
--   max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
--   -- it can also be a function that returns
--   -- the value of `max_length` dynamically.
--   filetype_names = {
--     TelescopePrompt = 'Telescope',
--     dashboard = 'Dashboard',
--     packer = 'Packer',
--     fzf = 'FZF',
--     alpha = 'Alpha'
--   }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
--
--   buffers_color = {
--     -- Same values as the general color option can be used here.
--     active = {fg = '#86abdc', bg = '', gui='bold'},     -- Color for active buffer.
--     inactive = {fg='#6c757d', bg =''}, -- Color for inactive buffer.}
--   }
-- }

lualine.setup {
  options = {
    icons_enabled = true,
    theme = "tokyonight",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
    { nvim_gps, cond = hide_in_width },
    },
    lualine_x = { location, progress, 'branch', diff, diagnostics },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  -- tabline = {
  --   lualine_a = {buffers},
  --   lualine_b = {},
  --   lualine_c = {},
  --   lualine_x = {'branch'},
  --   lualine_y = {diff},
  --   lualine_z = {'tabs'}
  -- },
  extensions = {},
}

---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["]"] = { "<cmd> cnext <CR>", "Quickfix list next" },
    ["["] = { "<cmd> cprevious <CR>", "Quickfix list prev" },
    ["<leader>xa"] = { "<cmd> qa <CR>", "Quite All" },
    ["<leader>xb"] = {
      function()
        require("nvchad.tabufline").close_buffer()
      end,
      "Close buffer",
    },
    ["<leader>xp"] = { "<cmd>!chmod +x %<CR>", "Add Execute Permission to Current File" },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>", "Search & Replace" },
  },
  v = {
    [">"] = { ">gv", "indent" },
    ["J"] = { ":m '>+1<CR>gv=gv", "Move Down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move UP" },
  },
}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find Git Files" },
    ["<leader>fs"] = {
      function()
        require("telescope.builtin").grep_string { search = vim.fn.input "Grep > " }
      end,
      "Search Word",
    },
  },
}

-- Disable mappings
-- local nomap = vim.keymap.del
-- local map = vim.keymap.set

-- nomap("n", "<leader>x")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle undotree"} )

return M

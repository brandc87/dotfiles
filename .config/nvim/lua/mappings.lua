local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }

  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- map leader to space
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<Leader>ve", "<cmd>e $MYVIMRC<CR>")
map("n", "<Leader>vo", "<cmd>e ~/.config/nvim/lua/options.lua<CR>")
map("n", "<Leader>vp", "<cmd>e ~/.config/nvim/lua/plugins.lua<CR>")
map("n", "<Leader>vr", "<cmd>source $MYVIMRC<CR>")

-- plugins
map("n", "<Leader>u", ":PackerSync<CR>")

-- telescope
map("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")
map("n", "<Leader>g", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")
map("n", "<Leader>b", "<cmd>lua require'telescope.builtin'.buffers(require('telescope.themes').get_dropdown({ previewer = false }))<CR>")

-- nvim tree
map("n", "<Leader>e", ":NvimTreeToggle<CR>", { silent = true })

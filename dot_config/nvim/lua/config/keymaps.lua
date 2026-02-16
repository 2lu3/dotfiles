vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- window操作 --
-- split
vim.keymap.set("n", "<leader>v", "<C-w>v", { desc = "Vertical split" })
vim.keymap.set("n", "<leader>s", "<C-w>s", { desc = "Horizontal split" })

-- window move
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Window right" })

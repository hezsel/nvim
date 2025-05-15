vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Oil<CR>")

vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

vim.keymap.set("n", "<leader>s", ":split<cr>")
vim.keymap.set("n", "<leader>d", ":vsplit<cr>")

vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>oo", "<C-w>o")
vim.keymap.set("n", "<leader>w", "<C-w>w")

vim.keymap.set("n", "<leader>b", ":<C-u>call gitblame#echo()<CR>")

vim.keymap.set("n", "<leader>J", ":%!jq<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])


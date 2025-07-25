vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted line down" })
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv", { desc = "Move highlighted line up" })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Remove newline" })
vim.keymap.set({ "n", "v" }, "<C-j>", "<C-d>zz", { desc = "Move page down and center" })
vim.keymap.set({ "n", "v" }, "<C-k>", "<C-u>zz", { desc = "Move page up and center" })
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without losing buffer" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Copy to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without losing buffer" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show lsp info" })
vim.keymap.set("n", "<leader>cc", function()
	vim.cmd("TailwindSortSync")
	require("conform").format({ async = true }, function(err, did_edit)
		if not err and did_edit then
			vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
		end
	end)
end, { desc = "Format code with null-ls" })
vim.keymap.set("n", "<leader>h", "<C-W>h", { desc = "Move to window left" })
vim.keymap.set("n", "<leader>j", "<C-W>j", { desc = "Move to window down" })
vim.keymap.set("n", "<leader>k", "<C-W>k", { desc = "Move to window up" })
vim.keymap.set("n", "<leader>l", "<C-W>l", { desc = "Move to window right" })
vim.keymap.set("n", "<leader>n", "nzz", { desc = "Centered Next" })
vim.keymap.set("n", "<leader>N", "Nzz", { desc = "Centered Prev" })
vim.keymap.set("n", "<leader>t", ":tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>1", "1gt", { desc = "Switch to tab 1" })
vim.keymap.set("n", "<leader>2", "2gt", { desc = "Switch to tab 2" })
vim.keymap.set("n", "<leader>3", "3gt", { desc = "Switch to tab 3" })
vim.keymap.set("n", "<leader>4", "4gt", { desc = "Switch to tab 4" })
vim.keymap.set("n", "<leader>5", "5gt", { desc = "Switch to tab 5" })
vim.keymap.set("n", "<leader>6", "6gt", { desc = "Switch to tab 6" })
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep, { desc = "Telescope search by grep" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "Telescope search git files" })
vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Telescope undo" })
vim.keymap.set("n", "<leader>pv", ":Neotree toggle current<CR>", { desc = "Open Neo-Tree filetree" })

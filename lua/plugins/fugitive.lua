return {
	"tpope/vim-fugitive",
	cmd = {"G", "Git"},
	keys = {
		{"<leader>ga", ":Git fetch --all -p<CR>", desc = "Git fetch all",},
		{"<leader>gl", ":Git pull<CR>", desc = "Git pull",},
	},
}

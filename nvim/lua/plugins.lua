return {
	-- Other plugins...
	{
		"tpope/vim-fugitive",
		"vim-test/vim-test",
		config = function()
			-- Optional: Configure vim-test with key mappings
			vim.cmd([[
        let test#strategy = "neovim"
        nnoremap <leader>tn :TestNearest<CR>
        nnoremap <leader>tf :TestFile<CR>
        nnoremap <leader>ta :TestSuite<CR>
        nnoremap <leader>tl :TestLast<CR>
        nnoremap <leader>tv :TestVisit<CR>
      ]])
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "palantir",
					path = "~/vaults/",
				},
			},
		},
	},
}

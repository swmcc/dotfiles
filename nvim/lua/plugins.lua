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
}

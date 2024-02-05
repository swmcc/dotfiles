-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.swapfile = false

require("telescope").setup({
  defaults = {
    file_ignore_patterns = { "node_modules", ".git", "dist", "build", "tmp" },
  },
})

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.swapfile = false

require("obsidian").setup({
	workspaces = {
		{
			name = "palantir",
			path = "~/vaults/",
		},
	},

	notes_subdir = "notes",

	log_level = vim.log.levels.INFO,

	daily_notes = {
		folder = "notes/dailies",
		swm_tag = "swmswmswmrocks",
		date_format = "%Y-%m-%d",
		alias_format = "%B %-d, %Y",
		default_tags = { "standup" },
		template = "daily.md",
	},

	completion = {
		nvim_cmp = true,
		min_chars = 2,
	},

	mappings = {
		["of"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		-- Toggle check-boxes.
		["<leader>ch"] = {
			action = function()
				return require("obsidian").util.toggle_checkbox()
			end,
			opts = { buffer = true },
		},
		-- Smart action depending on context, either follow link or toggle checkbox.
		["<cr>"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},

	new_notes_location = "notes_subdir",

	-- Optional, customize how note IDs are generated given an optional title.
	---@param title string|?
	---@return string
	note_id_func = function(title)
		-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
		-- In this case a note with the title 'My new note' will be given an ID that looks
		-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
		local suffix = ""
		if title ~= nil then
			-- If title is given, transform it into valid file name.
			suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
		else
			-- If title is nil, just add 4 random uppercase letters to the suffix.
			for _ = 1, 4 do
				suffix = suffix .. string.char(math.random(65, 90))
			end
		end
		return tostring(os.time()) .. "-" .. suffix
	end,

	-- Optional, customize how note file names are generated given the ID, target directory, and title.
	---@param spec { id: string, dir: obsidian.Path, title: string|? }
	---@return string|obsidian.Path The full path to the new note.
	note_path_func = function(spec)
		-- This is equivalent to the default behavior.
		local path = spec.dir / tostring(spec.id)
		return path:with_suffix(".md")
	end,

	-- Optional, customize how wiki links are formatted. You can set this to one of:
	--  * "use_alias_only", e.g. '[[Foo Bar]]'
	--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
	--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
	--  * "use_path_only", e.g. '[[foo-bar.md]]'
	-- Or you can set it to a function that takes a table of options and returns a string, like this:
	wiki_link_func = function(opts)
		return require("obsidian.util").wiki_link_id_prefix(opts)
	end,

	markdown_link_func = function(opts)
		return require("obsidian.util").markdown_link(opts)
	end,

	preferred_link_style = "markdown",

	---@return string
	image_name_func = function()
		return string.format("%s-", os.time())
	end,

	disable_frontmatter = false,

	---@return table
	note_frontmatter_func = function(note)
		-- Add the title of the note as an alias.
		if note.title then
			note:add_alias(note.title)
		end

		local out = { id = note.id, aliases = note.aliases, tags = note.tags }

		if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
			for k, v in pairs(note.metadata) do
				out[k] = v
			end
		end

		return out
	end,

	templates = {
		folder = "templates",
		date_format = "%Y-%m-%d",
		time_format = "%H:%M",
		substitutions = {},
	},

	---@param url string
	follow_url_func = function(url)
		-- Open the URL in the default web browser.
		vim.fn.jobstart({ "open", url }) -- Mac OS
		-- vim.fn.jobstart({"xdg-open", url})  -- linux
	end,

	use_advanced_uri = false,

	open_app_foreground = false,

	picker = {
		name = "telescope.nvim",
		mappings = {
			new = "<C-x>",
			insert_link = "<C-l>",
		},
	},

	sort_by = "modified",
	sort_reversed = true,

	-- Set the maximum number of lines to read from notes on disk when performing certain searches.
	search_max_lines = 1000,

	-- Optional, determines how certain commands open notes. The valid options are:
	-- 1. "current" (the default) - to always open in the current window
	-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
	-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
	open_notes_in = "current",

	-- Optional, define your own callbacks to further customize behavior.
	callbacks = {
		-- Runs at the end of `require("obsidian").setup()`.
		---@param client obsidian.Client
		post_setup = function(client) end,

		-- Runs anytime you enter the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		enter_note = function(client, note) end,

		-- Runs anytime you leave the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		leave_note = function(client, note) end,

		-- Runs right before writing the buffer for a note.
		---@param client obsidian.Client
		---@param note obsidian.Note
		pre_write_note = function(client, note) end,

		-- Runs anytime the workspace is set/changed.
		---@param client obsidian.Client
		---@param workspace obsidian.Workspace
		post_set_workspace = function(client, workspace) end,
	},

	-- Optional, configure additional syntax highlighting / extmarks.
	-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
	ui = {
		enable = true, -- set to false to disable all additional syntax features
		update_debounce = 200, -- update delay after a text change (in milliseconds)
		max_file_length = 5000, -- disable UI features for files with more than this many lines
		-- Define how various check-boxes are displayed
		checkboxes = {
			-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
			[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
			["x"] = { char = "", hl_group = "ObsidianDone" },
			[">"] = { char = "", hl_group = "ObsidianRightArrow" },
			["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
			["!"] = { char = "", hl_group = "ObsidianImportant" },
			-- Replace the above with this if you don't have a patched font:
			-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
			-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

			-- You can also add more custom ones...
		},
		-- Use bullet marks for non-checkbox lists.
		bullets = { char = "•", hl_group = "ObsidianBullet" },
		external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		-- Replace the above with this if you don't have a patched font:
		-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
		reference_text = { hl_group = "ObsidianRefText" },
		highlight_text = { hl_group = "ObsidianHighlightText" },
		tags = { hl_group = "ObsidianTag" },
		block_ids = { hl_group = "ObsidianBlockID" },
		hl_groups = {
			-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
			ObsidianTodo = { bold = true, fg = "#f78c6c" },
			ObsidianDone = { bold = true, fg = "#89ddff" },
			ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
			ObsidianTilde = { bold = true, fg = "#ff5370" },
			ObsidianImportant = { bold = true, fg = "#d73128" },
			ObsidianBullet = { bold = true, fg = "#89ddff" },
			ObsidianRefText = { underline = true, fg = "#c792ea" },
			ObsidianExtLinkIcon = { fg = "#c792ea" },
			ObsidianTag = { italic = true, fg = "#89ddff" },
			ObsidianBlockID = { italic = true, fg = "#89ddff" },
			ObsidianHighlightText = { bg = "#75662e" },
		},
	},

	-- Specify how to handle attachments.
	attachments = {
		-- The default folder to place images in via `:ObsidianPasteImg`.
		-- If this is a relative path it will be interpreted as relative to the vault root.
		-- You can always override this per image by passing a full path to the command instead of just a filename.
		img_folder = "assets/imgs", -- This is the default
		-- A function that determines the text to insert in the note when pasting an image.
		-- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
		-- This is the default implementation.
		---@param client obsidian.Client
		---@param path obsidian.Path the absolute path to the image file
		---@return string
		img_text_func = function(client, path)
			path = client:vault_relative_path(path) or path
			return string.format("![%s](%s)", path.name, path)
		end,
	},
})

require("telescope").setup({
	defaults = {
		prompt_prefix = "> ",
		selection_caret = "> ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				mirror = false,
			},
			vertical = {
				mirror = false,
			},
		},
		file_sorter = require("telescope.sorters").get_fuzzy_file,
		file_ignore_patterns = { "node_modules", ".git", "dist", "build", "tmp" },
		generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
		path_display = { "absolute" },
		winblend = 0,
		border = {},
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
	pickers = {},
	extensions = {},
})

vim.api.nvim_set_keymap("i", "<Tab>", 'copilot#Accept("<Tab>")', { expr = true, noremap = true })

local lspconfig = require("lspconfig")

lspconfig.solargraph.setup({
	cmd = { "nc", "localhost", "7658" },
	flags = {
		debounce_text_changes = 150,
	},
	handlers = {
		["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
			update_in_insert = false,
		}),
	},
	on_attach = function(client, bufnr)
		-- Key mappings and other settings
		local function buf_set_keymap(...)
			vim.api.nvim_buf_set_keymap(bufnr, ...)
		end
		local function buf_set_option(...)
			vim.api.nvim_buf_set_option(bufnr, ...)
		end

		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		-- Mappings.
		local opts = { noremap = true, silent = true }

		-- See `:help vim.lsp.*` for documentation on any of the below functions
		buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
		buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
		buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
		buf_set_keymap("n", "gi", "<Cmd>lua vim.lsp.buf.implementation()<CR>", opts)
		buf_set_keymap("n", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
		buf_set_keymap("n", "<space>wa", "<Cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wr", "<Cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
		buf_set_keymap("n", "<space>wl", "<Cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
		buf_set_keymap("n", "<space>D", "<Cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
		buf_set_keymap("n", "<space>rn", "<Cmd>lua vim.lsp.buf.rename()<CR>", opts)
		buf_set_keymap("n", "<space>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>", opts)
		buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", opts)
		buf_set_keymap("n", "<space>e", "<Cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
		buf_set_keymap("n", "[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
		buf_set_keymap("n", "]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
		buf_set_keymap("n", "<space>q", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
		buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
	end,
	capabilities = vim.lsp.protocol.make_client_capabilities(),
})

vim.api.nvim_set_keymap("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>bd", ":bdelete<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ob", ":ObsidianToday<CR>", { noremap = true, silent = true })

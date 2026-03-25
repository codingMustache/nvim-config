-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
---@module 'lazy'
---@type LazySpec
return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "\\",    ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
		{ "<C-j>", ":Neotree toggle<CR>", desc = "NeoTree toggle", silent = true },
	},
	---@module 'neo-tree'
	---@type neotree.Config
	opts = {
		close_if_last_window = true, -- close neo-tree if it's the last window
		popup_border_style = "rounded",
		enable_git_status = true,
		enable_diagnostics = true,

		default_component_configs = {
			indent = {
				indent_size = 2,
				padding = 1,
				with_markers = true,
				indent_marker = "│",
				last_indent_marker = "⎩",
				highlight = "NeoTreeIndentMarker",
			},
			icon = {
				folder_closed = "📁",
				folder_open = "📂",
				folder_empty = "📪",
				folder_empty_open = "📭",
				use_filtered_colors = true,
				default = "·",
			},
			git_status = {
				symbols = {
					added = "+ ",
					modified = "",
					deleted = "✖ ",
					renamed = "➜ ",
					untracked = "Ⓤ ",
					ignored = "Ⓘ ",
					unstaged = "ⓤ ",
					staged = "⊕",
					conflict = "Ⓧ",
				},
			},
		},

		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					"node_modules",
					".git",
				},
			},
			follow_current_file = {
				enabled = true,   -- highlight the current file automatically
			},
			use_libuv_file_watcher = true, -- auto refresh on file changes
			window = {
				width = 30,
				mappings = {
					["\\"] = "close_window",
					["<C-j>"] = "close_window",
				},
			},
		},

		buffers = {
			follow_current_file = {
				enabled = true,
			},
		},

		source_selector = {
			winbar = false,
			statusline = false,
		},
	},
}

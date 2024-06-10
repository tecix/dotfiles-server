-- vim: ts=2 sts=2 sw=2 et
return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = false,
		ft = "markdown",
		-- event = {
		-- Only load for markdown files
		-- "BufReadPre ~/Vaults/medo/**.md",
		-- "BufNewFile ~/Vaults/medo/**.md",
		-- },
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "medo",
					path = obsidian_vault,
				},
			},
			ui = {
				enable = true,
			},
			templates = {
				folder = "archives/templates",
			},
			daily_notes = {
				folder = "timestamps",
				-- template = "Personal Agile - Daily.md",
			},
			disable_frontmatter = true,
		},
		keys = {
			{ "<leader>od", ":ObsidianDailies<CR>", desc = "Obsidian [D]ailies" },
			{ "<leader>oo", ":ObsidianQuickSwitch<CR>", desc = "[O]bsidian Quick Switch" },
			{ "<leader>op", ":ObsidianOpen<CR>", desc = "[Op]en in Obsidian app" },
			{ "<leader>on", ":ObsidianNew<CR>", desc = "[N]ew note" },
			{ "<leader>os", ":ObsidianSearch<CR>", desc = "[S]earch for notes content" },
			{ "<leader>ot", ":ObsidianToday<CR>", desc = "Open [T]oday note" },
			{ "<leader>ob", ":ObsidianBacklinks<CR>", desc = "Open [B]acklinks" },
		},
	},

	{
		"SidOfc/mkdx",
		vim.keymap.set("n", "<Plug>", "<Plug>(mkdx-indent)", { desc = "Disable mkdx keymap" }),
		vim.keymap.set("n", "<Plug>", "<Plug>(mkdx-unindent)", { desc = "Disable mkdx keymap" }),
	},
}

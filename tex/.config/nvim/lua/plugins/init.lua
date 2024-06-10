-- vim: ts=2 sts=2 sw=2 et
return {
  {
    -- "scottmckendry/cyberdream.nvim",
    -- lazy = false,
    -- priority = 1000,
    -- vim.cmd("colorscheme cyberdream"),
    vim.cmd("colorscheme slate"),
    vim.cmd[[highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE]],
  },
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{ "numToStr/Comment.nvim", opts = {} },

}

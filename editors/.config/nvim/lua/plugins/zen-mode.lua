-- vim: ts=2 sts=2 sw=2 et
return {
    "folke/zen-mode.nvim",
    opts = { 
      window = {
       options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
        },
      },
      plugins = {
        kitty = {
          enabled = true,
          font = "+2", -- font size increment
        },
      },
    },
    keys = {
      {'<leader>tz', ':ZenMode<CR>', desc = 'Toggle [Z]enMode' },
        
    }
}

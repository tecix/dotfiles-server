 return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', 
    init = function()
      vim.opt.timeout = true
      vim.opt.timeoutlen = 500
    end,
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup({
          plugins = {
            presets = {
                operators = false,
                -- motions = false,
              },
          },
          -- triggers_blacklist = {
          --     n = {"d", "y"},
          --  },
     })

    end,
  }

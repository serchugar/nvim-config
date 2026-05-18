---@type LazySpec
return {
  {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    event = "VeryLazy",
    cmd = { "Yazi" },
    dependencies = {
      { "nvim-lua/plenary.nvim", lazy = true },
    },
    ---@type YaziConfig | {}
    opts = {
      open_for_directories = true,
      floating_window_scaling_factor = 1,
      yazi_floating_window_border = "none",
      keymaps = {
        show_help = "<f1>",
      },
    },
    init = function()
      vim.g.loaded_netrwPlugin = 1
    end,
  },

  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        enabled = false,
      },
    },
  },
}

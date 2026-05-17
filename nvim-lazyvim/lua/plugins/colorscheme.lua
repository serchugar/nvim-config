return {
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "warmer",
      colors = {
        -- See: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
        -- For original colors
        black = "#101012",
        bg0 = "#232326", -- Main bg
        bg1 = "#2c2d31", -- CursorLine
        bg2 = "#35363b",
        bg3 = "#37383d",
        bg_d = "#1b1c1e",
        bg_blue = "#68aee8",
        bg_yellow = "#e2c792",
        fg = "#a7aab0",
        purple = "#bb70d2",
        green = "#8fb573",
        orange = "#c49060",
        blue = "#57a5e5",
        yellow = "#dbb671",
        cyan = "#51a8b3",
        red = "#de5d68",
        grey = "#5a5b5e",
        light_grey = "#818387",
        dark_cyan = "#2b5d63",
        dark_red = "#833b3b",
        dark_yellow = "#7c5c20",
        dark_purple = "#79428a",
        diff_add = "#282b26",
        diff_delete = "#2a2626",
        diff_change = "#1a2a37",
        diff_text = "#2c485f",
      },
      highlights = {
        CursorLineNr = { fg = "#00ffe1", fmt = "bold" },
        LineNr = { fg = "#008a7a" },
      },
    },
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}

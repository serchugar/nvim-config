return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "json",
      "yaml",
      "toml",
      "markdown",
      "markdown_inline",
      "regex",

      "bash",
      "powershell",

      "lua",
      "nix",

      "c",
      "zig",
      "python",
    },
  },
}

return {
  "mason-org/mason.nvim",
  opts = {
    ensure_installed = {
      "tree-sitter-cli",

      "stylua", -- Lua
      "lua-language-server",

      "shfmt", -- Bash, shell

      "ruff", -- Python

      "clangd", -- C/C++
    },
  },
}

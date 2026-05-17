return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "luadoc", "lua", "cpp",
            "java", "python",
        },
        indent = { enable = true },
        highlight = { enable = true },
    },
}

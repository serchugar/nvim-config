return {
  server = {
    init_options = {
      settings = {
        lineLength = 120,
        lint = {
          select = {
            "E", -- pycodestyle errors (PEP 8 violations)
            "W", -- pycodestyle warnings (style issues)
            "F", -- Pyflakes (logic errors and unused variables)
            "I", -- isort (import sorting and grouping)
            "N", -- pep8-naming (naming convention compliance)
            "UP", -- pyupgrade (modernize Python syntax)
            "B", -- flake8-bugbear (common design flaws/bugs)
            "C4", -- flake8-comprehensions (optimized list/dict/set usage)
            "A", -- flake8-builtins (prevent shadowing Python built-ins)
            "ANN", -- flake8-annotations (type hint enforcement)
            "PTH", -- flake8-use-pathlib (prefer Pathlib over os.path)
            "ARG", -- flake8-unused-arguments (detect unused function inputs)
            "SIM", -- flake8-simplify (suggest code simplifications)
          },
          ignore = {
            "ANN401", -- Allow 'Any' for complex types (useful in deep learning)
            "N806", -- Allow uppercase variables in functions (e.g., constants like DEVICE)
            "N812", -- Allow lowercase import aliases to be uppercase (e.g., 'import ... as F')
          },
          isort = {
            linesAfterImports = 2, -- Does not work, to achieve this one must use a ruff.toml in ~/.config/ruff/
            combineAsImports = true,
          },
        },
        format = {
          quoteStyle = "double",
          indentStyle = "space",
        },
      },
    },
  },

  setup = function(_, opts)
    -- Tell LazyVim to run organize imports right before formatting on save
    LazyVim.format.register({
      name = "ruff: organize imports",
      priority = 100, -- Run this FIRST before standard formatting
      primary = true,

      format = function(buf)
        -- Trigger Ruff's native LSP "source.organizeImports" action
        vim.lsp.buf.code_action({
          context = { only = { "source.organizeImports" } },
          apply = true,
        })
      end,

      sources = function(buf)
        return vim.bo[buf].filetype == "python" and { "ruff: organize imports" } or {}
      end,
    })
  end,
}

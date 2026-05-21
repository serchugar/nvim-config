local clang_format_contents = [[
BasedOnStyle: LLVM
IndentWidth: 4
TabWidth: 4
UseTab: Never
ColumnLimit: 120
AllowShortIfStatementsOnASingleLine: Always
AllowShortLoopsOnASingleLine: true
AllowShortBlocksOnASingleLine: Always
AllowShortFunctionsOnASingleLine: All
]]

local function with_clang_format(dir, fn)
  local path = dir .. "/.clang-format"
  local existed = vim.fn.filereadable(path) == 1
  if not existed then
    local f = io.open(path, "w")
    if f then
      f:write(clang_format_contents)
      f:close()
    end
  end
  fn()
  if not existed then
    vim.fn.delete(path)
  end
end

return {
  server = {},

  setup = function(_, opts)
    LazyVim.format.register({
      name = "clang-format",
      priority = 100,
      primary = true,

      format = function(buf)
        with_clang_format(vim.fn.getcwd(), function()
          vim.lsp.buf.format({ bufnr = buf, timeout_ms = 3000 })
        end)
      end,

      sources = function(buf)
        local ft = vim.bo[buf].filetype
        return (ft == "c" or ft == "cpp") and { "clangd" } or {}
      end,
    })
  end,
}

local M = {}

function M.isWindowsOs()
  return vim.fn.has("win32") == 1
end

return M

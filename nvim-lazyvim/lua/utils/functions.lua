local M = {}

function M.isWindowsOs()
  return vim.uv.os_uname().sysname:match("Windows")
end

return M

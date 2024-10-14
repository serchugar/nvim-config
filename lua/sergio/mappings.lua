-- When yank, copy also to windows clipboard so I can copy paste between wsl and windows
vim.api.nvim_set_keymap('v', 'y', '"+y', { noremap = true, silent = true})

-- Keymap for toggling Neotree
-- -------------------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-n>', '<Cmd>Neotree toggle<CR>', { noremap = true, silent = true })
-- -------------------------------------------------------------------------------------------------------------------

-- Opens Oil with "-"
-- -------------------------------------------------------------------------------------------------------------------
vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- -------------------------------------------------------------------------------------------------------------------

-- Keymap to be able to switch between last tow used buffers (one being the terminal) withour need to type <C-\-n>
-- -------------------------------------------------------------------------------------------------------------------
vim.api.nvim_set_keymap('n', '<C-6>', '<C-6>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-6>', '<C-\\><C-n><C-6>', { noremap = true, silent = true })
-- -------------------------------------------------------------------------------------------------------------------

--[[
-- My own custom autopairs
vim.api.nvim_set_keymap('i', '"', '""<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', "'", "''<Left>", { noremap = true })
vim.api.nvim_set_keymap('i', '(', '()<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '{', '{}<Left>', { noremap = true })
vim.api.nvim_set_keymap('i', '[', '[]<Left>', { noremap = true })

-- Function to check if the cursor is between pair of characters and insert new lines
-- -------------------------------------------------------------------------------------------------------------------
function _G.smart_enter()
  local col = vim.api.nvim_win_get_cursor(0)[2] -- Get the cursor position (0-indexed column)
  local line = vim.api.nvim_get_current_line()  -- Get the current line text

  -- Characters before and after the cursor
  local char_before = line:sub(col, col)        -- Character before the cursor
  local char_after = line:sub(col + 1, col + 1) -- Character after the cursor

  -- Check if the characters around the cursor are pairs like (), {}, []
  if (char_before == '(' and char_after == ')') or
     (char_before == '{' and char_after == '}') or
     (char_before == '[' and char_after == ']') then

    -- Insert two new lines and move the cursor
    return vim.api.nvim_replace_termcodes("<CR><CR><Up><Tab>", true, false, true)						--JS style
    --return vim.api.nvim_replace_termcodes("<Left><CR><Right><CR><CR><Up><Tab>", true, false, true)	--C# style
  else

    -- Otherwise, just do a normal enter
    return vim.api.nvim_replace_termcodes("<CR>", true, false, true)
  end
end

-- Map the Enter key in insert mode to the smart_enter function
vim.api.nvim_set_keymap('i', '<CR>', 'v:lua.smart_enter()', { noremap = true, expr = true })

-- -------------------------------------------------------------------------------------------------------------------

-- Function to delete paired characters if they are empty
-- -------------------------------------------------------------------------------------------------------------------
function _G.smart_backspace()
  local col = vim.api.nvim_win_get_cursor(0)[2] -- Get the cursor position (0-indexed column)
  local line = vim.api.nvim_get_current_line()  -- Get the current line text

  -- Characters before and after the cursor
  local char_before = line:sub(col, col)        -- Character before the cursor
  local char_after = line:sub(col + 1, col + 1) -- Character after the cursor

  -- Check if the characters before and after the cursor are empty pairs
  if (char_before == '(' and char_after == ')') or
     (char_before == '{' and char_after == '}') or
     (char_before == '[' and char_after == ']') or
     (char_before == '"' and char_after == '"') or
     (char_before == "'" and char_after == "'") then

    -- Delete both characters in the pair
    return vim.api.nvim_replace_termcodes("<Right><BS><BS>", true, false, true)
  else

    -- Otherwise, perform normal backspace
    return vim.api.nvim_replace_termcodes("<BS>", true, false, true)
  end
end

-- Map the Backspace key in insert mode to the smart_backspace function
vim.api.nvim_set_keymap('i', '<BS>', 'v:lua.smart_backspace()', { noremap = true, expr = true })
-- -------------------------------------------------------------------------------------------------------------------
--]]

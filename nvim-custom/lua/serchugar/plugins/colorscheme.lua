return {
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup {
                style = "darker",
                transparent = true,
                lualine = {
                    transparent = true,
                },
                colors = {
                    -- My custom colors
                    electricBlue = "#00e8d5",
                    dimElectricBlue = "#009f92",
                    grey = "#888888",
                    red = "#da6363",

                    -- From nvchad base46
                    white = "#abb2bf",
                    darker_black = "#1b1f27",
                    black = "#1e222a", --  nvim bg
                    black2 = "#252931",
                    one_bg = "#282c34", -- real bg of onedark
                    one_bg2 = "#353b45",
                    one_bg3 = "#373b43",
                    grey_fg = "#565c64",
                    grey_fg2 = "#6f737b",
                    light_grey = "#6f737b",
                    baby_pink = "#DE8C92",
                    pink = "#ff75a0",
                    line = "#31353d", -- for lines like vertsplit
                    green = "#98c379",
                    vibrant_green = "#7eca9c",
                    nord_blue = "#81A1C1",
                    blue = "#61afef",
                    yellow = "#e7c787",
                    sun = "#EBCB8B",
                    purple = "#de98fd",
                    dark_purple = "#c882e7",
                    teal = "#519ABA",
                    orange = "#fca2aa",
                    cyan = "#a3b8ef",
                    statusline_bg = "#22262e",
                    lightbg = "#2d3139",
                    pmenu_bg = "#61afef",
                    folder_bg = "#61afef",

                    -- From nvchad base46
                    base00 = "#1e222a", --$black
                    base01 = "#353b45", --$one_bg
                    base02 = "#3e4451", --dark blueish grey
                    base03 = "#545862", --dark blueish grey a bit more light
                    base04 = "#565c64", --$grey_fg
                    base05 = "#abb2bf", --$white
                    base06 = "#b6bdca", --A bit more light blueish grey
                    base07 = "#c8ccd4", --More light bluesish grey
                    base08 = "#da6363", --$red
                    base09 = "#d19a66", --Desatured orange
                    base0A = "#e5c07b", --Desatured yellowish orange
                    base0B = "#98c379", --$green
                    base0C = "#56b6c2", --Desatured electric blue
                    base0D = "#61afef", --$blue
                    base0E = "#c678dd", --Purple
                    base0F = "#be5046", --Terracota
                },
                highlights = {
                    -- My custom highlights
                    LineNr = { fg = "$electricBlue" },
                    LineNrAbove = { fg = "#009f92" },
                    LineNrBelow = { fg = "#009f92" },
                    NormalFloat = { bg = "none" },           -- was $darker_black
                    FloatTitle = { fg = "$white", bg = "none" }, --{ fg = "$white", bg = "$grey" },
                    FloatBorder = { fg = "$blue", bg = "none" }, --{ fg = "$blue" },
                    ["@boolean"] = { fg = "$base09" },

                    -- From nvchad base46
                    Added = { fg = "$green" },
                    Removed = { fg = "$red" },
                    Changed = { fg = "$yellow" },
                    MatchWord = { bg = "$grey", fg = "$white" },
                    Pmenu = { bg = "$one_bg" },
                    PmenuSbar = { bg = "$one_bg" },
                    PmenuSel = { bg = "$pmenu_bg", fg = "$black" },
                    PmenuThumb = { bg = "$grey" },
                    MatchParen = { link = "MatchWord" },
                    Comment = { fg = "$light_grey" },
                    CursorLineNr = { fg = "$white" },
                    NvimInternalError = { fg = "$red" },
                    WinSeparator = { fg = "$line" },
                    Normal = { fg = "$base05", bg = "none" }, -- bg was: base00
                    DevIconDefault = { fg = "$red" },
                    Debug = { fg = "$red" },
                    Directory = { fg = "$base0D" },
                    Error = { fg = "$base00", bg = "$red" },
                    ErrorMsg = { fg = "$red", bg = "$base00" },
                    Exception = { fg = "$red" },
                    FoldColumn = { bg = "none" },
                    Folded = { fg = "$light_grey", bg = "$black2" },
                    IncSearch = { fg = "$base01", bg = "$base09" },
                    Macro = { fg = "$red" },
                    ModeMsg = { fg = "$base0B" },
                    MoreMsg = { fg = "$base0B" },
                    Question = { fg = "$base0D" },
                    Search = { fg = "$base01", bg = "$base0A" },
                    Substitute = { fg = "$base01", bg = "$base0A" },
                    SpecialKey = { fg = "$base03" },
                    TooLong = { fg = "$red" },
                    Visual = { bg = "$base02" },
                    VisualNOS = { fg = "$red" },
                    WarningMsg = { fg = "$red" },
                    WildMenu = { fg = "$red", bg = "$base0A" },
                    Title = { fg = "$base0D" },
                    Conceal = { bg = "NONE" },
                    Cursor = { fg = "$base00", bg = "$base05" },
                    NonText = { fg = "$base03" },
                    SignColumn = { fg = "$base03" },
                    ColorColumn = { bg = "$black2" },
                    CursorColumn = { bg = "$base01" },
                    CursorLine = { bg = "$black2" },
                    QuickFixLine = { bg = "$base01" },
                    healthSuccess = { bg = "$green", fg = "$black" },
                    WinBar = { bg = "NONE" },
                    WinBarNC = { bg = "NONE" },

                    -- All of these highlight groups below should be done in treesiter.lua
                    -- From nvchad base46
                    ["@variable"] = { fg = "$base05" },
                    ["@variable.builtin"] = { fg = "$base09" },
                    ["@variable.parameter"] = { fg = "$red" },
                    ["@variable.member"] = { fg = "$red" },
                    ["@variable.member.key"] = { fg = "$red" },

                    ["@module"] = { fg = "$red" },
                    ["@module.builtin"] = { fg = "$red" },

                    ["@constant"] = { fg = "$base09" },
                    ["@constant.builtin"] = { fg = "$base09" },
                    ["@constant.macro"] = { fg = "$red" },

                    ["@string"] = { fg = "$base0B" },
                    ["@string.regex"] = { fg = "$base0C" },
                    ["@string.escape"] = { fg = "$base0C" },
                    ["@character"] = { fg = "$red" },
                    ["@character.special"] = { fg = "$red" },
                    ["@number"] = { fg = "$base09" },
                    ["@number.float"] = { fg = "$base09" },

                    ["@annotation"] = { fg = "$base0F" },
                    ["@attribute"] = { fg = "$base0A" },
                    ["@error"] = { fg = "$red" },

                    ["@keyword.exception"] = { fg = "$red" },
                    ["@keyword"] = { fg = "$base0E" },
                    ["@keyword.function"] = { fg = "$base0E" },
                    ["@keyword.return"] = { fg = "$base0E" },
                    ["@keyword.operator"] = { fg = "$base0E" },
                    ["@keyword.import"] = { link = "Include" },
                    ["@keyword.conditional"] = { fg = "$base0E" },
                    ["@keyword.conditional.ternary"] = { fg = "$base0E" },
                    ["@keyword.repeat"] = { fg = "$base0A" },
                    ["@keyword.storage"] = { fg = "$base0A" },
                    ["@keyword.directive.define"] = { fg = "$base0E" },
                    ["@keyword.directive"] = { fg = "$base0A" },

                    ["@function"] = { fg = "$base0D" },
                    ["@function.builtin"] = { fg = "$base0D" },
                    ["@function.macro"] = { fg = "$red" },
                    ["@function.call"] = { fg = "$base0D" },
                    ["@function.method"] = { fg = "$base0D" },
                    ["@function.method.call"] = { fg = "$base0D" },
                    ["@constructor"] = { fg = "$base0C" },

                    ["@operator"] = { fg = "$base05" },
                    ["@reference"] = { fg = "$base05" },
                    ["@punctuation.bracket"] = { fg = "$base0F" },
                    ["@punctuation.delimiter"] = { fg = "$base0F" },
                    ["@symbol"] = { fg = "$base0B" },
                    ["@tag"] = { fg = "$base0A" },
                    ["@tag.attribute"] = { fg = "$red" },
                    ["@tag.delimiter"] = { fg = "$base0F" },
                    ["@text"] = { fg = "$base05" },
                    ["@text.emphasis"] = { fg = "$base09" },
                    ["@text.strike"] = { fg = "$base0F", strikethrough = true },
                    ["@type.builtin"] = { fg = "$base0A" },
                    ["@definition"] = { sp = "$base04", underline = true },

                    ["@property"] = { fg = "$red" },

                    -- markup
                    ["@markup.heading"] = { fg = "$base0D" },
                    ["@markup.raw"] = { fg = "$base09" },
                    ["@markup.link"] = { fg = "$red" },
                    ["@markup.link.url"] = { fg = "$base09", underline = true },
                    ["@markup.link.label"] = { fg = "$base0C" },
                    ["@markup.list"] = { fg = "$red" },
                    ["@markup.strong"] = { bold = true },
                    ["@markup.underline"] = { underline = true },
                    ["@markup.italic"] = { italic = true },
                    ["@markup.strikethrough"] = { strikethrough = true },
                    ["@markup.quote"] = { bg = "$black2" },

                    ["@comment"] = { fg = "$grey_fg" },
                    ["@comment.todo"] = { fg = "$grey", bg = "$white" },
                    ["@comment.warning"] = { fg = "$black2", bg = "$base09" },
                    ["@comment.note"] = { fg = "$black", bg = "$blue" },
                    ["@comment.danger"] = { fg = "$black2", bg = "$red" },

                    ["@diff.plus"] = { fg = "$green" },
                    ["@diff.minus"] = { fg = "$red" },
                    ["@diff.delta"] = { fg = "$light_grey" },
                },
            }
            -- Set Colorscheme here
            vim.cmd([[silent! colorscheme onedark]])
        end,
    },
    {
        -- VSCode JetBrains Rider theme
        "Mofiqul/vscode.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			style = "dark",
            transparent = true,
            terminal_color = true,
			group_overrides = {

				-- This re-color is based on Mofiqul/vscode
				-- Just a small recoloring to make it look like JetBrains Rider Dark
                -- https://github.com/Sofiane5900/riderdark-vscode.nvim

				-- Variables
				["@variable"] = { fg = "#bdbdbd" },
				["@variable.c_sharp"] = { link = "@variable" },
				["@variable.member.c_sharp"] = { fg = "#65c3cc" },
				["@variable.parameter"] = { fg = "#ed8796" },
				["@variable.parameter.c_sharp"] = { link = "@variable.parameter" },

				["@keyword.repeat"] = { fg = "#6c95eb", bold = true },
				["@keyword.repeat.c_sharp"] = { link = "@keyword.repeat" },

				-- Boolean
				["@boolean"] = { fg = "#6c95eb", italic = true },
				["@boolean.c_sharp"] = { link = "@boolean" },

				-- Return
				["@keyword.return"] = { fg = "#6c95eb" },
				["@keyword.return.c_sharp"] = { link = "@keyword.return" },

				-- Method
				["@function.method"] = { fg = "#38c596", bold = true },
				["@function.method.call"] = { link = "@function.method" },
				["@function.method.call.c_sharp"] = { link = "@function.method" },

				-- Types (mots clés)
				["@keyword"] = { fg = "#6c95eb", italic = false },
				["@keyword.conditional"] = { fg = "#6c95eb", italic = false },
				["@keyword.conditional.c_sharp"] = { link = "@keyword.conditional" },

				-- Operator
				["@operator"] = { fg = "#65c3cc" },
				["@operator.c_sharp"] = { link = "@operator" },

				-- Classes
				["@lsp.type.class.cs"] = { fg = "#c191ff", bold = true },

				-- Number
				["@number"] = { fg = "#e791bc", bold = true },
				["@number.c_sharp"] = { link = "@number" },

				-- Comment
				["Comment"] = { fg = "#84c26b", italic = true },

                -- My custom highlights
                LineNr = { fg = "#00e8d5" },
                LineNrAbove = { fg = "#009f92" },
                LineNrBelow = { fg = "#009f92" },
                NormalFloat = { bg = "none" },           -- was $darker_black
                FloatTitle = { fg = "#abb2bf", bg = "none" }, --{ fg = "$white", bg = "$grey" },
                FloatBorder = { fg = "#61afef", bg = "none" }, --{ fg = "$blue" },
			},
		},
    }
}

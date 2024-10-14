return {
	"navarasu/onedark.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup {
			style = 'darker',
			transparent = true,
			lualine = {
				transparent = true,
			},
			colors = {
				electricBlue = "#00e8d5",
				dimElectricBlue = "#009f92",
			},
			highlights = {
				["LineNr"] = { fg = "$electricBlue" },
				["LineNrAbove"] = { fg = "$dimElectricBlue" },
				["LineNrBelow"] = { fg = "$dimElectricBlue" },
			},
		}
		-- load the colorscheme here
		vim.cmd([[colorscheme onedark]])
	end,
}

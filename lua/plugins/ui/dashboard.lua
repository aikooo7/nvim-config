return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	opts = {
		theme = "doom",
		config = {
			header = {
				[[__          ___                 _         _____   _                                 _               _                 ]],
				[[       \ \        / / |               | |       |_   _| | |                               (_)             | |                       ]],
				[[        \ \  /\  / /| |__  _   _    __| | ___     | |   | | _____  ___ _ __     __ _  ___  _ _ __   __ _  | |__   ___ _ __ ___       ]],
				[[         \ \/  \/ / | '_ \| | | |  / _` |/ _ \    | |   | |/ / _ \/ _ \ '_ \   / _` |/ _ \| | '_ \ / _` | | '_ \ / _ \ '__/ _ \      ]],
				[[          \  /\  /  | | | | |_| | | (_| | (_) |  _| |_  |   <  __/  __/ |_) | | (_| | (_) | | | | | (_| | | | | |  __/ | |  __/_ _ _ ]],
				[[            \/  \/   |_| |_|\__, |  \__,_|\___/  |_____| |_|\_\___|\___| .__/   \__, |\___/|_|_| |_|\__, | |_| |_|\___|_|  \___(_|_|_) ]],
				[[                           __/ |                                     | |       __/ |               __/ |                           ]],
				[[                          |___/                                      |_|      |___/               |___/                            ]],
				[[]],
				[[]],
				[[]],
			},
			footer = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
			end,
		},
	},
	config = function(_, opts)
		require("dashboard").setup(opts)
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

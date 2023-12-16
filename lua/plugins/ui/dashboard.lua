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
			center = {
				{
					action = "Telescope find_files",
					desc = " Find file",
					icon = " ",
					key = "f",
				},
				{
					action = "ene | startinsert",
					desc = " New file",
					icon = " ",
					key = "n",
				},
				{
					action = "Telescope oldfiles",
					desc = " Recent files",
					icon = " ",
					key = "r",
				},
				{
					action = "Telescope live_grep",
					desc = " Find text",
					icon = " ",
					key = "ps",
				},
				{
					action = "TodoTelescope",
					desc = " Find todos and other notes in comments",
					icon = " ",
					key = "t",
				},
				-- NOTE:Take a look at persistence
				{
					action = 'lua require("persistence").load()',
					desc = " Restore Session",
					icon = " ",
					key = "s",
				},
				{
					action = "Lazy",
					desc = " Lazy",
					icon = "💤",
					key = "l",
				},
				{
					action = "Oil",
					desc = "Open oil",
					icon = "🛢️",
					key = "o",
				},
				{
					action = "qa",
					desc = " Quit",
					icon = " ",
					key = "q",
				},
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

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        'vim-airline/vim-airline',
        'vim-airline/vim-airline-themes'
    },
    {
        'morhetz/gruvbox',
    },
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate" 

    },
    {
        "mbbill/undotree"
    },
    {
        "tpope/vim-fugitive"
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    },
    {
        {
            "nvim-tree/nvim-tree.lua",
            version = "*",
            lazy = false,
            dependencies = {
                "nvim-tree/nvim-web-devicons",
            },
            config = function()
                require("nvim-tree").setup {}
            end,
        }

    },
    {'romgrk/barbar.nvim',
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
},
{
    "m4xshen/autoclose.nvim",

    init = function()
        require("autoclose").setup()
    end,
},
{
    "christoomey/vim-tmux-navigator",
    lazy = false
},
{
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
        vim.g.rustfmt_autosave = 1
    end
},
{
    "Saecki/crates.nvim",
    ft = {"rust", "toml"},
    config = function(_, opts)
        local crates = require('crates')
        crates.setup(opts)
        crates.show()
    end
},
{
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- Using default.
    }
},
{
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    -- Debugging dependencies
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text"
},
config = function()
    require("go").setup()
end,
event = {"CmdlineEnter"},
ft = {"go", 'gomod'},
build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
},
{
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        -- Using default.
    },
},
{
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            background_colour = "#000000",
        })
    end
},
{
    "folke/noice.nvim",
    config = function()
        require("noice").setup({
            -- add any options here
            -- routes = {
                --   {
                    --     view = "notify",
                    --     filter = { event = "msg_showmode" },
                    --   },
                    -- },
                })
            end,
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify"

            }
        },

    })

    vim.cmd("let g:airline_theme= 'gruvbox'")
    vim.cmd('colorscheme gruvbox')
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
        "nvim-lualine/lualine.nvim",
        config = function()
            require('lualine').setup {
            options = {
                icons_enabled = true,
                component_separators = '|',
                section_separators = '',
            },
            sections = {
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    }
                },
                lualine_a = {
                    {
                        'buffers',
                    }
                }
            }
      }
  end
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
        -- Git related plugins
        'tpope/vim-fugitive',
        'lewis6991/gitsigns.nvim'
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
        		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},}
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
{
  "jackMort/ChatGPT.nvim",
    config = function()
      require("chatgpt").setup({
          -- [
          -- You need to set the env variable OPENAPI_API_KEY.
          -- Aso in the async_api_keycmd you need to put how it will be 
          -- extracted, I'm using pass-store.
          -- NOTE: you can also use api_key_cmd but the async version is faster.
          -- ]
          async_api_key_cmd = "pass show api/tokens/openai"
      })
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
},
{
    "https://github.com/jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    -- Formatting
    'MunifTanjim/prettier.nvim'

},
{
    'numToStr/Comment.nvim',
    opts = {
        -- [
        -- Option should go here
        -- (Optional)
        -- ]    
},
    lazy = false,
}
})
    vim.cmd('colorscheme gruvbox')

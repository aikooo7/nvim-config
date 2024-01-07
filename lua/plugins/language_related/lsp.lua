vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set("n", "<leader>vrn", function()
      vim.lsp.buf.rename()
    end, opts)
    vim.keymap.set("i", "<C-h>", function()
      vim.lsp.buf.signature_help()
    end, opts)
    vim.keymap.set("n", "gd", function()
      vim.lsp.buf.definition()
    end, opts)
    vim.keymap.set("n", "<leader>vrr", function()
      vim.lsp.buf.references()
    end, opts)
    vim.keymap.set("n", "<leader>ca", function()
      vim.lsp.buf.code_action()
    end, opts)
    vim.keymap.set("n", "K", function()
      vim.lsp.buf.hover()
    end, opts)
  end,
})

return {
  {
    "neovim/nvim-lspconfig",
    cmd = "LspInfo",
    event = { "BufReadPost", "BufWritePost", "BufNewFile" },
    opts = {
      servers = {
        nil_ls = {},
        rust_analyzer = {},
        tsserver = {},
        lua_ls = {
          settings = {
            Lua = {
              runtime = { version = "LuaJIT" },
              telemetry = { enable = false },
              diagnostics = {
                globals = { "vim", "require", "pcall", "pairs" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Replace",
              },
              hint = {
                enable = true,
              },
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
    dependencies = {
      { "folke/neodev.nvim" },
      { "hrsh7th/cmp-nvim-lsp", opts = {} },
    },
    config = function(_, opts)
      local servers = opts.servers
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        has_cmp and cmp_nvim_lsp.default_capabilities() or {},
        opts.capabilities or require("cmp_nvim_lsp").default_capabilities()
      )

      for name, icon in pairs(require("M.constants").icons.diagnostics) do
        name = "DiagnosticSign" .. name
        vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
      end

      -- Main setup call
      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities or {}),
        }, servers[server] or {})
        server_opts.flags = { debounce_text_changes = 150 }
        require("lspconfig")[server].setup(server_opts)
      end

      local has_mason, mason_lsp = pcall(require, "mason-lspconfig")
      local mason_servers = {}
      if has_mason then
        mason_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
      end

      local ensure_installed = {} ---@type string[]
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- Run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
          if server_opts.mason == false or not vim.tbl_contains(mason_servers, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end
      if has_mason then
        mason_lsp.setup({
          ensure_installed = ensure_installed,
          handlers = { setup },
          automatic_installation = true,
        })
      end
    end,
  },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/snippets/" } })
          end,
        },
        opts = {
          history = true,
          delete_check_events = "TextChanged",
        },
      },
      {
        "onsails/lspkind.nvim",
        opts = {
          mode = "symbol_text",
          preset = "default",
          symbol_map = {
            Text = "󰉿",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰜢",
            Variable = "󰀫",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "󰑭",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "󰙅",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "",
            Codeium = "󱚣",
          },
        },
        config = function(_, opts)
          require("lspkind").init(opts)
        end,
      },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp_config = {
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "codeium" },
        },
        mapping = {
          -- confirm selection
          ["<CR>"] = cmp.mapping.confirm({ select = false }),

          -- cancel completion
          ["<C-e>"] = cmp.mapping.abort(),

          -- navigate items on the list
          ["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
          ["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              else
                cmp.select_next_item()
              end
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jumpable()
            elseif has_words_before() then
              cmp.complete()
              if #cmp.get_entries() == 1 then
                cmp.confirm({ select = true })
              end
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol", -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
              return vim_item
            end,
          }),
        },
      }

      cmp.setup(cmp_config)
    end,
  },

  -- { "rafamadriz/friendly-snippets" },

  -- Rust Support
  "simrat39/rust-tools.nvim",
  ft = "rust",

  -- Debugging
  -- { "mfussenegger/nvim-dap" },
}

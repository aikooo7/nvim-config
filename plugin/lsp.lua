local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opbs)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
end)

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
})

lsp.skip_server_setup({'jdtls'})

lspconfig.kotlin_language_server.setup{}

-- Fix Undefined global 'vim'
-- lsp.configure('lua-language-server', {
--     settings = {
--         Lua = {
--             diagnostics = {
--                 globals = { 'vim' }
--             }
--         }
--     }
-- })

-- Ocaml stuff

lspconfig.ocamllsp.setup({
    cmd = { "ocamllsp" },
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
})

-- Rust fmt.

local rust = require("rust-tools")

rust.setup({
  tools = {
    runnables = {
      use_telescope = true,
    },
    autoSetFT = true,
    cargo = {
      allFeatures = true,
    }
  }
})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

require('lspconfig').tsserver.setup {
    init_options = {
        preferences = {
            disableSuggestions = true,
        }
    }
}

-- Keybinds

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = true})
    }
})

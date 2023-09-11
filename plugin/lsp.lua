local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'rust_analyzer'
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

lsp.setup()

local cmp = require('cmp')

cmp.setup({
    mapping = {
        ["<CR>"] = cmp.mapping.confirm({select = true})
    }
})

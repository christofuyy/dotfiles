-- Autocomplete
vim.o.completeopt = 'menu,menuone,noselect'
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args) require('luasnip').lsp_expand(args.body) end
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-3),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true
        }
    },
    sources = {
        {name = 'nvim_lsp'}, {name = 'luasnip'}, {name = 'nvim_lua'},
        {name = 'buffer'}, {name = 'path'}

    },
    formatting = {
        format = function(entry, vim_item)
            -- load lspkind icons
            vim_item.kind = string.format("%s %s", require(
                                              "plugins/config/lspkind_icons").icons[vim_item.kind],
                                          vim_item.kind)

            vim_item.menu = ({
                nvim_lsp = "[LSP]",
                nvim_lua = "[Lua]",
                buffer = "[BUF]"
            })[entry.source.name]

            return vim_item
        end
    }
}

local lsp_publish_diagnostics_options = {
    virtual_text = {prefix = "", spacing = 0},
    signs = true,
    underline = true,
    update_in_insert = false -- update diagnostics insert mode
}
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics,
                 lsp_publish_diagnostics_options)
vim.lsp.handlers["textDocument/hover"] =
    vim.lsp.with(vim.lsp.handlers.hover, {border = "single"})
vim.lsp.handlers["textDocument/signatureHelp"] =
    vim.lsp.with(vim.lsp.handlers.signature_help, {border = "single"})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

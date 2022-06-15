local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.documentationFormat = {
    "markdown", "plaintext"
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport =
    true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = {1}
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {"documentation", "detail", "additionalTextEdits"}
}

local nvim_lsp = require('lspconfig')
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
    'pyright', 'clangd', 'tsserver', 'omnisharp', 'r_language_server'
}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        -- on_attach = require'completion'.on_attach,
        capabilities = capabilities,
        flags = {debounce_text_changes = 150}
    }
end

local pid = vim.fn.getpid()
local omnisharp_bin = "~/Downloads/omnisharp-osx-arm64-net6.0/OmniSharp"
nvim_lsp.omnisharp.setup {
    cmd = {omnisharp_bin, "--languageserver", "--hostPID", tostring(pid)},
    root_dir = nvim_lsp.util.root_pattern("*.sln")
}

local runtime_path = vim.split(package.path, ';')
nvim_lsp.sumneko_lua.setup {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true)
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {enable = false}
        }
    }
}

local map = vim.api.nvim_set_keymap;
local opts = {noremap = true, silent = true};

map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>', opts);
map('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', opts);
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>', opts);
-- nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
-- nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
-- nnoremap <silent> <C-d> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', opts);
-- nnoremap <silent> <leader>rn <cmd>lua require('lspsaga.rename').rename()<CR>
map('n', '<leader>ca', ':lua vim.lsp.buf.code_action()<CR>', opts);
-- nnoremap <silent> <leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>', opts);
map('n', '[g', ':lua vim.diagnostic.goto_prev()<CR>', opts);
map('n', ']g', ':lua vim.diagnostic.goto_next()<CR>', opts);
-- map('n','<leader>f',':lua vim.lsp.buf.formatting()<CR>',opts);
map('n', '<leader>f', ':Neoformat<CR>', opts);

-- replace the default lsp diagnostic symbols
local function lspSymbol(name, icon)
    local hl = "DiagnosticSign" .. name
    vim.fn.sign_define(hl, {text = icon, numhl = hl, texthl = hl})
end
lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

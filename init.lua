require('plugins')

-- setup lsp keymaps when attached
local on_attach = function(_, bufnr)
    -- show function parameters
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer=bufnr })
end

-- automaticly setup lsp servers
require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function (server_name) -- default handler (optional)
        require("lspconfig")[server_name].setup {
            on_attach = on_attach,
        }
    end,
}

-- open error list
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)

vim.opt.ruler = true

vim.opt.hlsearch = true

vim.opt.smarttab = true
vim.opt.autoindent = true

-- tab as 4 spaces
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

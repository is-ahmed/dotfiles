require("mason").setup()
require("mason-lspconfig").setup()

-- Actually set up servers
require("lspconfig").pyright.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}
require("lspconfig").texlab.setup {}

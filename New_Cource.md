:h rtp
:checkhealth
:echo stdpath("config")
:echo stdpath("date")

# Tree Sitter
:TSInstall javascript
:InspectTree
:TSBufEnable highlight

# LSP
:lua vim.print(vim.lsp)  || :=vim.lsp
:lua vim.lsp.buf.hover()
:LspInfo

# Lazydev plugin

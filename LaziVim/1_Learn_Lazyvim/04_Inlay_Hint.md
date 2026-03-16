# Inlay Hint

## How to Toggle Them in LazyVim

1. `<space>uh`

```lua
-- ~/.config/nvim/lua/plugins/lsp.lua
-- INFO: This Disable (Inlay Hint) UI
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- This is the key setting for LazyVim's UI
      inlay_hints = {
        enabled = false,
      },
    },
  },
}

```

## Why don't I see them?

If you press `<space>uh` and nothing happens,
check these three things:

1. LSP Support:
   The Language Server for your language
   (like vtsls or typescript-language-server for JS)
   must support them.

1. Config:
   Some LSPs have inlay hints disabled by default.
   You might need to enable them in your lspconfig.

1. Neovim Version:  
   You need Neovim 0.10+ for native
   inlay hint support (which most LazyVim users have by now).

## Pro-Tip for JavaScript/TypeScript

In LazyVim,
if you want them on by default for JS,
you usually need to enable them in your
options.lua or your lang.typescript extra.

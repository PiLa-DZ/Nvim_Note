# Spelling

1. `Space us` Spelling
1. `Space z=` Spelling Suggestions
1. `Space ]s` Next Misspelled Word
1. `Space [s` Previous Misspelled Word
1. `Space zg` Add word to spell list
1. `Space zw` Mark word as bad/misspelled

```lua
:set spell
:set nospell
```

```lua
-- Disable Spelling
-- ~/.config/nvim/lua/config/autocmds.lua

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = false
  end
})
```

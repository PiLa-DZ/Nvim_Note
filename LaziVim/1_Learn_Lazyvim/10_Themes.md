# Theme

## catppuccin

```lua
-- ~/.config/nvim/lua/plugins/theme.lua
return {
  -- 1. Tell LazyVim to use catppuccin
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  -- 2. Configure Catppuccin to use the "frappe" flavor
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Ensures it loads before other plugins
    opts = {
      flavour = "frappe", -- Choose between latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        telescope = true,
        mason = true,
        which_key = true,
        -- You can add more integrations here
      },
    },
  },
}
```

## gruvbox

```lua
-- ~/.config/nvim/lua/plugins/theme.lua
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  }
}

```

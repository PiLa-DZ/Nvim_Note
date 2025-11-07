-- (Nvim-Tree) --> File Manager
-- (Web-Devicons)
return {
      "nvim-tree/nvim-tree.lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("nvim-tree").setup({
          sort_by = "case_sensitive",
          view = {
            width = 30, -- عرض شجرة الملفات
            adaptive_size = true,
          },
          renderer = {
            group_empty = true,
          },
          filters = {
            dotfiles = false,
          },
          -- الخيار sync_root_dir و auto_start تم حذفهما، سنستخدم Auto-Commands
          update_focused_file = {
              enable = true, -- تحديث شجرة الملفات لتشير إلى الملف الحالي
              update_root = false,
              ignore_list = {},
          },
        })

        -- تعيين اختصار (Keymap) لفتح/إغلاق nvim-tree
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' })
      end,
    }

-- (Neorg) --> Note Taking
-- (Plenary.nvim)

-- TODO: You have to add "norg" lenguage to (Tree-Sitter) Plugin
	-- ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" , "norg"},
-- TODO: You have to add "LocalLeader" to Keymap file
	-- vim.g.maplocalleader = ";"

return {
      "nvim-neorg/neorg",
      lazy = false, -- تحتاج للتكوين مبكراً للتعرف على نوع الملفات
      build = ":Neorg sync-parsers", -- يقوم بتثبيت المحللات اللغوية لـ Neorg
      dependencies = { "nvim-lua/plenary.nvim" }, -- اعتمادية أساسية
      config = function()
        require("neorg").setup {
          load = {
            ["core.defaults"] = {}, -- تحميل الإعدادات الافتراضية
            ["core.concealer"] = {}, -- تفعيل الإخفاء (Concealing) للنص لجعل المظهر أجمل
            ["core.dirman"] = { -- مدير المجلدات
              config = {
                workspace = {
                  notes = "~/notes", -- يمكنك تغيير هذا المسار إلى مجلد ملاحظاتك المفضل
                },
              },
            },
            -- يمكنك إضافة وحدات أخرى هنا لاحقاً (مثل core.completion، core.export)
          },
        }
      end,
    }

-- (Tree-Sitter) --> Text_Highlighting
return {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate", -- يقوم بتثبيت المحللات اللغوية عند التثبيت
      config = function()
        require("nvim-treesitter.configs").setup({
          -- اللغات التي تريد Treesitter أن يقوم بتحليلها
          -- يمكنك إضافة المزيد من اللغات حسب حاجتك (مثل "lua", "css", "html", "python", etc.)
          ensure_installed = { "javascript", "typescript", "json", "lua", "css", "html" , "norg"},

          -- تفعيل تلوين بناء الجملة بواسطة Treesitter
          highlight = {
            enable = true,
            -- هنا يمكنك تعيين اللغات التي لا تريد Treesitter تلوينها (اختياري)
            disable = {},
          },
          -- تفعيل الأقواس الذكية (اختياري، ولكن مفيد)
          indent = { enable = true, disable = { "python" } },
        })
      end,
    }

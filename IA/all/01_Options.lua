-- الإعدادات الأساسية
vim.opt.nu = true        -- إظهار أرقام الأسطر (number)
vim.opt.relativenumber = true -- إظهار أرقام الأسطر النسبية (relativenumber)
vim.opt.tabstop = 4      -- عدد المسافات التي تمثلها علامة الجدولة (Tab)
vim.opt.softtabstop = 4  -- عدد المسافات المستخدمة عند الضغط على Tab في وضع الإدخال
vim.opt.shiftwidth = 4   -- عدد المسافات المستخدمة في الإزاحة التلقائية
vim.opt.expandtab = true -- تحويل علامات الجدولة إلى مسافات
vim.opt.smartindent = true -- تفعيل الإزاحة الذكية
vim.opt.wrap = false     -- عدم التفاف الأسطر الطويلة
vim.opt.swapfile = false -- تعطيل ملفات المبادلة (Swap files)
vim.opt.backup = false   -- تعطيل ملفات النسخ الاحتياطي (Backup files)
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true  -- حفظ تاريخ التراجع (Undo) بشكل دائم

vim.opt.hlsearch = false -- عدم تمييز نتائج البحث بشكل مستمر
vim.opt.incsearch = true -- تمييز نتائج البحث تدريجياً أثناء الكتابة

vim.opt.scrolloff = 8    -- عدد الأسطر التي يجب تركها حول المؤشر عند التمرير
vim.opt.isfname:append("@-@") -- إضافة رموز محددة لتعريف أسماء الملفات

vim.opt.updatetime = 300 -- تقليل وقت تحديث ملفات المبادلة (لتحسين أداء LSP)

vim.opt.termguicolors = true -- تفعيل ألوان 24-bit

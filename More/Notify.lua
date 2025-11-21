-- ==========================================================
-- الإشعار المحدَّث: إضافة تأخير زمني (250ms)
-- ==========================================================
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		-- 💡 استخدام vim.defer_fn لتأجيل تنفيذ الإشعار
		vim.defer_fn(
			function()
				local hour = tonumber(os.date("%H"))
				local greeting = "مرحباً! وقت العمل."

				if hour >= 0 and hour < 12 then
					greeting = "صباح الخير! ابدأ يومك بإبداع. ☀️"
				elseif hour >= 12 and hour < 18 then
					greeting = "مساء الخير! أتمنى لك إنتاجية عالية. ☕"
				else
					greeting = "ليلة سعيدة! الوقت مناسب للتركيز. 🌙"
				end

				-- إرسال الإشعار عبر fidget
				vim.notify(
					"Neovim جاهز للعمل. " .. greeting,
					vim.log.levels.INFO,
					{ title = "مرحباً بك!", timeout = 5000 }
				)
			end,
			250 -- 💡 التأخير: 250 مللي ثانية (ربع ثانية)
		)
	end,
})
-- ==========================================================
-- Updated Notification: Adding a time delay (250ms)
-- ==========================================================
vim.api.nvim_create_autocmd("UIEnter", {
	callback = function()
		-- 💡 Use vim.defer_fn to delay the notification execution
		vim.defer_fn(
			function()
				local hour = tonumber(os.date("%H"))
				local greeting = "Welcome! Time to work." -- Default

				if hour >= 0 and hour < 12 then
					greeting = "Good morning! Start your day creatively. ☀️"
				elseif hour >= 12 and hour < 18 then
					greeting = "Good afternoon! Wish you high productivity. ☕"
				else
					greeting = "Good evening! Perfect time to focus. 🌙"
				end

				-- Send the notification via fidget
				vim.notify(
					-- "Neovim is ready to go. " .. greeting,
					"Hi Nabil 😍.. " .. greeting,
					vim.log.levels.INFO,
					{ title = "Welcome!", timeout = 5000 }
				)
			end,
			250 -- 💡 Delay: 250 milliseconds (quarter of a second)
		)
	end,
})

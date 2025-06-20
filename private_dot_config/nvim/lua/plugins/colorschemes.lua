return {
	"RRethy/base16-nvim",
	config = function()
		local custom_palette = "colors.custom"
		local palette_path = vim.fn.stdpath("config") .. "/lua/colors/"
		local apply = function()
			require("base16-colorscheme").setup(require(custom_palette))
		end

		apply()

		local watcher = vim.uv.new_fs_event()
		local reload = function(err)
			if err then
				vim.notify("⚠️ palette watcher error: " .. err, vim.log.levels.ERROR)
				return
			end
			-- Clear module and re-apply
			package.loaded[custom_palette] = nil
			apply()
			vim.notify("base16 colorscheme reloaded (fs event)", vim.log.levels.INFO)
		end
		watcher:start(palette_path, {}, vim.schedule_wrap(reload))
	end,
}

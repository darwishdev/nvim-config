-- ~/.config/nvim/init.lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- Load core settings
require("core.options")
require("core.keymaps")
require("core.autocommands")

-- Load plugins
-- require("plugins")
require("lazy").setup("plugins", {
	change_detection = { notify = true },
})

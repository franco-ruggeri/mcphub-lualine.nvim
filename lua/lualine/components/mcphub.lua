local M = require("lualine.component"):extend()

local default_options = {
	icon = "󰐻 ",
	spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
	stopped_symbol = "-",
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self.spinner_index = 0
end

function M:update_status()
	if not vim.g.loaded_mcphub then
		return nil
	end

	local status = vim.g.mcphub_status
	local text = nil
	if not status then
		text = self.options.stopped_symbol
	elseif vim.g.mcphub_executing or status == "starting" or status == "restarting" then
		self.spinner_index = (self.spinner_index % #self.options.spinner_symbols) + 1
		text = self.options.spinner_symbols[self.spinner_index]
	else
		text = vim.g.mcphub_servers_count or 0
		text = tostring(text)
	end
	return text
end

return M

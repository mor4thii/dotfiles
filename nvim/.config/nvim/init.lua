require("config.lazy")

vim.o.expandtab = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

vim.opt.list = true

local space = "·"
vim.opt.listchars:append {
	tab = "│─",
	multispace = space,
	lead = space,
	trail = space,
	nbsp = space
}

vim.cmd([[match TrailingWhitespace /\s\+$/]])

vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })

vim.api.nvim_create_autocmd("InsertEnter", {
  callback = function()
    vim.opt.listchars.trail = nil
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Whitespace" })
  end
})

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    vim.opt.listchars.trail = space
    vim.api.nvim_set_hl(0, "TrailingWhitespace", { link = "Error" })
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

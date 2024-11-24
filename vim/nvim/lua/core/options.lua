-- For any vim.opt.bla you can type ":h bla" and change as you prefer

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.undofile = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true

vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

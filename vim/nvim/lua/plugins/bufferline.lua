return {
	'akinsho/bufferline.nvim',
	dependencies = 'kyazdani42/nvim-web-devicons',
	--[[ tag = "v3.*", ]]
	keys = {
		{ '<Tab>', ':BufferLineCycleNext<CR>', desc = 'Next Tab', silent = true },
		{ '<S-Tab>', ':BufferLineCyclePrev<CR>', desc = 'Previous Tab', silent = true },
		{ '<leader>x', ':bdelete<CR>', desc = 'Delete tab', silent = true },
	},
	config = function()
		local status_ok, bufferline = pcall(require, 'bufferline')
		if not status_ok then
			return
		end
		vim.opt.termguicolors = true
		bufferline.setup({})
	end,
}

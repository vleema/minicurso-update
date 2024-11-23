require 'core.keymaps'
require 'core.options'
require 'core.lazy'

-- Automatically folds
-- vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
--   pattern = '*',
--   command = 'set foldmethod=indent',
-- })
--
-- Here is where you require your plugins.
require('lazy').setup({}, {
  ui = {
    -- If you're not seeing what's inside the quotation marks
    -- you might need to install a nerd font(JetBrains Mono is the most common)
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree reveal right<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    filesystem = {
      filtered_items = {
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['t'] = 'open_tabnew',
        },
        width = 26,
      },
    },
    buffers = {
      window = {
        mappings = {
          ['ntx'] = 'buffer_delete',
          ['<Tab>'] = 'navigate_up',
          ['.'] = 'set_root',
        },
      },
    },
  },
}

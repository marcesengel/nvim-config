return { {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    icons = {
      -- Configure the base icons on the bufferline.
      buffer_index = false,
      buffer_number = false,
      button = '',
      filetype = {
        -- Requires `nvim-web-devicons` if `true`
        enabled = true,
      },
      separator = { left = '', right = '▕' },

      -- Configure the icons on the bufferline when modified or pinned.
      -- Supports all the base icon options.
      modified = { button = '●' },
      pinned = { buffer_index = true, filename = true, button = '', separator = { right = '▕', left = '' } },

      -- Configure the icons on the bufferline based on the visibility of a buffer.
      -- Supports all the base icon options, plus `modified` and `pinned`.
      alternate = { filetype = { enabled = false } },
      current = { buffer_index = false },
      inactive = { button = '', separator = { left = '', right = '▕' } },
      visible = { modified = { buffer_number = false } },
    },
    sidebar_filetypes = {
      ['neo-tree'] = { event = 'BufWipeout' },
    },
    -- icon_pinned = '󰐃',
    exclude_ft = { 'netrw' },
    -- closable = false,
    highlight_visible = false,
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
}

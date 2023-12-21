return {
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup {
        pickers = {
          find_files = {
            hidden = true
          },
          grep_string = {
            hidden = true
          }
        }
      }

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>pf', builtin.git_files, {})
      vim.keymap.set('n', '<leader>ps', function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") });
      end)
    end,
    tag = '0.1.4',
    dependencies = {
      'nvim-lua/plenary.nvim' }
  },
}

return {
  { 'christianchiarulli/nvcode-color-schemes.vim', priority = 1000 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons',                 config = true },
  {
    'rhysd/git-messenger.vim',
    cmd = 'GitMessenger',
    keys =
    '<leader>gm'
  },
  { 'nvim-treesitter/playground', dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  {
    'windwp/nvim-ts-autotag',
    dependencies = {
      'nvim-treesitter/nvim-treesitter' },
    config = true
  },
  { 'mbbill/undotree',            keys = { { '<leader>u', vim.cmd.UndotreeToggle } } },
  { 'tpope/vim-fugitive',         keys = { { '<leader>gs', vim.cmd.Git } } },
  {
    'nvim-lualine/lualine.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons' }
  },
  { 'lewis6991/gitsigns.nvim',            config = true,                      tag = 'release' },
  {
    'kylechui/nvim-surround',
    version = '*',
    event = 'VeryLazy',
    config = function()
      require('nvim-surround').setup({
      })
    end
  },
  { 'chrisgrieser/nvim-various-textobjs', opts = { useDefaultKeymaps = true } },
  { 'ThePrimeagen/vim-be-good' },
  {
    'chrisgrieser/nvim-genghis',
    dependencies = 'stevearc/dressing.nvim',
    config = function()
      local keymap = vim.keymap.set
      local genghis = require("genghis")
      keymap("n", "<leader>yp", genghis.copyFilepath)
      keymap("n", "<leader>yn", genghis.copyFilename)
      keymap("n", "<leader>cx", genghis.chmodx)
      keymap("n", "<leader>rf", genghis.renameFile)
      keymap("n", "<leader>mf", genghis.moveAndRenameFile)
      keymap("n", "<leader>nf", genghis.createNewFile)
      keymap("n", "<leader>yf", genghis.duplicateFile)
      keymap("n", "<leader>df", genghis.trashFile) -- default: "$HOME/.Trash".
      keymap("x", "<leader>x", genghis.moveSelectionToNewFile)
    end
  }
}

return {
  { 'christianchiarulli/nvcode-color-schemes.vim', priority = 1000 },
  {
    'tpope/vim-eunuch',
    cmd = { 'Remove', 'Delete', 'Move', 'Rename', 'Copy', 'Duplicate', 'Chmod', 'Mkdir', 'Cfind', 'Clocate', 'Lfind',
      'Llocate', 'Wall', 'SudoWrite', 'SudoEdit' }
  },
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
}

return {
  { 'christianchiarulli/nvcode-color-schemes.vim', priority = 1000 },
  { 'xiyaowong/transparent.nvim',                  config = true,                                       priority = 999 },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons',                 config = true },
  { 'nvim-treesitter/playground',                  dependencies = { 'nvim-treesitter/nvim-treesitter' } },
  { 'mbbill/undotree',                             keys = { { "<leader>u", vim.cmd.UndotreeToggle } } },
  { 'tpope/vim-fugitive',                          keys = { { "<leader>gs", vim.cmd.Git } } },
  {
    'nvim-lualine/lualine.nvim',
    opts = {},
    dependencies = {
      'nvim-tree/nvim-web-devicons' }
  },
  { 'lewis6991/gitsigns.nvim', config = true, tag = 'release' },
}

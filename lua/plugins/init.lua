return {
  { 'rose-pine/neovim',     name = 'rose-pine', tag = 'v1.1.0', priority = 1000 },
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    dependencies = {
      'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  { 'nvim-treesitter/playground' },
  { 'theprimeagen/harpoon' },
  { 'mbbill/undotree' },
  { 'tpope/vim-fugitive' },
  { 'nvim-lualine/lualine.nvim',       opts = {},          dependencies = { 'nvim-tree/nvim-web-devicons' } },
  { 'lewis6991/gitsigns.nvim',         config = true,      tag = 'release' },
  { 'nvim-tree/nvim-web-devicons',     config = true },
}

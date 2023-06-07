return {
	{ 'rose-pine/neovim', name = 'rose-pine', priority = 1000 },
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.1', dependencies = { 'nvim-lua/plenary.nvim' } },
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
	{ 'nvim-treesitter/playground' },
	{ 'theprimeagen/harpoon' },
	{ 'mbbill/undotree' },
	{ 'tpope/vim-fugitive' }
}

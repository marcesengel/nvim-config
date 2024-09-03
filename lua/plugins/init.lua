local oil_hidden_names = {
  ['.DS_Store'] = true,
  ['.git'] = true,
  ['.nx'] = true,
  ['.astro'] = true,
  ['.idea'] = true,
  ['.vscode'] = true
}

return {
  { 'Mofiqul/vscode.nvim',         priority = 1000, opts = {} },
  { 'nvim-lua/plenary.nvim' },
  { 'nvim-tree/nvim-web-devicons', opts = {} },
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
    opts = {}
  },
  { 'mbbill/undotree',            keys = { { '<leader>u', vim.cmd.UndotreeToggle } } },
  { 'tpope/vim-fugitive',         keys = { { '<leader>gs', vim.cmd.Git } } },
  {
    'nvim-lualine/lualine.nvim',
    opts = { options = { theme = 'vscode' } },
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'Mofiqul/vscode.nvim' }
  },
  { 'lewis6991/gitsigns.nvim',            opts = {},                          tag = 'release' },
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
    'stevearc/oil.nvim',
    opts = {
      keymaps = {
        ["<C-p>"] = false,
        ["<C-v>"] = "actions.preview",
      },
      view_options = {
        show_hidden = true,
        is_always_hidden = function(name, bufnr)
          return oil_hidden_names[name]
        end
      }
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
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
  },
  { "shortcuts/no-neck-pain.nvim", opts = { width = 110, autocmds = { enableOnVimEnter = true } } }
}

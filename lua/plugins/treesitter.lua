return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
      parser_config.cypher = {
        install_info = {
          url = "https://github.com/taekwombo/tree-sitter-cypher",
          files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
          branch = "master",
          generate_requires_npm = true,
          requires_generate_from_grammar = false,
        }
      }

      require 'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "typescript", "tsx", "rust", "html",
          "css", "scss", "svelte", "cypher" },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        highlight = {
          enable = true,

          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
      }
    end,
    build = ':TSUpdate'
  },
}

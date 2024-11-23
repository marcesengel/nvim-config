return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    config = function()
      local lsp = require("lsp-zero")

      lsp.preset("recommended")

      lsp.ensure_installed({
        'tsserver',
        'rust_analyzer',
        'cypher_ls',
        'tailwindcss'
      })

      -- Fix Undefined global 'vim'
      lsp.nvim_workspace()


      local cmp = require('cmp')
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_mappings = lsp.defaults.cmp_mappings({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      })

      cmp_mappings['<Tab>'] = nil
      cmp_mappings['<S-Tab>'] = nil

      lsp.setup_nvim_cmp({
        mapping = cmp_mappings
      })

      lsp.set_preferences({
        suggest_lsp_servers = true,
        sign_icons = {
          error = 'E',
          warn = 'W',
          hint = 'H',
          info = 'I'
        }
      })

      lsp.on_attach(function(client, bufnr)
        local opts = { buffer = bufnr, remap = false }

        -- make sure you use clients with formatting capabilities
        -- otherwise you'll get a warning message
        -- if client.name == "dprint" then
        --   require('lsp-format').on_attach(client)
        --  print("Client: " .. client.name)
        -- end

        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
      end)

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000,
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['rust_analyzer'] = { 'rust' },
          ['pylsp'] = { 'python' },
          ['null-ls'] = { 'typescript', 'typescriptreact', 'javascript', 'json', 'html', 'svelte', 'astro', 'go' }
        }
      })

      local lspconfig = require("lspconfig")

      -- eslint
      local eslint_root_file = {
        '.eslintrc',
        '.eslintrc.js',
        '.eslintrc.cjs',
        '.eslintrc.yaml',
        '.eslintrc.yml',
        '.eslintrc.json',
        'eslint.config.js',
        'eslint.config.mjs'
      }

      local util = require 'lspconfig.util'
      lspconfig.eslint.setup({
        root_dir = function(fname)
          eslint_root_file = util.insert_package_json(eslint_root_file, 'eslintConfig', fname)
          return util.root_pattern(unpack(eslint_root_file))(fname)
        end,
        on_new_config = function(config, new_root_dir)
          -- The "workspaceFolder" is a VSCode concept. It limits how far the
          -- server will traverse the file system when locating the ESLint config
          -- file (e.g., .eslintrc).
          config.settings.workspaceFolder = {
            uri = new_root_dir,
            name = vim.fn.fnamemodify(new_root_dir, ':t'),
          }

          -- Support flat config
          if vim.fn.filereadable(new_root_dir .. '/eslint.config.js') == 1
              or vim.fn.filereadable(new_root_dir .. '/eslint.config.mjs') == 1 then
            config.settings.experimental.useFlatConfig = true
          end

          -- Support Yarn2 (PnP) projects
          local pnp_cjs = util.path.join(new_root_dir, '.pnp.cjs')
          local pnp_js = util.path.join(new_root_dir, '.pnp.js')
          if util.path.exists(pnp_cjs) or util.path.exists(pnp_js) then
            config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
          end
        end,
      })

      lspconfig.jsonls.setup({
        filetypes = { "json", "jsonc" },
        settings = {
          json = {
            -- Schemas https://www.schemastore.org
            schemas = {
              {
                fileMatch = { "package.json" },
                url = "https://json.schemastore.org/package.json"
              },
              {
                fileMatch = { "tsconfig*.json" },
                url = "https://json.schemastore.org/tsconfig.json"
              },
              {
                fileMatch = {
                  ".prettierrc",
                  ".prettierrc.json",
                  "prettier.config.json"
                },
                url = "https://json.schemastore.org/prettierrc.json"
              },
              {
                fileMatch = { ".eslintrc", ".eslintrc.json" },
                url = "https://json.schemastore.org/eslintrc.json"
              },
              {
                fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
                url = "https://json.schemastore.org/babelrc.json"
              },
              {
                fileMatch = { "lerna.json" },
                url = "https://json.schemastore.org/lerna.json"
              },
              {
                fileMatch = { "now.json", "vercel.json" },
                url = "https://json.schemastore.org/now.json"
              },
              {
                fileMatch = {
                  ".stylelintrc",
                  ".stylelintrc.json",
                  "stylelint.config.json"
                },
                url = "http://json.schemastore.org/stylelintrc.json"
              }
            }
          }
        }
      })

      lspconfig.tailwindcss.setup({})
      lspconfig.cypher_ls.setup({})

      lsp.setup()

      vim.diagnostic.config({
        virtual_text = true
      })
    end,
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {
        -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'lukas-reineke/lsp-format.nvim' },

      -- ESlint/Dprint etc.
      {
        'jose-elias-alvarez/null-ls.nvim',
        config = function()
          local null_ls = require("null-ls")
          local h = require("null-ls.helpers")
          local u = require("null-ls.utils")

          null_ls.setup({
            sources = {
              null_ls.builtins.formatting.gofmt,
              null_ls.builtins.formatting.prettier.with({
                bin = 'prettier',
                filetypes = {
                  'javascript', 'typescript', 'typescriptreact', 'json', 'html', 'svelte', 'astro'
                },
                generator_opts = {
                  command = "prettier",
                  args = h.range_formatting_args_factory({
                    "--stdin-filepath",
                    "$FILENAME",
                  }, "--range-start", "--range-end", { row_offset = -1, col_offset = -1 }),
                  to_stdin = true,
                  dynamic_command = h.cache.by_bufnr(function(params)
                    return u.path.join(params.root, "node_modules", ".bin", params.command)
                  end), -- cmd_resolver.from_node_modules(),
                  cwd = h.cache.by_bufnr(function(params)
                    return u.root_pattern(
                    -- https://prettier.io/docs/en/configuration.html
                      ".prettierrc",
                      ".prettierrc.json",
                      ".prettierrc.yml",
                      ".prettierrc.yaml",
                      ".prettierrc.json5",
                      ".prettierrc.js",
                      ".prettierrc.cjs",
                      ".prettierrc.mjs",
                      ".prettierrc.toml",
                      "prettier.config.js",
                      "prettier.config.cjs",
                      "prettier.config.mjs"
                    )(params.bufname)
                  end),
                }
              })
            },
          })
        end,
        dependencies = { 'nvim-lua/plenary.nvim' }
      },
    }
  }
}

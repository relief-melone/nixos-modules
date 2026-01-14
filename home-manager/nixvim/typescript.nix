{ pkgs, config, nixvim, lib, ...}:

{

  imports = [
    ./plugins/nvim-dap-vscode-js.nix
  ];

  programs.nixvim = {
    plugins.lsp.servers = {
      ts_ls.enable   = true;
      vue_ls.enable  = true;
      pug.enable     = true;
      pug.package    = null;

      eslint = {
        enable = true;
        settings = {
          useFlatConfig = false;
        };
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      nvim-dap
    ];

    autoCmd = [{
      event = [ "BufWritePre" ] ;
      pattern = [ "*.tsx" "*.ts" "*.jsx" "*.js" "*.vue" ];
      command = "silent! EslintFixAll";
    }];

    # Vue Support
    # Non hybrid mode
    extraConfigLua = ''
      local vue_language_server_path = ${pkgs.vue-language-server}
      local tsserver_filetypes = { 'typescript', 'javascript', 'vue' }
      local lspconfig = vim.lsp.config

      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      local ts_ls_config = {
        init_options = {
          plugins = {
            vue_plugin
          }
        },
        filetypes = tsserver_filetypes,
      }

      local vue_ls_config = {}

      lspconfig('vue_ls', vue_ls_config)
      lspconfig('ts_ls', ts_ls_config)
      vim.lsp.enable({'tsls', 'vue_ls' })

      --[[
      lspconfig('volar', {
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
        settings = {
          typescript = {
            inlayHints = {
              enumMemberValues = {
                enabled = true,
              },
              functionLikeReturnTypes = {
                enabled = true,
              },
              propertyDeclarationTypes = {
                enabled = true,
              },
              parameterTypes = {
                enabled = true,
                suppressWhenArgumentMatchesName = true,
              },
              variableTypes = {
                enabled = true,
              },
            },
          },
        },
      })
      --]]

      lspconfig('ts_ls', {
        init_options = {
          plugins = {
            {
              name = "@vue/typescript-plugin",
              location = "/usr/local/lib/node_modules/typescript-vue-plugin",
              languages = { "vue" }
            },
          },
        },
        settings = {
          typescript = {
            tsserver = {
              useSyntaxServer = false,
            },
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = true,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = true,
              includeInlayPropertyDeclarationTypeHints = true,
              includeFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
      })
    '';

    # Hybrid mode
    #extraConfigLua = ''
    #  require('lspconfig').ts_ls.setup{
    #    init_options = {
    #      plugins = {
    #        {
    #          name = "@vue/typescript-plugin",
    #          location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
    #          languages = { "javascript", "typescript", "vue" }
    #        },
    #      },
    #    },
    #    filetypes = {
    #      "javascript",
    #      "typescript",
    #      "vue",
    #    },
    #  }
    #'';
  };
}

{ pkgs, config, nixvim, lib, ...}:

{

  imports = [
    ./plugins/nvim-dap-vscode-js.nix
  ];

  programs.nixvim = {
    plugins.lsp.servers = {
      ts_ls.enable   = true;
      volar.enable   = true;
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

      local lspconfig = vim.lsp.config

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

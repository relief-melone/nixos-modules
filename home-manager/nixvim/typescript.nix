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
      pattern = [ "*.tsx" "*.ts" "*.jsx" "*.js" ];
      command = "silent! EslintFixAll";
    }];

    # Vue Support
    extraConfigLua = ''
      local lspconfig = require('lspconfig')

      lspconfig.volar.setup{
        filetypes = { 'vue', 'typescript', 'javascript', 'json' },
        init_options = {
          vue = {
            hybridMode = false,
          },
        },
      },
    '';
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

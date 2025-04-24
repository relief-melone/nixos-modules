{ pkgs, config, nixvim, lib, ...}:
{
  programs.nixvim = {
    plugins.lsp.servers = {
      ts_ls.enable   = true;
      volar.enable      = true;

      eslint = {
        enable = true;
        settings = {
          useFlatConfig = false;
        };
      };
    };

    plugins.lazy = {
      enable = true;
      #plugins = {
      #  dev = true;
      #  dir = "mfussenegger/nvim-dap";
      #}; 
    }; 

    #plugins.packer = {
    #  enable = true;
    #  plugins = [
    #    {
    #      name = "msxdev/nvim-dap-vscode-js";
    #      requires = "mfussenegger/nvim-dap";
    #    }
    #    {
    #      name = "microsoft/vscode-js-debug";
    #      opt = true;
    #      run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out";
    #    }
    #  ];
    #};

    extraPlugins = with pkgs.vimPlugins; [
      nvim-dap
    ];

    extraConfigLua = ''
      local dap_vscode_js = require("dap-vscode-js")
      local languages = { "typescript", "javascript", "vue" }

      dap_vscode_js.setup({
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }
      })

      -- DEBUG CONFIG TYPESCRIPT
      for _, lang in ipairs(languages) do
        dap.configurations[lang] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "dist/''${fileBasenameNoExtension}.js",
            cwd = "''${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "Attach to process",
            processId = require'dap.utils'.pick_process,
            cwd = "''${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Run Application",
            program = "dist/index.js",
            cwd = "''${workspaceFolder}",
          },
          {
            type = "pwa-node",
            request = "launch",
            name = "Run npm test",
            program = "node_modules/mocha/bin/_mocha",
            cwd = "''${workspaceFolder}",
          }
        }
      end
      -- DEBUG CONFIG JAVASCRIPT
    '';

    autoCmd = [{
      event = [ "BufWritePre" ] ;
      pattern = [ "*.tsx" "*.ts" "*.jsx" "*.js" ];
      command = "silent! EslintFixAll";
    }];
  };
}

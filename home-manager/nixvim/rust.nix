# lldb needs to be installed. At the time of writing lldb_18 was installed
{ ... }:
{
  programs.nixvim = {
    plugins = {
      rustaceanvim = {
        enable = true;
      };

      lsp = {
        inlayHints = true;
        servers = {
          rust_analyzer = {
            enable = false;
            installCargo = true;
            installRustc = true;
          };
        };

        onAttach = ''
        '';

      };
    };
    extraConfigLua = ''
        -- local rust_analyzer = require("lspconfig").rust_analyzer


        -- DEBUG RUST
        dap.adapters.lldb = {
          type = 'executable',
          command = '/run/current-system/sw/bin/lldb-vscode',
          name = 'lldb'
        }

        dap.adapters.gdb = {
          type = "executable",
          command = "gdb",
          args = { "-i", "dap" }
        }

        -- DEBUG CONFIG RUST
        dap.configurations.rust = {
          {
            name = 'Launch Debug Target',
            type = 'lldb',
            request = 'launch',
            program = "target/debug/''${workspaceFolderBasename}",
            cwd = "''${workspaceFolder}",
            stopOnEntry = false,
            args = {},
          },
        }
    '';

    keymaps = [
      
    ];
  };
}


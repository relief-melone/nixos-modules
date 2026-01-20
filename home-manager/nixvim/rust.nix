{ pkgs, ... }:
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
        -- DEBUG RUST
        dap.adapters.lldb = {
          type = 'executable',
          command = '{pkgs.lldb}/bin/lldb-dap',
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


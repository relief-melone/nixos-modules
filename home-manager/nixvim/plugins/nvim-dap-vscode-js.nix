{ pkgs, system, ... }:
{
  programs.nixvim.extraPlugins = with pkgs.vimPlugins; [
    nvim-dap-vscode-js
  ];

  programs.nixvim.extraConfigLua = ''
    local dap = require("dap")
    local dap_vscode_js = require("dap-vscode-js")
    local languages = { "javascript" }

    dap_vscode_js.setup({
      debugger_path = "${pkgs.vimPlugins.vscode-js-debug}", 
      adapters = { 'pwa-node' }
    })
  
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = "''${port}",
      executable = {
        command = 'node',
        args = {
          "${pkgs.vimPlugins.vscode-js-debug}/out/js-debug",
          "''${port}",
        },
      },
    }


    for _, language in ipairs(languages) do
      dap.configurations[language] = {
        {
          name = "Launch File",
          type = "pwa-node",
          request = "launch",
          program = "''${file}",
          cwd = "''${workspaceFolder}",
          args = { "''${file}" },
          sourceMaps = true,
          sourceMapPathOverrides = {
            ["./*"] = "''${workspaceFolder}/dist/*"
          },
        },
      }
    end
  '';
}

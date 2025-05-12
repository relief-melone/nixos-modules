{ pkgs, system, ... }:
let
  nvim-dap-vscode-js = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-dap-vscode-js";
    version = "v1.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "mxsdev";
      repo = "nvim-dap-vscode-js";
      rev = "v1.1.0";
      sha256 = "sha256-lZABpKpztX3NpuN4Y4+E8bvJZVV5ka7h8x9vL4r9Pjk=";
    };


    dependencies = with pkgs.vimPlugins; [
      vscode-js-debug
      nvim-dap
    ];
  };

in
{
  programs.nixvim.extraPlugins = [
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
          "${pkgs.vimPlugins.vscode-js-debug}/out/src/dapDebugServer.js",
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

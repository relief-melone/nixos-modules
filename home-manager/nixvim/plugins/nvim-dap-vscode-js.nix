{ pkgs, system, ... }:
let
  nodejs = pkgs.nodejs_20;
  src = pkgs.fetchFromGitHub {
    owner = "relief-melone";
    repo = "vscode-js-debug";
    rev = "feature.v1.100.0-vimPlugin";
    sha256 = "sha256-CeAAzwPUiRyjsAiLCUb0fcyAvbJWaPgeKNAdYfTf4+c=";
  };

  nodePkgs = import "${src}/default.nix" { inherit pkgs system nodejs; };
  nodeDependencies = ( nodePkgs // { inherit pkgs; }).nodeDependencies;

  vscode-js-debug = pkgs.vimUtils.buildVimPlugin {
    inherit src;

    pname = "vscode-js-debug";
    version = "v1.97.0";

    nativeBuildInputs = [ nodejs ];

    buildPhase = ''
      ln -s ${nodeDependencies}/lib/node_modules ./node_modules

      export PATH="${nodeDependencies}/bin:$PATH"
      export XDG_CACHE_HOME=$(pwd)/node-gyp-cache

      npx gulp dapDebugServer

      mv ./dist out
    '';
  };

  nvim-dap-vscode-js = pkgs.vimUtils.buildVimPlugin {
    pname = "nvim-dap-vscode-js";
    version = "v1.1.0";

    src = pkgs.fetchFromGitHub {
      owner = "mxsdev";
      repo = "nvim-dap-vscode-js";
      rev = "v1.1.0";
      sha256 = "sha256-lZABpKpztX3NpuN4Y4+E8bvJZVV5ka7h8x9vL4r9Pjk=";
    };


    dependencies = [
      vscode-js-debug
      pkgs.vimPlugins.nvim-dap
    ];
  };

in
{
  programs.nixvim.extraPlugins = [
    vscode-js-debug
    nvim-dap-vscode-js
  ];

  programs.nixvim.extraConfigLua = ''
    local dap = require("dap")
    local dap_vscode_js = require("dap-vscode-js")
    local languages = { "javascript" }

    dap_vscode_js.setup({
      debugger_path = "${vscode-js-debug}", 
      adapters = { 'pwa-node' }
    })
  
    dap.adapters['pwa-node'] = {
      type = 'server',
      host = 'localhost',
      port = "''${port}",
      executable = {
        command = 'node',
        args = {
          "${vscode-js-debug}/out/src/dapDebugServer.js",
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

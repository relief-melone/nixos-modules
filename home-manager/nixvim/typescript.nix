{ pkgs, config, nixvim, lib, ...}:

{

  imports = [
    ./plugins/nvim-dap-vscode-js.nix
  ];

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

    extraPlugins = with pkgs.vimPlugins; [
      nvim-dap
    ];

    autoCmd = [{
      event = [ "BufWritePre" ] ;
      pattern = [ "*.tsx" "*.ts" "*.jsx" "*.js" ];
      command = "silent! EslintFixAll";
    }];
  };
}

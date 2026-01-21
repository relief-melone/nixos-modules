{ pkgs, ... }:
{
  programs.nixvim = {

    extraPlugins = with pkgs.vimPlugins; [
      nvim-dap-python
    ];

    lsp.servers.basedpyright.enable = true;

    extraConfigLua = ''
      require("dap-python").setup("python3")

      dap.configurations.python = {
        name = 'Launch Python',
        request = 'launch',
        type = 'python',
        program = "''${file}"
      }
    '';
  };
}

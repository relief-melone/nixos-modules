{ pkgs, lib, ...}:
{
  programs.nixvim = {
    lsp.servers.terraformls.enable = lib.mkDefault true;

    plugins.conform-nvim = {
      enable = lib.mkDefault true;
      settings = {
        formatters_by_ft = {
          terraform = [ "terraform_fmt" ];
          hcl = [ "terraform_fmt" ];
        };

        format_on_save = {
          lsp_fallback = true;
          timeoput_ms = 500;
        };
      };
    };
  };
}

{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      filter.sops-yaml = {
        clean = "${pkgs.sops}/bin/sops --encrypt --input-type yaml --output-type yaml /dev/stdin";
        smudge = "${pkgs.sops}/bin/sops --decrypt --input-type yaml --output-type yaml /dev/stdin";
        required = true;
      };

      diff.sops-yaml = {
        textconv = "${pkgs.sops}/bin/sops --decrypt 2>/dev/null || cat";
      };
    };
  };
}

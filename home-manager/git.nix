{ config, pkgs, lib, vars, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      filter.sops-yaml = {
        clean = "${pkgs.sops}/bin/sops --encrypt --input-type yaml --output-type yaml /dev/stdin";
        smudge = "${pkgs.sops}/bin/sops --decrypt /dev/stdin";
        required = true;
      };
    };
  };
}

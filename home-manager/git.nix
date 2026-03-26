{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      filter.sops-yaml = {
        clean = "TEXT=$(cat /dev/stdin); ${pkgs.sops}/bin/sops --encrypt --input-type yaml --output-type yaml \"$TEXT\" 2> /dev/null || echo \"$TEXT\"";
        smudge = "cat";
        #smudge = "${pkgs.sops}/bin/sops --decrypt --input-type yaml --output-type yaml /dev/stdin";
        required = true;
      };

      diff.sops-yaml = {
        textconv = "${pkgs.sops}/bin/sops --decrypt  --input-type yaml --output-type yaml 2>/dev/null || cat";
      };
    };
  };
}

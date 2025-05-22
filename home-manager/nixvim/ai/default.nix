{ lib, ... }:
{
  imports = [
    # Using Copilot for now
    # ./codecompanion.nix
  ];

  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      settings.sources = {
        providers.copilot = {
          async = true;
          module = "blink-cmp-copilot";
          name = "copilot";
          score_offset = 100;
        };
        default = [
          "copilot"
        ];
      };
    };
  };
}

{ config, pkgs, ... }:
{
  # use EFI
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
  };
}



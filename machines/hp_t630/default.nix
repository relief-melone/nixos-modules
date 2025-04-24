{ config, pkgs, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];
  # use EFI
  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 20;
    };
  };
}



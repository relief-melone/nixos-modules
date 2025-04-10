{ config, pkgs, ... }:
{

  imports = [
    ./hardware-configuration.nix
  ];
  # use legacy boot
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

}



{
  description = "Reusable modules for NixOS configurations";

  outputs = { self, ... }:{
    nixosModules.hm-nixvim = import ./home-manager/nixvim;
  };
}

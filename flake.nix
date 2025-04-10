{
  description = "Reusable modules for NixOS configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:{
    nixosModules.hm-nixvim = import ./home-manager/nixvim;
    nixosModules.home-manager.starship = import ./home-manager/starship.nix;
    nixosModules.home-manager.bash = import ./home-manager/bash.nix;
  };
}

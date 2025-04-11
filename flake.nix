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
    # home-manager 
    nixosModules.home-manager.bash = import ./home-manager/bash.nix;
    nixosModules.home-manager.git = import ./home-manager/git.nix;
    nixosModules.home-manager.nixvim = import ./home-manager/nixvim;
    nixosModules.home-manager.starship = import ./home-manager/starship.nix;
    nixosModules.home-manager.vscode = import ./home-manager/vscode.nix;
    
    # machines
    nixosModules.machines.hp_t620 = import ./machines/hp_t620;
    nixosModules.machines.hp_t630 = import ./machines/hp_t630;

    # network
    nixosModules.network.certificates = import ./network/certificates.nix;

    nixosModules.nixvim = nixvim.nixosModules.nixvim ( import ./home-manager/nixvim );
  };
}

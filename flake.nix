{
description = "boron nixos flake";

inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixcs-hardware.url = "github:nixos/nixos-hardware/master";
};

outputs = {self, nixpkgs, home-manager}@inputs:
{
nixosConfigurations.boron = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                };
                modules = [
                    ./boronConfig.nix
                    inputs.home-manager.nixosModules.default
                    inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t14-amd-gen3
                ];
            };
}

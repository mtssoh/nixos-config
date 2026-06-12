{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-wsl.url = "github:nix-community/NixOS-WSL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, nixos-wsl, home-manager, stylix, ... }: {
    nixosConfigurations = {
      nix-wsl = nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        modules =[
          nixos-wsl.nixosModules.default
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./nix-wsl/configuration.nix
        ];
      };

      nix-mach = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          home-manager.nixosModules.home-manager
          stylix.nixosModules.stylix
          ./nix-mach/configuration.nix
        ];
      };
    };
  };
}

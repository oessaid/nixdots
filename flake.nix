{
  description = "NixOS configuration flake";

  inputs = {
    # Default to the nixos-unstable branch
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Latest stable branch of nixpkgs, used for version rollback
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = { 
      url = "github:hyprwm/Hyprland"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = { 
      url = "github:nix-community/nixvim"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { 
    self, 
    nixpkgs, 
    nixpkgs-stable, 
    home-manager,
    hyprland,
    nixvim,
    ... 
  }@inputs: {
    nixosConfigurations = {
      homenix = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";

        # Passes the non-default nixpkgs instances to other nix modules
        specialArgs = { inherit inputs; };

        modules = [
          # Import the previous configuration.nix we used,
          # so the old configuration file still takes effect
          ./configuration.nix

          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically 
	  # when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.oessaid = {
              imports = [
                ./home
              ];
            };
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
        ];
      };
    };
  };
}

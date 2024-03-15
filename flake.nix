{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      url = "github:hyprwm/Hyprland";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprpaper = {
      url = "github:hyprwm/hyprpaper";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # hyprlock = {
    #   url = "github:hyprwm/Hyprlock";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Temporary until this is merged:
    # https://github.com/nix-community/nixGL/pull/152
    nixgl = {
      url = "github:oessaid/nixGL/2c7b07c43221f46ae6fedeaee9947a155720ebce";
      # url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, hyprland, hyprpaper,
    # hyprlock,
    nixvim, nixgl, ... }@inputs: {
      # Available through `nixos-rebuild --flake .#host switch`
      nixosConfigurations = {
        homenix = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/homenix/configuration.nix
            # make home-manager a module of nixos,
            # deploy home-manager alongside nixos
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.oessaid = {
                imports = [ ./hosts/homenix/home.nix ];
              };
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };

        mobilenix = nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./hosts/mobilenix/configuration.nix
            # make home-manager a module of nixos,
            # deploy home-manager alongside nixos
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.oessaid = {
                imports = [ ./hosts/mobilenix/home.nix ];
              };
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
          ];
        };
      };
    };
}

{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
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
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Temporary until this is merged:
    # https://github.com/nix-community/nixGL/pull/152
    nixgl = {
      url = "github:cmm/nixGL/main";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    hyprland,
    hyprpaper,
    nixvim,
    nixgl,
    ...
  } @ inputs: {
    # Available through `nixos-rebuild --flake .#host switch`
    nixosConfigurations = {
      homenix = nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        specialArgs = {inherit inputs;};
        modules = [
          ./hosts/homenix/configuration.nix
          # make home-manager a module of nixos,
          # deploy home-manager alongside nixos
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.oessaid = {
              imports = [
                ./hosts/homenix/home.nix
              ];
            };
            home-manager.extraSpecialArgs = {inherit inputs;};
          }
        ];
      };
    };

    # Available through `home-manager --flake .#user@host switch`
    homeConfigurations = {
      worknix = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          overlays = [nixgl.overlay];
        };
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/worknix/home.nix
        ];
      };
    };
  };
}

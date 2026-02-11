let
  version = "25.11";
in
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-${version}";
    home-manager = {
      url = "github:nix-community/home-manager/release-${version}";
      inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ... }@inputs:
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        nixos/configuration.nix
      ];

      home-manager.nixosModules.home-manager
      {
        home-manager.useGLobalPkgs = true;
	home-manager.useUserPackages = true;

	home-manager.users.user = import home-manager/user/home.nix;
      }
    };
  };
}

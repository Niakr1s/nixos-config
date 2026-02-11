let
  version = "25.11";
in
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-${version}";
  };

  outputs = { self, nixpkgs, ... }@inputs: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      modules = [
        /srv/nixos-config/nixos/configuration.nix
      ];
    };
  };
}

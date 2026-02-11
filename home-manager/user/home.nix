{ config, pkgs, ... }:

{
  imports = [
    ./plasma-manager.nix
  ];
  
  home.packages = with pkgs; [
    mpv
  ];
}

{ config, pkgs, ... }:

{
  imports = [
  ];

  home.stateVersion = "25.11";
  
  home.packages = with pkgs; [
    mpv
  ];
}

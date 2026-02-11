{ config, pkgs, ... }:
let
  release = "25.11"; # set this according to iso version
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes" 
  ];

  system.stateVersion = release;
  time.timeZone = "Europe/Moscow";

  boot.loader.systemd-boot.enable = true;

  services.sshd.enable = true;

  users.users.user = {
    isNormalUser = true;
    home = "/home/user";
    uid = 1000;
    extraGroups = [
      "wheel"
      "newtorkmanager"
    ];
    hashedPassword = "$y$j9T$EodsGv.t999ySA0pSIUpL0$07kxIslBtsxd2HDWWmmUhM60G4in313bu.2Ym3Z1uA0";
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Desktop environment

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  services.desktopManager.plasma6.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    git
    wget
    tlrc
    gh
    mc
    xclip
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  programs.firefox = {
    enable = true;
    languagePacks = [ "en-US" ];

    policies = {
      AppAutoUpdate = false;
      BackgroundAppUpdate = false;

      DisableTelemetry = true;
    };
  };

  environment.variables = {
    EDITOR = "vim";
  };

  environment.shellAliases = {
    update = "sudo nixos-rebuild switch --flake /srv/nixos-config";
  };
}

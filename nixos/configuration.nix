{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz";
in
{
  imports = [
    # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix
    (import "${home-manager}/nixos")
  ];

  system.stateVersion = "25.11";
  time.timeZone = "Europe/Moscow";

  boot.loader.systemd-boot.enable = true;

  # services.sshd.enable = true;

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

  home-manager.users.user = {
    home.stateVersion = "25.11";
    imports = [
      ../home-manager/user/home.nix
    ];
  };

  nixpkgs.config = {
    allowUnfree = true;
  };

  # Desktop environment

  services.desktopManager.plasma6 = {
    enable = true;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    tlrc
    mc
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
    };
    # blesh.enable = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
  
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  programs.git = {
    enable = true;
    prompt.enable = true;
  };
}

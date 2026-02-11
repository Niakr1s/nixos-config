{ config, pkgs, ... }: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  system.stateVersion = "25.11";
  time.timeZone = "Europe/Moscow";

  boot.loader.systemd-boot.enable = true;

  # services.sshd.enable = true;

  users.users.nea = {
    isNormalUser = true;
    home = "/home/nea";
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
  ];

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
    blesh.enable = true;
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

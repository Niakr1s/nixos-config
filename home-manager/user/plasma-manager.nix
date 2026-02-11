{ pkgs, ... }:
let
  plasma-manager = builtins.fetchTarball "https://github.com/nix-community/plasma-manager/archive/trunk.tar.gz";
in
{
  imports = [
    "${plasma-manager}/modules"
  ];

  programs.plasma = {
    enable = true;
    workspace = {
      clickItemTo = "select";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    hotkeys.commands."launch-konsole" = {
      name = "Launch Konsole";
      key = "Meta+Alt+K";
      command = "konsole";
    };

    panels = [
      {
        location = "bottom";
	widgets = [
	  "org.kde.plasma.kickoff"
	  "org.kde.plasma.icontasks"
	  "org.kde.plasma.marginsseparator"
	  "org.kde.plasma.systemtray"
	  "org.kde.plasma.digitalclock"
	];
      }
    ];

    spectacle = {
      shortcuts.captureRectangularRegion = "Super+Shift+S";
    };

    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch To Last-Used Keyboard Layout" = "";
        "Switch To Next Keyboard Layout" = "Super+Space";
      };
    };

    input = {
      keyboard = {
        layouts = [
          {
            layout = "us";
	  }
          {
            layout = "ru";
	  }
        ];
        numlockOnStartup = "on";
      };
    };
  };
}

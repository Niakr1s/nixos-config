This is my configuration for nixos.

You should git clone it inside /srv/nixos-config
`git clone <repo> /srv/nixos-config`

Run chown command
`sudo chown -R user:wheel /srv/nixos-config`

Symlink configuration.nix to /etc/nixos/configuration.nix
`sudo ln -s /srv/nixos-config/nixos/configuration.nix /etc/nixos/configuration.nix`

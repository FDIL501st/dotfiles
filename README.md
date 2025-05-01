This is my configs backup.

Purpose is to make my life easier when I change machines or install a linux distro.


# Installation

Run the install script to get symlinks setup so your configurations are read.

### With Bash 
    bash install.sh 

### With fish
    fish install.fish 

Have not tested running install.sh with other posix compliant shells, like dash or zsh.

## Setting up plugins

### tmux
Start tmux and use the tpm install keybind: `ctrl-a, I`.

To update plugins, use: `ctrl-a, U`

##### Note: Don't use ctrl-a, alt-u to remove plugins. This will remove catppuccin theme as that is manually installed.

Got to [Github tpm repo](https://github.com/tmux-plugins/tpm) for more details on tpm.

### fisher

In fish terminal run:
```fish
fisher update
```
This will install (and update) all plugins from the fish_plugins folder.
No need to install fisher as the repo tracks the fisher files as well. This means that fisher comes "installed" with the repo.

Go to the [Github fisher repo](https://github.com/jorgebucaran/fisher) for more details on fisher.

### starship
To update, run the following command (same as starship installation command):
```sh
curl -sS https://starship.rs/install.sh | sh
```

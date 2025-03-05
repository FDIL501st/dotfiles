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

#### Current script outputs and errors

    stow: ERROR: The stow directory dotfiles does not contain package install.sh
    HEAD is now at bac9a94 Update bash install git clone.
    Cloning into '/home/fdil/.config/tmux/plugins/tpm'...
    remote: Enumerating objects: 1013, done.
    remote: Counting objects: 100% (385/385), done.
    remote: Compressing objects: 100% (87/87), done.
    remote: Total 1013 (delta 314), reused 298 (delta 298), pack-reused 628 (from 1)
    Receiving objects: 100% (1013/1013), 207.04 KiB | 1.09 MiB/s, done.
    Resolving deltas: 100% (666/666), done.
    fatal: destination path '/home/fdil/.config/tmux/plugins/tpm' already exists and is not an empty directory.



Though errors exist, at the moment, didn't find issues with installation and symlinks.

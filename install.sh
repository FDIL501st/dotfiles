 #!/bin/bash

if ! [ command -v stow 2>&1 > /dev/null ]; then
    echo "stow not found on system. Will be now installing it."
    sudo apt install stow
fi

# Putting dotfiles into correct place using GNU stow
stow --adpot *  # first create all symlinks, use adopt to not deal with issues of existing files
git reset --hard origin/main
# What happened here is when we used adopt, any files that already existed in our system would overwrite the ones in dotfiles.
# Then to make sure we got the correct versions of all our files, we reset to match what is on the Github repo

# Manually installed tmux plugins
mkdir -p ~/.config/tmux/plugins/catppuccin
mkdir -p ~/.config/tmux/plugins/tpm

# Install TPM and tmux catppuccin plugin, the other tmux plugins are installed using TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux


# Go to https://github.com/catppuccin/grub/tree/main for instructions on setting catppuccin theme for grub

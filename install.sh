 #!/bin/bash

if ! command -v stow &> /dev/null; then
    echo "stow not found on system. Will be now installing it."
    sudo apt install stow
fi
# TODO: Automatically figure out package manager in use
# will probably just be testing out package managers same way as testing if stow exists or not


# Putting dotfiles into correct place using GNU stow
stow --adopt *  # first create all symlinks, use adopt to not deal with issues of existing files
git reset --hard HEAD
# What happened here is when we used adopt, any files that already existed in our system would overwrite the ones in dotfiles.
# Then to make sure we got the correct versions of all our files, we reset to match what is on the Github repo

# actually run stow
stow .

# Before using git clone, need to make sure directories being cloned to don't exist
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
CATPUCCIN_TMUX_DIR="$HOME/.config/tmux/plugins/catppuccin/tmux"

[ -d $TPM_DIR ] && rm -rf $TPM_DIR
[ -d $CATPUCCIN_TMUX_DIR ] && rm -rf $CATPUCCIN_TMUX_DIR


# Install TPM and tmux catppuccin plugin, the other tmux plugins are installed using TPM
git clone https://github.com/tmux-plugins/tpm $TPM_DIR
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git $TPM_DIR


# Go to https://github.com/catppuccin/grub/tree/main for instructions on setting catppuccin theme for grub

#!/usr/bin/env fish

function command_exists
    if test (count $argv) -ne 1
        echo "Expected 1 argument for function command_exists"
        exit 2
    end
    
    if not type -q $argv[1]
        echo $argv[0] "command not found"
        exit 1
    end
end

function main
    command_exists "git"
    command_exists "stow"

    # Putting dotfiles into correct place using GNU stow
    stow --adopt .  # first create all symlinks, use adopt to not deal with issues of existing files
    git reset --hard
    # What happened here is when we used adopt, any files that already existed in our system would overwrite the ones in dotfiles.
    # Then to make sure we got the correct versions of all our files, we reset to match what is on the Github repo


    # Before using git clone for tmux stuff, need to make sure directories being cloned to don't exist
    set TPM_DIR "$HOME/.config/tmux/plugins/tpm"
    set CATPUCCIN_TMUX_DIR "$HOME/.config/tmux/plugins/catppuccin/tmux"

    if test -d "$TPM_DIR" 
        rm -rf "$TPM_DIR"
    end

    if test -d "$CATPUCCIN_TMUX_DIR"
        rm -rf "$CATPUCCIN_TMUX_DIR"
    end


    # Install tpm and tmux catppuccin plugin, the other tmux plugins are installed using tpm
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
    git clone -b v2.1.3 https://github.com/catppuccin/tmux.git "$CATPUCCIN_TMUX_DIR"

    # use ctrl-a + I to install tpm plugins within tmux later


    # Go to https://github.com/catppuccin/grub/tree/main for instructions on setting catppuccin theme for grub
end

# script start
main

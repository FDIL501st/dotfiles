 #!/bin/bash

# Manually installed tmux plugins
mkdir -p ~/.config/tmux/plugins/catppuccin
mkdir -p ~/.config/tmux/plugins/tpm

# Install TPM and tmux catppuccin plugin, the other tmux plugins are installed using TPM
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
git clone -b v2.1.2 https://github.com/catppuccin/tmux.git ~/.config/tmux/plugins/catppuccin/tmux




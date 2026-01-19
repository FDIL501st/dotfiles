function update-all --wraps='sudo dnf update -y && flatpak update -y' --description 'alias update-all sudo dnf update -y && flatpak update -y'
  sudo dnf update -y && flatpak update -y $argv
        
end

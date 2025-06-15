function update-all --wraps='sudo apt update -y && apt upgrade -y && flatpak update -y && nix profile upgrade --all' --description 'alias update-all sudo apt update -y && apt upgrade -y && flatpak update -y && nix profile upgrade --all'
  sudo apt update -y && apt upgrade -y && flatpak update -y && nix profile upgrade --all $argv
        
end

function update-all --wraps='update && flatpak update && nix profile upgrade --all' --description 'alias update-all update && flatpak update && nix profile upgrade --all'
  update && flatpak update && nix profile upgrade --all $argv
        
end

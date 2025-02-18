function update --wraps='sudo apt update && sudo apt upgrade' --description 'alias update=sudo apt update && sudo apt upgrade'
  sudo apt update && sudo apt upgrade $argv
        
end

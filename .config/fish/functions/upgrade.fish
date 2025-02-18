function upgrade --description 'alias upgrade=sudo apt update && sudo apt upgrade'
  sudo apt update && sudo apt upgrade $argv
        
end

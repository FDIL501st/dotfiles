if status is-interactive
    # Commands to run in interactive sessions can go here    
end

# Created by `pipx` on 2025-02-20 00:06:06
set PATH $PATH /home/fdil/.local/bin


# activate starship for fish
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

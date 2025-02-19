#!/usr/bin/env fish

function command_exists
    if test (count $argv) -ne 1
        echo "Expected 1 argument for function command_exists"
        exit 2

    if not type -q $argv[1]
        echo $argv[0] "command not found"
        exit 1
    end
end


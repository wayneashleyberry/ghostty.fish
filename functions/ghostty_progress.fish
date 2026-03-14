function ghostty_progress --description "Update Ghostty native progress bar"
    # Arguments: <state> <percentage>
    # States: 0 (Off), 1 (Standard), 2 (Error), 3 (Indeterminate)
    
    set -l state $argv[1]
    set -l percent $argv[2]

    # Default to '1' (running) if state is missing
    if test -z "$state"
        set state 1
    end

    # Default to '0' if percent is missing
    if test -z "$percent"
        set percent 0
    end

    # Handle tmux passthrough if needed
    if set -q TMUX
        printf "\ePtmux;\e\e]9;4;%s;%s\e\\\e\\" "$state" "$percent"
    else
        printf "\e]9;4;%s;%s\e\\" "$state" "$percent"
    end
end

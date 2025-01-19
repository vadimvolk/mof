function __mof_list_names_for_completion
    set names (_mof-get-names)
    printf '%s\n' $names
end

set -l commands 'save save-current goto delete list'
complete -c mof -f
complete -c mof -n "not __fish_seen_subcommand_from $commands" -a $commands
complete -c mof -n "not __fish_seen_subcommand_from delete" -a "(__mof_list_names_for_completion)"
complete -c mof -n "not __fish_seen_subcommand_from goto" -a "(__mof_list_names_for_completion)"

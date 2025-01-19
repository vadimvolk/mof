function mof
    function __mof_print_help
        echo "\
mof - Master of Folders.

mof [-h | --help]
mof <command>
Options:
    -h, --help
    Show this help message.

Commands:
    s, save             Save directory.
    sc, save-current    Save current directory.
    g, goto             Goto directory using it's name. If depth != 0 selection is made with fzf.
    d, delete           Delete entry by name or folder.
    l, list             List available entries.
"
    end

    switch $argv[1]
        case -h --help
            __mof_print_help
        case l
            _mof-list
        case list
            _mof-list
        case sc
            _mof-add $PWD $argv[2..]
        case save-current
            _mof-add $PWD $argv[2..]
        case s
            _mof-add $argv[2..]
        case save
            _mof-add $argv[2..]
        case d
            _mof-delete $argv[2..]
        case delete
            _mof-delete $argv[2..]
        case g
            _mof-goto $argv[2..]
        case goto
            _mof-goto $argv[2..]
        case '*'
            __mof_print_help
            return 1
    end
end

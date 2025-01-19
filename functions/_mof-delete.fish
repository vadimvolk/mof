function _mof-delete
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    if test (count $argv) -eq 0
        echo "Usage: mof delete <name>|<folder>" >&2
        return 2
    end
    set folders (_mof-get-folders)
    set depths (_mof-get-depths)
    set names (_mof-get-names)

    if not contains $argv[1] $names && not contains $argv[1] $folders
        echo Unable to find $argv[1] in names or folders
        return 3
    end

    if contains $argv[1] $names
        set remove_index (contains -i $argv[1] $names)
    else if contains $argv[1] $folders
        set remove_index (contains -i $argv[1] $folders)
    end
    set -e folders[$remove_index]
    set -e depths[$remove_index]
    set -e names[$remove_index]
    _mof-invalidate-cache
    rm -f $MOF_SOURCES
    touch $MOF_SOURCES
    if test (count $folders) = 0
        return 0
    end
    for index in (seq (count $folders))
        _mof-add $folders[$index] $depths[$index] $names[$index]
    end
end

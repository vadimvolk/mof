function _mof-add
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    if test (count $argv) -eq 0
        echo "Usage: mof_add_folder <folder> [depth default is 0] [custom name default is basename of folder]" >&2
        return 1
    end
    set folder $argv[1]
    if not test -d $folder
        echo "Unable to add folder $folder does not exist" >&2
        return 2
    end
    set folder (realpath $folder)
    if test (count $argv) -ge 2
        set depth $argv[2]
        if not string match --quiet --regex --entire '[0-9]+' $depth
            echo "Depth $depth is not a number, if you try to specify a custom name for a folder depth is mandatory" >&2
            return 3
        end
        if test $depth -lt 0
            echo "Wrong depth $depth, must be greater or equal 0" >&2
            return 4
        end
    else
        set depth 0
    end

    if test (count $argv) -ge 3
        set name $argv[3]
    else
        set name (basename $folder)
    end
    set names (_mof-get-names)
    set folders (_mof-get-folders)
    if contains $name $names
        set index (contains -i $name $names)
        echo "Folder name '$name' already used for folder '$folders[$index]', unable to add" >&2
        return 5
    end

    if contains $folder $folders
        set index (contains -i $folder $folders)
        echo "Folder $folder already added with name $names[$index]" >&2
        return 6
    end

    _mof-invalidate-cache
    echo $name $depth $folder >>$MOF_SOURCES
end

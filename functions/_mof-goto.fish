function _mof-goto
    set names (_mof-get-names)
    function __mof-goto-expand-navigate
        set names (_mof-get-names)
        set depths (_mof-get-depths)
        set folders (_mof-get-folders)
        for name in $argv
            set -l cur_index (contains -i $name $names)
            if test -z $cur_index
                echo "Failed to find index for $name in $names" >&2
                return 2
            end
            set sources_info $sources_info (_mof_expand_folder $folders[$cur_index] $depths[$cur_index] $names[$cur_index])
        end
        _mof-navigate $sources_info
        commandline -f repaint
    end

    if test (count $argv) -eq 1
        set -l source_name $argv[1]
        if not contains $source_name $names
            echo \'$source_name\' is not found in $names >&2
            return 1
        end
        __mof-goto-expand-navigate $source_name
    else
        __mof-goto-expand-navigate $names
    end
end

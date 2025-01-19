function _mof-navigate
    set sources_info $argv
    set folders (_mof-get-folders)
    set depths (_mof-get-depths)
    set names (_mof-get-names)
    if test (count $sources_info) -eq 1
        set -l source_info_parts (string split ':' $sources_info[1])
        set index (contains -i $source_info_parts[1] $names)
        cd $folders[$index]
        return
    end
    set -l source_info (printf '%s\n' $sources_info | fzf)
    if test -z $source_info
        return 0
    end
    set -l source_info_parts (string split ':' $source_info)
    set selected_index (contains -i $source_info_parts[1] $names)
    if test $selected_index -gt (count $names)
        echo (set_color red)Unable to find base folder for $source_info(set_color normal)
    end
    cd $folders[$selected_index]/$source_info_parts[2]
    commandline -f repaint
end

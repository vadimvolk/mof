function _mof_expand_folder
    set folder $argv[1]
    set depth $argv[2]
    set source_name $argv[3]
    if test $depth -eq 0
        echo $source_name:(string trim -c "/" $folder)
        return
    else
        set folders (find $folder -maxdepth $depth -depth $depth -type d)
    end
    for fl in $folders
        set relative_path (string replace -r $folder '' $fl)
        echo $source_name:(string trim -c "/" $relative_path)
    end
end

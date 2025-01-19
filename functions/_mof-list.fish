function _mof-list
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    set folders (_mof-get-folders)
    set depths (_mof-get-depths)
    set names (_mof-get-names)
    if test -z $folders[1]
        echo Empty list, please add folder with mof s >&2
        return 2
    end
    for index in (seq (count $folders))
        if test $depths[$index] -ge 1
            echo $names[$index]:$folders[$index] depth=$depths[$index]
        else
            echo $names[$index]:$folders[$index]
        end
    end
end

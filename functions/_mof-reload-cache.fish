function _mof-reload-cache
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    _mof-invalidate-cache
    for source_def in (cat $MOF_SOURCES)
        echo $source_def | read -d " " -l name depth folder
        set -g _MOF_NAMES_CACHE $_MOF_NAMES_CACHE $name
        set -g _MOF_FOLDERS_CACHE $_MOF_FOLDERS_CACHE $folder
        set -g _MOF_DEPTHS_CACHE $_MOF_DEPTHS_CACHE $depth
    end
end

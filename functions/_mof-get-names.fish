function _mof-get-names
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    if set -q _MOF_NAMES_CACHE
        printf '%s\n' $_MOF_NAMES_CACHE
        return
    end
    _mof-reload-cache
    printf '%s\n' $_MOF_NAMES_CACHE
end

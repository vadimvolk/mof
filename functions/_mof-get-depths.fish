function _mof-get-depths
    if test -z $MOF_SOURCES
        echo MOF_SOURCES is not defined or empty >&2
        return 1
    end
    if set -q _MOF_DEPTHS_CACHE
        printf '%s\n' $_MOF_DEPTHS_CACHE
        return
    end
    _mof-reload-cache
    printf '%s\n' $_MOF_DEPTHS_CACHE
end

source (status dirname)/../functions/_mof-add.fish
source (status dirname)/../functions/_mof-delete.fish
source (status dirname)/../functions/_mof-get-depths.fish
source (status dirname)/../functions/_mof-get-folders.fish
source (status dirname)/../functions/_mof-get-names.fish
source (status dirname)/../functions/_mof-invalidate-cache.fish
source (status dirname)/../functions/_mof-reload-cache.fish
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-delete tests
@test "Remove from empty" $status = 3
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname)
_mof-delete tests
@test "Remove last entry by name" $status = 0

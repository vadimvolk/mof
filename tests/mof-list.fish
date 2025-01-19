source (status dirname)/../functions/_mof-add.fish
source (status dirname)/../functions/_mof-list.fish
source (status dirname)/../functions/_mof-delete.fish
source (status dirname)/../functions/_mof-get-depths.fish
source (status dirname)/../functions/_mof-get-folders.fish
source (status dirname)/../functions/_mof-get-names.fish
source (status dirname)/../functions/_mof-invalidate-cache.fish
source (status dirname)/../functions/_mof-reload-cache.fish
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-list
@test "List from empty" $status = 2

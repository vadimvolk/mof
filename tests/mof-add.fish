source (status dirname)/../functions/_mof-add.fish
source (status dirname)/../functions/_mof-get-depths.fish
source (status dirname)/../functions/_mof-get-folders.fish
source (status dirname)/../functions/_mof-get-names.fish
source (status dirname)/../functions/_mof-invalidate-cache.fish
source (status dirname)/../functions/_mof-reload-cache.fish
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname)

set actual_depth (_mof-get-depths)
set actual_name (_mof-get-names)
set actual_folder (_mof-get-folders)
@test "Adding just folder - folder" $actual_folder = (status dirname)
@test "Adding just folder - depth" $actual_depth -eq 0
@test "Adding just folder - name" $actual_name = tests
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname)
_mof-add (status dirname)/fixtures/source1

set actual_depth (_mof-get-depths)
set actual_name (_mof-get-names)
set actual_folder (_mof-get-folders)
@test "Adding second folder - folder" $actual_folder[2] = (status dirname)/fixtures/source1
@test "Adding second folder - depth" $actual_depth[2] -eq 0
@test "Adding second folder - name" $actual_name[2] = source1
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname) 2

set actual_depth (_mof-get-depths)
@test "Adding folder with depth" $actual_depth -eq 2
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname) 0 custom_name

set actual_name (_mof-get-names)
@test "Adding with custom name" $actual_name = custom_name
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname) custom_name
@test "Depth is not a number" $status -eq 3
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
echo $MOF_SOURCES
_mof-add (status dirname) 0 name
_mof-add (status dirname)/fixtures/source1 0 name
@test "Duplicate name" $status -eq 5
#---------------------------------
_mof-invalidate-cache
set MOF_SOURCES (mktemp)
_mof-add (status dirname) 0 name1
_mof-add (status dirname) 0 name2
@test "Duplicate folder" $status -eq 6

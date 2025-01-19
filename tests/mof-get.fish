source (status dirname)/../functions/_mof-get-names.fish
source (status dirname)/../functions/_mof-get-depths.fish
source (status dirname)/../functions/_mof-get-folders.fish
source (status dirname)/../functions/_mof-invalidate-cache.fish
source (status dirname)/../functions/_mof-reload-cache.fish

_mof-invalidate-cache
set -g MOF_SOURCES (status dirname)/fixtures/sources/.emptysources
@test "Name from empty file" (_mof-get-names) = ""
@test "Depth from empty file" (_mof-get-depths) = ""
@test "Folder from empty file" (_mof-get-depths) = ""

_mof-invalidate-cache
set -g MOF_SOURCES (status dirname)/fixtures/sources/.source1
@test "Name from file with single entry" (_mof-get-names) = sources
@test "Depth from file with single entry" (_mof-get-depths) = 1
@test "Depth from file with single entry" (_mof-get-folders) = /

_mof-invalidate-cache
set -g MOF_SOURCES (status dirname)/fixtures/sources/.source2
set expected_names sources sources1
set expected_depths 1 2
set expected_folders / '~'
set actual_names (_mof-get-names)
set actual_depths (_mof-get-depths)
set actual_folders (_mof-get-folders)
for index in (seq 2)
    @test "Name from file with 2 entries, entry $index" $actual_names[$index] = $expected_names[$index]
    @test "Depth from file with 2 entries, entry $index" $actual_depths[$index] -eq $expected_depths[$index]
    @test "Folder from file with 2 entries, entry $index" $actual_folders[$index] = $expected_folders[$index]
end

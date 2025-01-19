#!/opt/homebrew/bin/fish
source (status dirname)/functions/_mof-add.fish
source (status dirname)/functions/_mof-delete.fish
source (status dirname)/functions/_mof-get-depths.fish
source (status dirname)/functions/_mof-get-folders.fish
source (status dirname)/functions/_mof-get-names.fish
source (status dirname)/functions/_mof-invalidate-cache.fish
source (status dirname)/functions/_mof_expand_folder.fish
source (status dirname)/functions/_mof-reload-cache.fish
source (status dirname)/functions/_mof-navigate.fish
source (status dirname)/functions/_mof-goto.fish
source (status dirname)/functions/_mof-list.fish
source (status dirname)/functions/mof.fish

source (status dirname)/conf.d/mof.fish
#mof-navigate
#_mof-list
# - eval args
# - documentation
# - better list command

# Remove leading / when remove / add
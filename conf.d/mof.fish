not set -q MOF_SOURCES && set -gx MOF_SOURCES $HOME/.mofsources
touch $MOF_SOURCES

function _mof-uninstall --on-event mof_uninstall
    echo Dont forget to remove 'mof goto' binding from your config.fish
end

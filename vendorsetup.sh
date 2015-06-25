add_lunch_combo aosp_miata-eng
add_lunch_combo aosp_miata-user
add_lunch_combo aosp_miata-userdebug

function cmdev()
{
    T=$(gettop)
    if [ "$T" ]; then
        \cd $(gettop)/device/alcatel/miata
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}

function cmven()
{
    T=$(gettop)
    if [ "$T" ]; then
        \cd $(gettop)/vendor/alcatel/miata
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}

ccache -M 50G

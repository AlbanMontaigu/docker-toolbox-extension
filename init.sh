#!/bin/sh

# ===================================================================
# Init script executed to load all extensions
# ===================================================================


# -------------------------------------------------------------------
# Import custom elements in a dynamic way
#
# NOTE: prefix the files with a number to manage order
# -------------------------------------------------------------------
for init_file in $DKTB_EXTENSION_DIR/init.sh.d/* ; do
    if [ -f $init_file ]; then 
        source $init_file
    fi
done

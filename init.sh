#!/bin/sh

# ===================================================================
# Init script executed to load all extensions
# ===================================================================

# Requested env vars
export VAGRANT_IA_ROOT_DIR="/vagrant/iaas"
export VAGRANT_IA_TF_ROOT_DIR="$VAGRANT_IA_ROOT_DIR/terraform"
export VAGRANT_IA_FPUSH_ROOT_DIR="$VAGRANT_IA_ROOT_DIR/fpush"
export DKTB_EXTENSION_IA_ROOT_DIR="$DKTB_EXTENSION_DIR/iaas"

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

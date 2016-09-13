# ===================================================================
# Additional docker hosts definition
# ===================================================================


# -------------------------------------------------------------------
# Import custom elements in a dynamic way
#
# NOTE: prefix the files with a number to manage order
# -------------------------------------------------------------------
for host_file in $DKTB_EXTENSION_DIR/docker/hosts/* ; do
    if [ -f $host_file ]; then 
        source $host_file
    fi
done


# -------------------------------------------------------------------
# Import custom host definition directly included in project files
#
# NOTE: prefix the files with a number to manage order
# -------------------------------------------------------------------
VAGRANT_IA_DOCKER_HOSTS="${VAGRANT_IA_ROOT_DIR}/docker/hosts"
if [ -d "$VAGRANT_IA_DOCKER_HOSTS" ]; then
    for host_file in $VAGRANT_IA_DOCKER_HOSTS/* ; do
        if [ -f $host_file ]; then
            source $host_file
        fi
done
fi

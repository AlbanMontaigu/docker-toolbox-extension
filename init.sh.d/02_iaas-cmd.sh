# ============================================================
# Iaas custom commands
#
# NOTE : tool to manage IaaS instances is TERRAFORM
# ============================================================

# ------------------------------------------------------------
# Global TERRAFORM sub command for IaaS management
# ------------------------------------------------------------
ia_tf(){

    # Check requirements
    if [[ ia_tf_check -gt 0 ]] ; then
        return 1
    fi

    # Note 1: Terraform must be run @local
    # Note 2: $(hostname) contains current container id so it is used fro
    # volumes-from and get dk tb /vagrant /opt files necessary for the iaas
    DOCKER_HOST="$(dk_host_local)" docker run --rm \
                    -v "$VAGRANT_IA_TF_ROOT_DIR/$(dk_host_id)":/data \
                    --volumes-from $(hostname) \
                    amontaigu/terraform:0.10.7 "$@"

    # Reload host to be sure ip is set where necessary
    # Note 1: only if ip changes so only when "tf apply"
    # Note 2: on other cases it can loop because of ia ip call back this code 
    if [[ "$@" == "apply" ]] ; then
        dk_host_change "$(dk_host_id)"
    fi
}

# Help :)
ia_tf_help(){
    echo "Usage: ia tf COMMAND"
    echo ""
    echo "Execute TERRAFORM COMMAND on the current DOCKER_HOST_ID."
}

# Checks if TERRAFORM requirements are here
ia_tf_check(){
    VAGRANT_IA_TF_HOST_DIR="$VAGRANT_IA_TF_ROOT_DIR/$(dk_host_id)"

    # Vagrant iaas dir requested
    if [ ! -d $VAGRANT_IA_ROOT_DIR ] ; then
        echo "[WARN] $VAGRANT_IA_ROOT_DIR not found"
        return 1
    fi

    # Vagrant iaas specific terraform host dir requested
    if [ ! -d $VAGRANT_IA_TF_HOST_DIR ] ; then
        echo "[WARN] $VAGRANT_IA_TF_HOST_DIR not found"
        return 2
    fi

    # Docker iaas toolbox extension dir requested
    if [ ! -d $DKTB_EXTENSION_IA_ROOT_DIR ] ; then
        echo "[WARN] $DKTB_EXTENSION_IA_ROOT_DIR not found"
        return 3
    fi

    # All right
    return 0
}


# ------------------------------------------------------------
# Get the ip of the current IaaS instance
# ------------------------------------------------------------
ia_ip(){
    ia_tf show | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'
}

ia_ip_help(){
    echo "Usage: ia ip"
    echo ""
    echo "Show ip of the current instance (depending dk host) on the iaas"
}


# ------------------------------------------------------------
# Ssh into IaaS instance with default key and current ip
# ------------------------------------------------------------
ia_ssh(){
    ssh -o StrictHostKeyChecking=no cloud@$(ia_ip) $1
}

ia_ssh_help(){
    echo "Usage: ia ssh [options]"
    echo ""
    echo "Ssh inside the current IaaS instance (depending dk host) with default key and ip"
}


# -------------------------------------------------------------------------
# Copy files with scp on the IaaS instance with default key and current ip
# -------------------------------------------------------------------------
ia_scp(){
    scp -o StrictHostKeyChecking=no -r $1 cloud@$(ia_ip):$2
}

ia_scp_help(){
    echo "Usage: ia scp source destination"
    echo ""
    echo "Copy files with scp on the IaaS instance with default key and current ip"
}


# ----------------------------------------------------------------
# Files / folder push from local host to current remote IaaS host
# ----------------------------------------------------------------
ia_fpush(){
    VAGRANT_IA_FPUSH_DIR="$VAGRANT_IA_FPUSH_ROOT_DIR/$(dk_host_id)"
    if [ -d "$VAGRANT_IA_FPUSH_DIR" ]; then
        ia_scp $VAGRANT_IA_FPUSH_DIR/. "$(cat ${VAGRANT_IA_FPUSH_ROOT_DIR}/IAAS_REMOTE_FOLDER)/"
        return 0
    else
        echo "[ERROR] $VAGRANT_IA_FPUSH_DIR folder not found"
        return 1
    fi
}

ia_fpush_help(){
    echo "Usage: ia fpush"
    echo ""
    echo "Files / folder push from local host to current remote IaaS host"
}


# -------------------------------------------------------------------
# Same fpush but with a rm -fr on the remote IaaS dest folder before
# -------------------------------------------------------------------
ia_cfpush(){
    ia_ssh "rm -fr $(cat ${VAGRANT_IA_FPUSH_ROOT_DIR}/IAAS_REMOTE_FOLDER)"
    ia_fpush
}

ia_cfpush_help(){
    echo "Usage: ia cfpush"
    echo ""
    echo "Same fpush but with a rm -fr on the remoste IaaS dest folder before"
}


# -------------------------------------------------------------------
# File auto and regular synchronisation between local and IaaS
# -------------------------------------------------------------------
ia_fsync(){

}

ia_fsync_help(){
    echo "Usage: ia fsync [start|stop]"
    echo ""
    echo "File auto and regular synchronisation between local and IaaS"
}


# ------------------------------------------------------------
# Show ia usage + information about commands
# ------------------------------------------------------------
ia_custom_usage(){
    echo
    echo "ia = IaaS management with TERRAFORM inside for some parts."
    echo
    echo "ia COMMAND [options]"
    echo
    echo "Commands:"
    echo "    tf        All TERRAFORM commands"
    echo "    ip        Show ip of the current instance (depending dk host) on the iaas"
    echo "    ssh       Ssh inside the current IaaS instance (depending dk host) with default keys and current ip"
    echo "    scp       Copy files with scp on the IaaS instance with default key and current ip"
    echo "    fpush     Files / folder push from local /vagrant/iaas/fpush to current remote IAAS_REMOTE_FOLDER"
    echo "    cfpush    Same fpush but with a rm -fr on the remote IaaS dest folder before"
    echo "    fsync     File auto and regular synchronisation between local and IaaS"
    echo "    help      Get hep for the specified command"
}


# ------------------------------------------------------------
# Help complements
# ------------------------------------------------------------
ia_help(){
    case "$1" in
        tf) ia_tf
            ;;
        ip) ia_ip_help
            ;;
        ssh) ia_ssh_help
            ;;
        scp) ia_scp_help
            ;;
        fpush) ia_fpush_help
            ;;
        cfpush) ia_cfpush_help
            ;;
        fsync) ia_fsync_help
            ;;
    esac
}


# ------------------------------------------------------------
# IasS commands
# ------------------------------------------------------------
ia(){
    case "$1" in
        tf) ia_tf "${@:2}" # All params starting at number 2
            ;;
        ip) ia_ip
            ;;
        ssh) ia_ssh "$2"
            ;;
        scp) ia_scp "$2"
            ;;
        fpush) ia_fpush
            ;;
        cfpush) ia_cfpush
            ;;
        fsync) ia_fsync
            ;;
        help) ia_help "$2"
            ;;
        *) ia_custom_usage
            ;;
    esac
}

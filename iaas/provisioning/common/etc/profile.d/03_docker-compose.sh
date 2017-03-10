
# ============================================================
# Docker compose custom commands
# ============================================================


# ------------------------------------------------------------
# Docker compose up in daemon mode
# ------------------------------------------------------------
dc_upd(){
    sx docker-compose up -d
}

dc_upd_help(){
    echo "Usage: dc upd"
    echo
    echo "Docker compose up in daemon mode."
    return 1
}


# ------------------------------------------------------------
# Deep restart with containers cleaning and images pulling
# ------------------------------------------------------------
dc_init(){
    sx docker-compose stop
    sx docker-compose rm -f
    sx docker-compose pull
    sx docker-compose up -d
}

dc_init_help(){
    echo "Usage: dc init"
    echo
    echo "Deep restart with containers cleaning and images pulling."
    return 1
}


# ------------------------------------------------------------
# Deep restart with containers cleaning
# ------------------------------------------------------------
dc_reset(){
    sx docker-compose stop
    sx docker-compose rm -f
    sx docker-compose up -d
}

dc_reset_help(){
    echo "Usage: dc reset"
    echo
    echo "Deep restart with containers cleaning."
    return 1
}


# ------------------------------------------------------------
# Shows or changes compose app prefix
# ------------------------------------------------------------
dc_prefix(){
    if [[ "$1" == "" ]] ; then
        echo $COMPOSE_PROJECT_NAME
    else
        export COMPOSE_PROJECT_NAME="$1"
    fi
}

dc_prefix_help(){
    echo "Usage: dc prefix [NEW_PREFIX]"
    echo
    echo "Shows or changes (if NEW_PREFIX is specified) compose app prefix."
    return 1
}


# ------------------------------------------------------------
# Show compose usage + information about custom commands
# ------------------------------------------------------------
dc_custom_usage(){
    echo
    echo "dc = docker-compose alias with enhancements."
    echo
    docker-compose 2>&1 >/dev/null | sed 's/docker-compose/dc/g'
    echo
    echo "Custom dc commands:"
    echo "  upd                Compose up in daemon mode"
    echo "  init               Deep restart with containers cleaning and images pulling"
    echo "  reset              Deep restart with containers cleaning"
    echo "  prefix             Shows or changes compose app prefix"
    return 1
}


# ------------------------------------------------------------
# Help complements
# ------------------------------------------------------------
dc_help(){
    case "$1" in
        upd) dc_upd_help
            ;;
        init) dc_init_help
            ;;
        reset) dc_reset_help
            ;;
        prefix) dc_prefix_help
            ;;
        "") docker-compose help
            ;;
        *) docker-compose help "$@"
            ;;
    esac
}


# ------------------------------------------------------------
# Docker compose command plus new features for it
# ------------------------------------------------------------
dc(){
    case "$1" in
        upd) dc_upd
            ;;
        init) dc_init
            ;;
        reset) dc_reset
            ;;
        prefix) dc_prefix "$2"
            ;;
        help) dc_help "$2"
            ;;
        "") dc_custom_usage
            ;;
        *) sx docker-compose "$@"
            ;;
    esac
}

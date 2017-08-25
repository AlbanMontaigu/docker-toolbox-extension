
# ============================================================
# Docker custom commands
# ============================================================


# ------------------------------------------------------------
# Show ip of a docker container
# ------------------------------------------------------------
dk_ip(){
    if [ $# -eq 1 ]; then
        sx docker inspect --format \"{{ .NetworkSettings.IPAddress }}\" $1
    else
        dk_ip_help
    fi
}

dk_ip_help(){
    echo "Usage: dk ip CONTAINER"
    echo ""
    echo "Show ip of a docker container."
}


# ------------------------------------------------------------
# Kill all running containers
# ------------------------------------------------------------
dk_killa(){
    sx docker kill $(docker ps -q)
}

dk_killa_help(){
    echo "Usage: dk killa"
    echo ""
    echo "Kill all running containers."
}


# ------------------------------------------------------------
# Specific garbage collecting with spotify/docker-gc
# ------------------------------------------------------------
dk_gc(){
    sx docker pull spotify/docker-gc
    sx docker run --rm -v /var/run/docker.sock:/var/run/docker.sock spotify/docker-gc
}

dk_gc_help(){
    echo "Usage: dk gc"
    echo ""
    echo "Specific garbage collecting with spotify/docker-gc."
}


# ------------------------------------------------------------
# Get a shell inside a container
# ------------------------------------------------------------
dk_shc() {
    if [ $# -eq 1 ]; then
        sx docker exec -ti $1 /bin/sh
    else
        dk_shc_help
    fi
}

dk_shc_help(){
    echo "Usage: dk shc CONTAINER"
    echo ""
    echo "Starts a shell inside a container."
}


# ------------------------------------------------------------
# Get a shell in a container started from the specified image
# ------------------------------------------------------------
dk_shi() {
    if [ $# -eq 1 ]; then
        sx docker run -it --rm --entrypoint="/bin/sh" $1
    else
        dk_shi_help
    fi
}

dk_shi_help(){
    echo "Usage: dk shi IMAGE"
    echo ""
    echo "Runs an image as a container and start a shell inside."
}


# ------------------------------------------------------------
# Follow logs of a container
# ------------------------------------------------------------
dk_logsf(){
    if [ $# -eq 1 ]; then
        sx docker logs -f $1
    else
        dk_logsf_help
    fi
}

dk_logsf_help(){
    echo "Usage: dk logsf CONTAINER"
    echo ""
    echo "Follow logs of a container."
}


# ------------------------------------------------------------
# Update all available images
# ------------------------------------------------------------
dk_ipull(){
    docker images | grep -v REPOSITORY | grep -Ev  '<none>' |awk '{print $1":"$2}' | xargs -n1 docker pull
}

dk_ipull_help(){
    echo "Usage: dk ipull"
    echo ""
    echo "Update all available images."
}


# ------------------------------------------------------------
# Show docker usage + information about custom commands
# ------------------------------------------------------------
dk_custom_usage(){
    echo
    echo "dk = docker alias with enhancements."
    echo
    docker | sed 's/docker/dk/g'
    echo
    echo "Custom dk commands:"
    echo "    ip        Show ip of a docker container"
    echo "    ipull     Update all available images"
    echo "    killa     Kill all running containers"
    echo "    gc        Specific garbage collecting with spotify/docker-gc"
    echo "    shc       Get a shell inside a container"
    echo "    shi       Get a shell in a container started from the specified image"
    echo "    logsf     Follow logs of a container"
}


# ------------------------------------------------------------
# Help complements
# ------------------------------------------------------------
dk_help(){
    case "$1" in
        ip) dk_ip_help
            ;;
        ipull) dk_ipull_help
            ;;
        killa) dk_killa_help
            ;;
        gc) dk_gc_help
            ;;
        shc) dk_shc_help
            ;;
        shi) dk_shi_help
            ;;
        logsf) dk_logsf_help
            ;;
        "--help") docker
            ;;
        "") docker
            ;;
        *) docker "$@" --help
            ;;
    esac
}


# ------------------------------------------------------------
# Docker command plus new features for it
# ------------------------------------------------------------
dk(){
    if [[ "${@: -1}" == "--help" ]] ; then
        dk_help "$1"
        return 0
    fi
    case "$1" in
        ip) dk_ip "$2"
            ;;
        ipull) dk_ipull
            ;;
        killa) dk_killa
            ;;
        gc) dk_gc
            ;;
        shc) dk_shc "$2"
            ;;
        shi) dk_shi "$2"
            ;;
        logsf) dk_logsf "$2"
            ;;
        "") dk_custom_usage
            ;;
        *) sx docker "$@"
            ;;
    esac
}

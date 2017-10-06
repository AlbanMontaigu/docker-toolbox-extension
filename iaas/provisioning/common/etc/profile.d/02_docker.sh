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
    echo "    shc       Get a shell inside a container"
    echo "    shi       Get a shell in a container started from the specified image"
    echo "    logsf     Follow logs of a container"
    echo "    host      Changes or shows where the docker client is connected"
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
        shc) dk_shc_help
            ;;
        shi) dk_shi_help
            ;;
        logsf) dk_logsf_help
            ;;
        host) dk_host_help
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

    # Check if help is requested
    if [[ "${@: -1}" == "--help" ]] ; then
        dk_help "$1"
        return 0
    fi

    # Select with command to execute
    case "$1" in
        ip) dk_ip "$2"
            ;;
        ipull) dk_ipull
            ;;
        killa) dk_killa
            ;;
        shc) dk_shc "$2"
            ;;
        shi) dk_shi "$2"
            ;;
        logsf) dk_logsf "$2"
            ;;
        host) dk_host "$2"
            ;;
        "") dk_custom_usage
            ;;
        *) sx docker "$@"
            ;;
    esac
}


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
# Delete all stopped containers
# ------------------------------------------------------------
dk_cleanc(){
    exited_containers="$(docker ps -a -q -f status=exited)"
    if [[ "$exited_containers" == "" ]] ; then
        echo "No exited container to clean"
        return 0
    fi
    sx docker rm "$exited_containers"
}

dk_cleanc_help(){
    echo "Usage: dk cleanc"
    echo ""
    echo "Delete all stopped containers."
}


# ------------------------------------------------------------
# Delete all untagged images
# ------------------------------------------------------------
dk_cleani(){
    untagged_images="$(docker images -q -f dangling=true)"
    if [[ "$untagged_images" == "" ]] ; then
        echo "No untagged image to clean"
        return 0
    fi
    sx docker rmi "$untagged_images"
}

dk_cleani_help(){
    echo "Usage: dk cleani"
    echo ""
    echo "Delete all untagged images."
}


# ------------------------------------------------------------
# Delete all orphaned volumes
# ------------------------------------------------------------
dk_cleanv(){
    # since sx may broke the pipe
    echo "[CMD] docker volume ls -qf dangling=true | xargs -r docker volume rm"
    docker volume ls -qf dangling=true | xargs -r docker volume rm
}

dk_cleanv_help(){
    echo "Usage: dk cleanv"
    echo ""
    echo "Delete all dangling volumes."
}


# ------------------------------------------------------------
# Delete all stopped containers and untagged images
# ------------------------------------------------------------
dk_clean(){
    dk_cleanc || true
    dk_cleani
    dk_cleanv
}

dk_clean_help(){
    echo "Usage: dk clean"
    echo ""
    echo "Delete all stopped containers and untagged images."
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
# See files tree in a container
# ------------------------------------------------------------
dk_ls() {
    if [ $# -eq 2 ]; then
        sx docker exec -ti $1 /bin/ls -l $2
    else
        dk_ls_help
    fi
}

dk_ls_help(){
    echo "Usage: dk ls CONTAINER PATH"
    echo ""
    echo "Outputs directory content from inside a container."
}


# ------------------------------------------------------------
# See files content inside a container
# ------------------------------------------------------------
dk_cat() {
    if [ $# -eq 2 ]; then
        sx docker exec -ti $1 /bin/cat $2
    else
        dk_cat_help
    fi
}

dk_cat_help(){
    echo "Usage: dk cat CONTAINER PATH"
    echo ""
    echo "Outputs file content from inside a container."
}


# ------------------------------------------------------------
# Edit files content inside a container
# ------------------------------------------------------------
dk_vi() {
    if [ $# -eq 2 ]; then
        sx docker exec -ti $1 /bin/vi $2
    else
        dk_vi_help
    fi
}

dk_vi_help(){
    echo "Usage: dk vi CONTAINER PATH"
    echo ""
    echo "Edits file content from inside a container."
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
    echo "    killa     Kill all running containers"
    echo "    cleanc    Delete all stopped containers"
    echo "    cleani    Delete all untagged images"
    echo "    cleanv    Delete all dangling volumes"
    echo "    clean     Delete all stopped containers and untagged images"
    echo "    gc        Specific garbage collecting with spotify/docker-gc"
    echo "    shc       Get a shell inside a container"
    echo "    shi       Get a shell in a container started from the specified image"
    echo "    ls        See files tree in a container"
    echo "    cat       See files content inside a container"
    echo "    vi        Edit files content inside a container"
    echo "    logsf     Follow logs of a container"
}


# ------------------------------------------------------------
# Help complements
# ------------------------------------------------------------
dk_help(){
    case "$1" in
        ip) dk_ip_help
            ;;
        killa) dk_killa_help
            ;;
        cleanc) dk_cleanc_help
            ;;
        cleani) dk_cleani_help
            ;;
        cleanv) dk_cleanv_help
            ;;
        clean) dk_clean_help
            ;;
        gc) dk_gc_help
            ;;
        shc) dk_shc_help
            ;;
        shi) dk_shi_help
            ;;
        ls) dk_ls_help
            ;;
        cat) dk_cat_help
            ;;
        vi) dk_vi_help
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
        killa) dk_killa
            ;;
        cleanc) dk_cleanc
            ;;
        cleani) dk_cleani
            ;;
        cleanv) dk_cleanv
            ;;
        clean) dk_clean
            ;;
        gc) dk_gc
            ;;
        shc) dk_shc "$2"
            ;;
        shi) dk_shi "$2"
            ;;
        ls) dk_ls "$2" "$3"
            ;;
        cat) dk_cat "$2" "$3"
            ;;
        vi) dk_vi "$2" "$3"
            ;;
        logsf) dk_logsf "$2"
            ;;
        "") dk_custom_usage
            ;;
        *) sx docker "$@"
            ;;
    esac
}

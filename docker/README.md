# docker folder

## Desription

Contains all docker related extension files.

## Content

### hosts

List of docker hosts definition.

Basically one host per file that can be called with the command ```dk host FILE_SUFFIX```.

```FILE_SUFFIX``` corresponds to ```sb_1``` if the file is named ```01_docker-host-sb_1.sh```. You should respect this naming convention to allow host definition working.

You can add the files you want as much as you want depending the various host you want to address.

**The file shloud be built like this:**

```bash
# ============================================================
# Docker IaaS sandbox (=sb) column 1 host definition
#
# NOTE : copy and rename this to define your custom host
#        definitions
# ============================================================

# Docker on Iaas sb column 1 host
dk_host_sb_1(){
    echo "tcp://$(ia ip):2375"
}
dk_host_sb_1_http_proxy(){
    echo ""
}
dk_host_sb_1_https_proxy(){
    echo "$(dk_host_sb_1_http_proxy)"
}
dk_host_sb_1_no_proxy(){
    echo ""
}
```

**Important note:** when you change the host with ```dk host FILE_SUFFIX``` all the ```ia``` commands will apply to this new host.
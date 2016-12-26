# ============================================================
# Docker IaaS sandbox (=sb) column 1 host definition
#
# NOTE : copy and rename this to define your custom host
#        definitions
# ============================================================

# Docker on Iaas sb column 1 host
dk_host_sb_1(){
    echo "tcp://$(ia_ip):2375"
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
# ============================================================
# Iaas ssh keys
# ============================================================


# -----------------------------------------------------------------------
# Adds private key to log in remote hosts built with terraform
# @see http://stackoverflow.com/questions/3466626/add-private-key-permanently-with-ssh-add-on-ubuntu
# -----------------------------------------------------------------------

USER_SSH_DIR="/root/.ssh"
mkdir -p $USER_SSH_DIR
cp -f $DKTB_EXTENSION_DIR/iaas/ssh/insecure-key $USER_SSH_DIR
chmod 600 $USER_SSH_DIR/insecure-key
echo "IdentityFile ~/.ssh/insecure-key" > $USER_SSH_DIR/config

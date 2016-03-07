
#!/bin/sh

# Proxy configuration if requested
systemctl enable dk-redsocks
systemctl start dk-redsocks

#!/bin/sh

#
# Try to make some cleanup
#

package-cleanup -y --oldkernels --count=1
yum -y autoremove

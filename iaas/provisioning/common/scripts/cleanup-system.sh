#!/bin/sh

#
# Try to make some cleanup
#

package-cleanup --leaves
package-cleanup -y --oldkernels --count=1

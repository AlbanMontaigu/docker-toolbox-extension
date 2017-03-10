#!/bin/sh

#
# Try to make some cleanup
#

package-cleanup --leaves
package-cleanup --oldkernels --count=1

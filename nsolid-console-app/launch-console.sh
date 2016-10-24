#-------------------------------------------------------------------------------
# This script is only intended to be run on CF, during the the app launch.
#-------------------------------------------------------------------------------

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create / clean out the product subdirectory
cd $SCRIPT_DIR
mkdir -p product
rm -rf product/*

echo "unpacking nsolid-console"
tar -xzf nsolid-console-linux-x64.tar.gz --strip 1 -C product

export NODE_ENV=production

echo "launching nsolid-console"
cd product
nsolid bin/nsolid-console

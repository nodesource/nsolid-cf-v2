#-------------------------------------------------------------------------------
# This script is only intended to be run on CF, during the the app launch.
#-------------------------------------------------------------------------------

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# create / clean out the product subdirectory
cd $SCRIPT_DIR
mkdir -p product
rm -rf product/*

echo "unpacking nsolid-storage"
tar -xzf nsolid-storage-linux-x64.tar.gz --strip 1 -C product

# if license env var set, write it to the data directory
if [ "x$NSOLID_LICENSE" != "x" ]; then
  DATA_DIR=~/.nsolid-storage/data
  LICENSE_FILE="$DATA_DIR/license.json"

  mkdir -p $DATA_DIR

  # In case you're curious, these are initial values for the license
  # file, which will get overwritten at runtime with the current values
  # from the specified license.
  cat <<- LICENSE_EOF > $LICENSE_FILE
  {
    "provider": "default",
    "providerData": "",
    "optOut": false,
    "key": "$NSOLID_LICENSE",
    "keyState": "ACTIVE",
    "trial": true,
    "valid": true
  }
LICENSE_EOF

  echo "license file:"
  cat $LICENSE_FILE
fi

# set the protocol to http instead of default https
export NSOLID_STORAGE_WEB_PROTO="http"

echo "launching nsolid-storage"
cd product
nsolid nsolid-storage.js

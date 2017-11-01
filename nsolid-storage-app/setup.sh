#!/usr/bin/env bash

# which product are we downloading
PRODUCT=storage

# bundle version
BUNDLE=2.4.0

# version of the product
VERSION=1.6.0

# name of the tarball that will be uploaded to Cloud Foundry via cf push
TARBALL=nsolid-$PRODUCT-linux-x64.tar.gz

# URL of the tarball
URL=https://s3-us-west-2.amazonaws.com/nodesource-public-downloads/$BUNDLE/artifacts/bundles/nsolid-bundle-v$BUNDLE-linux-x64/nsolid-$PRODUCT-v$VERSION-linux-x64.tar.gz

# make sure we're in the right directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR

# write some info about what's being downloaded
# for informational use only; not actually needed to run the app
echo "using nsolid-$PRODUCT: $VERSION" >  nsolid-$PRODUCT-version.txt
echo "downloaded from: $URL"           >> nsolid-$PRODUCT-version.txt

# do the download
echo "Downloading $TARBALL from $URL"
echo ""
curl --output $TARBALL $URL

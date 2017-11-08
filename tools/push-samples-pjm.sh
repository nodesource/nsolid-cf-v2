#!/usr/bin/env bash

# pushes storage/console/some samples using custom manifests (not in git!)

cd nsolid-storage-app
./setup.sh
cf push -f manifest-pjm.yml
cd ..

cd nsolid-console-app
./setup.sh
cf push -f manifest-pjm.yml
cd ..

cd sample-apps/native
cf push -f manifest-pjm.yml
cd ../..

cd sample-apps/print-versions-4x
cf push -f manifest-pjm.yml
cd ../..

cd sample-apps/print-versions-6x
cf push -f manifest-pjm.yml
cd ../..

cd sample-apps/print-versions-8x
cf push -f manifest-pjm.yml
cd ../..

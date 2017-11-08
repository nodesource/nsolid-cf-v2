#!/usr/bin/env bash

# pushes storage/console/some samples using custom manifests (not in git!)

cf stop  pjm-native
cf stop  pjm-print-versions-4x
cf stop  pjm-print-versions-6x
cf stop  pjm-print-versions-8x
cf stop  pjm-nsolid-console
cf stop  pjm-nsolid-storage

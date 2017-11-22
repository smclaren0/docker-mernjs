#!/bin/bash
set -e

if [ "$TESTING_ENV" = "development" ]
then
    echo "development"
    nf start -p 3000
else
    echo $TESTING_ENV
    node server.js
fi
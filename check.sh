#!/bin/sh
# Uses github.com/santhosh-tekuri/jsonschema with yaml instead of json files.
# Because the docker image uses alpine this script does NOT rely on bash

set -e

schema=$1
file=$2

temp_schema=$(mktemp)
temp_file=$(mktemp)

yaml2json $schema > $temp_schema
yaml2json $file > $temp_file

echo "Validating $file against $schema"
jv $temp_schema $temp_file && echo "Schema is valid"

rm $temp_schema $temp_file

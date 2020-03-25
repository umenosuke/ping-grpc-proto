#!/bin/bash

cd "$(dirname $(readlink -f $0))/../"
_BASE_DIR="$(pwd)"

_PROTO_NAMES=$(find . -type f -name '*.proto' -printf "%f\n" | sed -e 's@\.proto@@g')
for _PROTO_NAME in ${_PROTO_NAMES[@]}
do
  echo ${_PROTO_NAME}
  mkdir -p ./go/${_PROTO_NAME}
  protoc -I ./src/ --go_out=plugins=grpc:./go/${_PROTO_NAME} ./src/${_PROTO_NAME}.proto
done

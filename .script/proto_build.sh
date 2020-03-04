#!/bin/bash

cd $(dirname $0)/../

PROTO_NAME="pingGrpc"
mkdir -p ./go/${PROTO_NAME}
protoc -I ./src/ --go_out=plugins=grpc:./go/${PROTO_NAME} ./src/${PROTO_NAME}.proto

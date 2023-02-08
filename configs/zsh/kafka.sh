#!/bin/bash

## Kafka Utils
## Alternative: GUI Konductor / GUI Plumber / GUI Goland

## $1 - topic name
## $2 - protobuf contract path
## $3 - package.MessageStruct \
## $4 - kafka brokers addr
read_proto_topic() {
	[[ "$#" -ne 3 ]] && 1>&2 echo "TODO: develop some help for this kafka read fn explain each arg";

	plumber read kafka --topics "$1" \
	  --protobuf-dirs "$2" \
	  --protobuf-root-message "$3" \
	  --decode-type protobuf \
	  --address "$4"
}

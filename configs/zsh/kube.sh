#!/bin/bash

setup_minikube() {
	export DOCKER_TLS_VERIFY="1"
	export DOCKER_HOST="tcp://127.0.0.1:53782"
	export DOCKER_CERT_PATH="$HOME/.minikube/certs"
	export MINIKUBE_ACTIVE_DOCKERD="minikube"
	eval "$("$HOME"/homebrew/bin/minikube -p minikube docker-env)"
}

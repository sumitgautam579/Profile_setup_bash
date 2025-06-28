#!/usr/bin/env bash
set -e

# Directory to store icons
DIR="$(dirname "$0")/assets"
mkdir -p "$DIR"

# Mapping of icon names to Devicon folders
declare -A icons=(
    [bash]=bash
    [python]=python
    [groovy]=groovy
    [java]=java
    [go]=go
    [linux]=linux
    [ubuntu]=ubuntu
    [alpine]=alpine
    [centos]=centos
    [mysql]=mysql
    [oracle]=oracle
    [kafka]=kafka
    [zookeeper]=zookeeper
    [cassandra]=cassandra
    [couchbase]=couchbase
    [maven]=maven
    [sbt]=sbt
    [elasticsearch]=elasticsearch
    [aws]=amazonwebservices
    [gcp]=googlecloud
    [jenkins]=jenkins
    [ansible]=ansible
    [chef]=chef
    [terraform]=terraform
    [docker]=docker
    [kubernetes]=kubernetes
    [helm]=helm
    [prometheus]=prometheus
    [grafana]=grafana
    [nagios]=nagios
    [sonarqube]=sonarqube
    [git]=git
    [github]=github
    [svn]=subversion
    [bitbucket]=bitbucket
    [jira]=jira
    [trello]=trello
)

BASE_URL="https://raw.githubusercontent.com/devicons/devicon/master/icons"

for name in "${!icons[@]}"; do
    folder="${icons[$name]}"
    url="$BASE_URL/$folder/${folder}-original.svg"
    echo "Downloading $name icon..."
    curl -fsSL "$url" -o "$DIR/$name.svg" || echo "Failed to download $name from $url"
done

echo "Done. Icons saved to $DIR."

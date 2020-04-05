#!/bin/bash

set -o pipefail -e

# TEMPLATES
# Dockerfile.zookeeper-apt.tpl

DSE_VERSIONS=(6.0.11 6.7.7 6.8.0)
SUFFIX="apt"

gen_dockerfile() {
  DOCKERFILE_TEMPLATE="Dockerfile.dse-server-apt.tpl"

  DOCKERFILE_TARGET="${DSE_VERSION}-${SUFFIX}/Dockerfile"

  DOCKERFILE_TARGET_DIR="$(dirname ${DOCKERFILE_TARGET})"
  echo -en "Generating Dockerfile for ${DSE_VERSION}.. "
  if [ ! -r ${DOCKERFILE_TEMPLATE} ]; then
    echo "failed"
    echo "Missing Dockerfile template ${DOCKERFILE_TEMPLATE}"
    exit 1
  fi

  # create target dockerfile dir
  if [ ! -e ${DOCKERFILE_TARGET_DIR} ]; then
    mkdir -p ${DOCKERFILE_TARGET_DIR}
  fi

  sed "s/%DSE_VERSION%/${DSE_VERSION}/g;" \
    ${DOCKERFILE_TEMPLATE} > ${DOCKERFILE_TARGET} && \
  echo "done" || \
  echo "failed"
}

for version in ${DSE_VERSIONS[@]}; do
  DSE_VERSION=$(echo $version)

  gen_dockerfile

done

echo -n "Generating symlinks for current versions.. "
latest_version=$(echo "${DSE_VERSIONS[@]}" | tr ' ' '\n\' | uniq | sort -n | tail -n1)
latest="${latest_version}-${SUFFIX}"
[ -e current ] && rm current || true
ln -s ${latest} current
echo "done"

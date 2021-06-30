#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "liitfr/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "liitfr/meteord:node-${NODE_VERSION}-base" liitfr/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "liitfr/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "liitfr/meteord:node-${NODE_VERSION}-onbuild" liitfr/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "liitfr/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
  docker tag "liitfr/meteord:node-${NODE_VERSION}-devbuild" liitfr/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "liitfr/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
  docker tag "liitfr/meteord:node-${NODE_VERSION}-binbuild" liitfr/meteord:binbuild

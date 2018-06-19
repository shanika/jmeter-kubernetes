#!/usr/bin/env bash

docker build --tag="gcr.io/spherical-realm-204319/jmeter-master:latest" .
docker push gcr.io/spherical-realm-204319/jmeter-master:latest

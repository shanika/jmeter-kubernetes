#!/usr/bin/env bash

docker build --tag="gcr.io/spherical-realm-204319/jmeter-slave:latest" .
docker push gcr.io/spherical-realm-204319/jmeter-slave:latest

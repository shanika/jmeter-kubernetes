#!/usr/bin/env bash

docker build --tag="shanika/jmeter-base:latest" .
docker push shanika/jmeter-base:latest

#!/usr/bin/env bash

docker build --tag="shanika/jmeter-master:latest" .
docker push shanika/jmeter-master:latest

#!/usr/bin/env bash

docker build --tag="shanika/jmeter-slave:latest" .
docker push shanika/jmeter-slave:latest

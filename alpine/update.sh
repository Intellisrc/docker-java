#!/bin/bash
ver="11-alpine"
docker build -t java .
docker tag java:latest intellisrc/java:$ver
docker push intellisrc/java:$ver

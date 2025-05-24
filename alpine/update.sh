#!/bin/bash
ver="alpine-3.21"
docker build -t java .
docker tag java:latest intellisrc/java:$ver
docker push intellisrc/java:$ver

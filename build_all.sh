#!/bin/bash

export platform="linux/arm64/v8,linux/amd64"
#export platform="linux/arm64/v8"
#export platform="linux/amd64"

tag="0.4.0"

# pl-julia-datascience-precompile 
for image in pl-julia-datascience-base pl-julia-datascience-grader pl-julia-datascience-pluto-workspace
do
    echo "------------------- Building ${image} -------------------"
    cd $image
    docker buildx build --platform $platform --push --tag ctessum/${image}:latest --tag ctessum/${image}:${tag} .
    cd ..
done

# 0.2.0 time to working HW1: 12:41 (laggy even after this)
# 0.3.0 time to working HW1: 6:41
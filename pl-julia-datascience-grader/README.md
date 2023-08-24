A container with Julia and Pluto.jl

To build:

``` bash
docker buildx build --platform linux/arm64/v8,linux/amd64 --push --tag ctessum/pl-julia-datascience-grader:latest .
```
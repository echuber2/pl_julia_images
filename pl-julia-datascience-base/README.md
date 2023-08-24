A base container for prairielearn data science course with Julia, packages, and exercise data.

To build:

``` bash
docker buildx build --platform linux/arm64/v8,linux/amd64 --push --tag ctessum/pl-julia-datascience-base:latest .
```

To run:

``` bash
docker run --rm -it  ctessum/pl-julia-datascience-base:latest

```


To build on gcloud:
```
gcloud compute scp --zone=us-central1-a --project=cee498ds --recurse * ctessum@docker-build:/home/ctessum/


gcloud compute ssh --zone=us-central1-a --project=cee498ds ctessum@docker-build

docker system prune -a
```

To test precompile:
```
time docker run -it ctessum/pl-julia-datascience-base julia --trace-compile=stderr -e 'import Plots; Plots.plot(rand(2,2))'


time docker run -it ctessum/pl-julia-datascience-base julia  --project=/jl -J/jl/sys_prairielearn.so --trace-compile=stderr -e 'import Plots; Plots.plot(rand(2,2))'
```
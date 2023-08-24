FROM ctessum/pl-julia-datascience-base:latest


RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    libc6-dev \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# System image
COPY sysimage.jl ${JL_DIR}
COPY precompile_statements.jl ${JL_DIR} 
RUN julia ${JL_DIR}/sysimage.jl

RUN rm ${JL_DIR}/sysimage.jl ${JL_DIR}/precompile_statements.jl
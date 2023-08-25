FROM ctessum/pl-julia-datascience-base:latest

# Install compilers for system image
# RUN apt-get update && apt-get install -y --no-install-recommends \
#     gcc \
#     g++ \
#     libc6-dev \
#     && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/*

#ENV JULIA_PROJECT ""

# System image
# COPY sysimage.jl ${JL_DIR}
# COPY precompile_exec.jl ${JL_DIR}
# COPY precompile_notebook.jl /home/julia/notebook.jl
# RUN julia ${JL_DIR}/sysimage.jl
# RUN rm ${JL_DIR}/sysimage.jl ${JL_DIR}/precompile_exec.jl /home/julia/notebook.jl

# Add pluto startup script.
COPY startup.jl ${JL_DIR} 

# Create workspace user (1001:1001).
ARG user=julia
ARG group=julia
ARG uid=1001
ARG gid=1001
RUN groupadd -g ${gid} ${group}
RUN useradd -u ${uid} -g ${group} -s /bin/sh -m ${user} # <--- the '-m' creates a user home directory

# Make the user the owner of necessary directories.
RUN chown -R ${uid}:${gid} ${JL_DIR}
RUN chown -R ${uid}:${gid} ${JL_DEPOT}
RUN chown -R ${uid}:${gid} /data

# Switch to user
USER ${uid}:${gid}
USER julia

WORKDIR "/home/julia"
VOLUME /home/julia

ENV JULIA_WORKER_TIMEOUT=3600

EXPOSE 1234

# Precompile startup package
COPY Startup/ ${JL_DIR}/Startup/
RUN julia -E "import Pkg; Pkg.develop(path=\"${JL_DIR}/Startup\"); using Startup"

CMD [ "julia", "--color=no", "--heap-size-hint=1G", "/jl/startup.jl" ]
# "--sysimage=/jl_depot/sysimage.so", 
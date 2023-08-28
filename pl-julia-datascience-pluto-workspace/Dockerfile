FROM ctessum/pl-julia-datascience-base:latest

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
RUN julia --project=${JL_DIR} -E "import Pkg; Pkg.develop(path=\"${JL_DIR}/Startup\"); using Startup"

CMD [ "julia", "--project=/jl", "--color=no", "--heap-size-hint=1G", "/jl/startup.jl" ]
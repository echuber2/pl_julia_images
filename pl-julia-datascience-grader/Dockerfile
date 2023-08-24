FROM ctessum/pl-julia-datascience-precompile:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    uuid-runtime \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


COPY run.sh /

# Add autograder user.
RUN useradd ag

# Set an environment variable indicating that we're in the autograder.
ENV GRADER TRUE

# Give autograder ownership of relevant files.
RUN chown -R ag ${JL_DIR}
RUN chown -R ag ${JL_DEPOT}
RUN chown -R ag /data

RUN chmod +x /run.sh
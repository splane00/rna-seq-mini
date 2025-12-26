FROM bioconductor/bioconductor_docker:RELEASE_3_20

# Install Python and pip
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    && rm -rf /var/lib/apt/lists/*

# Python dependencies
RUN python3 -m pip install --no-cache-dir numpy pandas

WORKDIR /app
COPY . /app

# Fail fast if DESeq2 is missing
RUN R -e "library(DESeq2)"

CMD ["bash", "run.sh"]

FROM bioconductor/bioconductor_docker:RELEASE_3_20

# Install Python + Python packages (no pip, PEP 668 safe)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-numpy \
    python3-pandas \
    && rm -rf /var/lib/apt/lists/*

# Install DESeq2 explicitly
RUN R -e "BiocManager::install('DESeq2', ask=FALSE, update=FALSE)"

WORKDIR /app
COPY . /app

# Fail fast: confirm DESeq2 is available
RUN R -e "library(DESeq2)"

CMD ["bash", "run.sh"]
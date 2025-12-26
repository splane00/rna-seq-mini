FROM bioconductor/bioconductor_docker:RELEASE_3_20

# Install Python and Python packages via apt (PEP 668 safe)
RUN apt-get update && apt-get install -y \
    python3 \
    python3-numpy \
    python3-pandas \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . /app

# Fail fast if DESeq2 is missing
RUN R -e "library(DESeq2)"

CMD ["bash", "run.sh"]

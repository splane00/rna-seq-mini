FROM rocker/r-ver:4.4.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Python packages
RUN pip3 install numpy pandas

# R packages
RUN R -e "install.packages('BiocManager', repos='https://cloud.r-project.org')"
RUN R -e "BiocManager::install('DESeq2', ask=FALSE, update=FALSE)"
RUN R -e "install.packages('ggplot2', repos='https://cloud.r-project.org')"

WORKDIR /app
COPY . /app

CMD ["bash", "run.sh"]

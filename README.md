# Differential Expression Mini-Analysis (Simulated RNA-seq Dataset)

This repository demonstrates a fully reproducible RNA-seq differential expression analysis using simulated count data.

The goal is to showcase:
- Python-based data generation
- R-based statistical modeling (DESeq2)
- Clean Python → R integration
- One-command reproducibility

No external datasets or FASTQ files are required.

---

## Quick Start
1. Clone the repo, start the Docker build, and run the pipeline:
```bash
git clone https://github.com/splane00/rna-seq-mini.git
cd rna-seq-mini

docker build -t rna-seq-mini .
docker run --rm -v "$PWD/results:/app/results" rna-seq-mini
```  
2. Open results:
```bash
open results/pca.png
open results/volcano.png
```

## Example Output

<p align="center">
  <img src="docs/example_pca.png" width="350">
  <img src="docs/example_volcano.png" width="350">
</p>

PCA and volcano plots from DESeq2 analysis of simulated RNA-seq data, showing clear separation between control and treated samples.

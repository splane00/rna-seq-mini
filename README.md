# Differential Expression Mini-Analysis (Simulated RNA-seq)

This repository demonstrates a fully reproducible RNA-seq differential expression analysis using **simulated count data**.

The goal is to showcase:
- Python-based data generation
- R-based statistical modeling (DESeq2)
- Clean Python → R integration
- One-command reproducibility

No external datasets or FASTQ files are required.

---

## Quick Start

```bash
git clone https://github.com/YOUR_USERNAME/rna-seq-mini.git
cd rna-seq-mini

conda env create -f environment.yml
conda activate rna-seq-mini

bash run.sh
```

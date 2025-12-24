# Differential Expression Mini-Analysis (Simulated RNA-seq)

This repository demonstrates a fully reproducible RNA-seq differential expression analysis using simulated count data.

The goal is to showcase:
- Python-based data generation
- R-based statistical modeling (DESeq2)
- Clean Python → R integration
- One-command reproducibility

No external datasets or FASTQ files are required.

---

## Quick Start
On first run, DESeq2 is installed automatically via Bioconductor inside the conda R environment.  

```bash
git clone https://github.com/splane00/rna-seq-mini.git
cd rna-seq-mini

conda env create -f environment.yml
conda activate rna-seq-mini

bash run.sh
```
## Example Output

<p align="center">
  <img src="docs/example_pca.png" width="350">
  <img src="docs/example_volcano.png" width="350">
</p>

**PCA plot** shows that treatment status is the dominant source of variance after normalization.
 
**Volcano plot** highlights genes with statistically significant expression changes recovered by DESeq2 from the simulated dataset.
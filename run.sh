#!/usr/bin/env bash
set -e

mkdir -p results

echo "Simulating RNA-seq counts"
python scripts/simulate_counts.py

echo "Running DESeq2 analysis"
Rscript scripts/run_deseq2.R

echo "Pipeline complete. Results in ./results/"

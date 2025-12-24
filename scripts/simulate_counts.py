import numpy as np
import pandas as pd

np.random.seed(42)

n_genes = 1000
n_samples = 6
conditions = ["control"] * 3 + ["treated"] * 3

# Baseline expression
base_means = np.random.gamma(shape=2.0, scale=100.0, size=n_genes)

# Pick DE genes
de_genes = np.random.choice(n_genes, size=100, replace=False)

counts = []

for i, condition in enumerate(conditions):
    mu = base_means.copy()
    if condition == "treated":
        mu[de_genes] *= 2.0  # true fold change
    sample_counts = np.random.negative_binomial(
        n=10, p=10 / (10 + mu)
    )
    counts.append(sample_counts)

counts = np.array(counts).T

gene_ids = [f"Gene_{i+1}" for i in range(n_genes)]
sample_ids = [f"S{i+1}_{cond}" for i, cond in enumerate(conditions)]

count_df = pd.DataFrame(counts, index=gene_ids, columns=sample_ids)

count_df.to_csv("results/counts.tsv", sep="\t")

print("Simulated RNA-seq count matrix written to results/counts.tsv")

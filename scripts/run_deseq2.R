library(DESeq2)
library(ggplot2)

counts <- read.table("results/counts.tsv", header=TRUE, row.names=1)

condition <- factor(c(rep("control", 3), rep("treated", 3)))
coldata <- data.frame(row.names=colnames(counts), condition)

dds <- DESeqDataSetFromMatrix(
  countData = counts,
  colData = coldata,
  design = ~ condition
)

dds <- DESeq(dds)

# Normalized counts
norm_counts <- counts(dds, normalized=TRUE)
write.table(
  norm_counts,
  "results/normalized_counts.tsv",
  sep="\t",
  quote=FALSE
)

# PCA
vsd <- vst(dds)
pca <- plotPCA(vsd, intgroup="condition", returnData=TRUE)
percentVar <- round(100 * attr(pca, "percentVar"))

p <- ggplot(pca, aes(PC1, PC2, color=condition)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  theme_minimal()

ggsave("results/pca.png", plot=p, width=5, height=4)

# Differential expression
res <- results(dds)
res_df <- as.data.frame(res)
res_df$gene <- rownames(res_df)

write.table(
  res_df,
  "results/deseq2_results.tsv",
  sep="\t",
  quote=FALSE,
  row.names=FALSE
)

# Volcano plot
res_df$significant <- res_df$padj < 0.05

v <- ggplot(res_df, aes(log2FoldChange, -log10(padj))) +
  geom_point(aes(color=significant), alpha=0.6) +
  scale_color_manual(values=c("grey", "red")) +
  theme_minimal()

ggsave("results/volcano.png", plot=v, width=5, height=4)

cat("DESeq2 analysis complete.\n")

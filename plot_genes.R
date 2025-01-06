library(Signac)
library(Seurat)
library(GenomeInfoDb)
library(BSgenome.Drerio.UCSC.danRer11)
library(future)
library(ggplot2)
library(patchwork)
library(Matrix)
library(dplyr)
set.seed(1234)
library(AcidGenomes)
library(rtracklayer)

args <- commandArgs(trailingOnly = TRUE)
myRDS <- args[1]
split_string <- strsplit(myRDS, '_')[[1]]
mysample <- split_string[1]
print(mysample) 

myfile <- args[2]

myObject <- readRDS(myRDS)

DefaultAssay(myObject) <- "RNA"
gene_list <- rownames(myObject)
head(gene_list) 


figure_name <- ""
figure_name <- paste(mysample, "_Tmarkers.pdf", sep="")
pdf(file =figure_name, width=20)
 
genes  <- readLines(myfile)
genes
for (gene in genes)
{
plot <- FeaturePlot(myObject , features =gene, reduction = "umap", cols = c("lightgrey", "red"), pt.size = 0.1, order =TRUE)
print(plot)
}
dev.off()




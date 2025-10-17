library(Seurat)

# Load data
meta = read.table("data/GSE144236_patient_metadata_new.txt.gz")
counts = data.table::fread("data/GSE144236_cSCC_counts.txt.gz", sep = "\t")
counts = as.data.frame(counts[-c(1,2),])
rownames(counts) = counts[,1]
counts = counts[,-1]

# filter data
p9_cells = rownames(meta)[meta$patient=="P9"]
p9_counts = counts[,p9_cells]
p9_meta = meta[p9_cells,]

# create Seurat object
srat = CreateSeuratObject(p9_counts, meta.data = p9_meta)
saveRDS(srat, file = "data/P9_srat.RDS")

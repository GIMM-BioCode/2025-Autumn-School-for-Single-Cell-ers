- `muscat`: cluster-based, pseudobulk-/mixed model-based differential state analysis ([code](https://bioconductor.org/packages/muscat), [ref](http://dx.doi.org/10.1038/s41467-020-19894-4))
- `miloDE`: cluster-free/neighborhood-based differential state analysis ([code](https://github.com/MarioniLab/miloDE), [ref](http://dx.doi.org/10.1101/2023.03.08.531744))
- `miloR`: cluster-free/neighborhood-based differential abundance analysis ([code](https://bioconductor.org/packages/miloR), [ref](http://dx.doi.org/10.1038/s41587-021-01033-z))
- `SingleCellHaystack`: cluster-independent differential expression analysis ([code](https://github.com/alexisvdb/singleCellHaystack), [ref](https://doi.org/10.1038/s41467-020-17900-3))
- `OSCA`: online resource single-cell analysis using R/Bioconductor ([book](https://bioconductor.org/books/OSCA))
- `OSTA`: online resource spatial transcriptomics analysis using R/Bioconductor ([book](https://lmweber.github.io/OSTA))

**principal component regression**

```r
pcs <- reducedDim(sce, "PCA")
xs <- names(colData(sce))

pcr <- lapply(xs, \(x) {
    fit <- summary(lm(pcs ~ sce[[x]]))
    r2 <- sapply(fit, \(.) .$adj.r.squared)
    data.frame(x, pc=seq_along(r2), r2)
}) |> do.call(what=rbind)

ggplot(pcr, aes(pc, r2, col=x)) +
    geom_line() + geom_point() +
    coord_cartesian(xlim=c(1, 20))
```
<img width="1907" height="938" alt="image" src="https://github.com/user-attachments/assets/dd8ee538-a5d1-43b5-8c28-675b1f00ffed" />

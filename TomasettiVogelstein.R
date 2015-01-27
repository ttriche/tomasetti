**A very simple reanalysis of Tomasetti & Vogelstein (Science, 2015)**
======================================================================
Steps:

- read in the data from the supplement, extracted with Tabula & fixed in vim

```{r readData, message=FALSE}
TyV <- read.table('TomasettiVogelstein.tsv', header=T, sep="\t", row.names=1)

## only keep the columns used in the paper
TyV <- TyV[, c(1,6)] 

## give them simpler names 
names(TyV) <- c('risk','lscd')
```

- Look at what happens if we compute everything on the raw scale:

```{r naturalScale, message=FALSE}
R <- with(TyV, cor(risk, lscd))
R2 <- with(TyV, cor(risk, lscd))**2
print(paste("Pearson's R is", R, "and R^2 is", R2, "on the raw data."))
```

- Verify that we get the same results as the authors on the log10 scale:

```{r log10scale, message=FALSE} 
Rlog10 <- with(TyV, cor(log10(risk), log10(lscd)))
R2log10 <- with(TyV, cor(log10(risk), log10(lscd)))**2
print(paste("Pearson's R is", Rlog10, "and R^2 is", R2log10, "on log10(data)."))
```

- Gaze in wonderment at http://arxiv.org/abs/1501.05035 point 3,
  whereupon the authors claim that R^2 on the natural scale is about 0.99. ?!


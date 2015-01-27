TyV <- read.table('TomasettiVogelstein.tsv', header=T, sep="\t", row.names=1)
TyV <- TyV[, c(1,6)] 
names(TyV) <- c('risk','lscd')

R <- with(TyV, cor(risk, lscd))
R2 <- with(TyV, cor(risk, lscd))**2
print(paste("Pearson's R is", R, "and R^2 is", R2, "on the raw data."))

Rlog10 <- with(TyV, cor(log10(risk), log10(lscd)))
R2log10 <- with(TyV, cor(log10(risk), log10(lscd)))**2
print(paste("Pearson's R is", Rlog10, "and R^2 is", R2log10, "on log10(data)."))

################################################################################
# Package for the RNAseq dataset feature selection
# Done accodring to the tutorial from Rpackages book
# https://r-pkgs.org/whole-game.html#use_r

################################################################################

library(devtools)
library(here)

# create a git repo for the package
use_git()
# use_r makes a separate R file for the function
use_r('readData')

################################################################################
# Test driving the function
################################################################################

# 1. Load all of the functions readData.R
load_all()

# 2. Test the readData function
assay = here('data','rna_normalized_logcpm.csv')
meta = here('data','rna_metadata.csv')
se = createSummarizedExperiment(pathToAssayData = assay,
                           pathToColData = meta)
# check manually if the rownames and colnames are different
dif = setdiff(colnames(assay), rownames(meta))
print(dif)

# 2. Check if the function works with check() command
check()

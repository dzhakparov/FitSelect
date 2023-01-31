library(dplyr)
library(DESeq2)
library(edgeR)
library(SummarizedExperiment)
library(glue)

#' Function to read the RNAseq and Meta data and create a SummarizedExperiment
#' Object
#'
#' @param pathToAssayData path to RNAseq data
#' @param pathToColData path to meta data file
#'
#' @return
#' @export
#'
#' @examples
createSummarizedExperiment <- function(pathToAssayData, pathToColData){

  require(SummarizedExperiment)

  # Load assay data and column data
  assayData <- read.table(pathToAssayData, row.names = 1, header = TRUE, sep = ',')
  colData <- read.table(pathToColData, row.names = 1, header = TRUE, sep = ',')

  # Check if column names in assayData and colData match
  if (!all(colnames(assayData) %in% rownames(colData))) {
    stop("Error: row names in assayData and colData do not match")
  }

  # Create summarizedExperiment object
  se <- SummarizedExperiment(assay = assayData, colData = colData)

  return(se)
}

#assayData <- read.table(assay, row.names = 1, header = TRUE, sep = ',')
#colData <- read.table(meta, row.names = 1, header = TRUE, sep = ',')

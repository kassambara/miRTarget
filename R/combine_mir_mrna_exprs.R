#' @include all_classes.R
NULL
#' Combine miRNA and mRNA expression data
#'
#' @description Combine miRNA and mRNA expression data.
#' The output dataset will be used for statistical approach-based miRNA target predictions.
#' The name and the number of samples in the two data set should be identical.
#'
#' @param mirna_data a numeric matrix or data frame containing the miRNA expression profile.
#' Rows are miRNA names and columns are samples.
#' @param mrna_data a numeric matrix or data frame containing the mRNA gene expression profile.
#' Rows are gene names and columns are samples.
#' @return Returns an object of class MirMrnaExprs which is a data.frame containing the combined gene expression data.
#' It includes also two attributes "mirna_index" and "mrna_index". Rows are samples and columns are miRNA/mRNA names.
#'
#' @author Alboukadel Kassambara \email{alboukadel.kassambara@@gmail.com}
#' @references A. Kassambara. Statistical Tools for High-throughput Data Analysis. http://www.sthda.com
#'
#' @name combine_mir_mrna_exprs
#' @rdname combine_mir_mrna_exprs
#' @export
combine_mir_mrna_exprs <- function(mirna_data, mrna_data){

  if(!all.equal(colnames(mirna_data), colnames(mrna_data)))
    stop("miRNA and mRNA data must have the same column names (i.e. samples)")

  nrows <- nrow(mirna_data) + nrow(mrna_data)
  mirna_index <- 1:nrow(mirna_data)
  mrna_index <- (nrow(mirna_data)+1):nrows

  mirna_data <- t(mirna_data)
  mrna_data <- t(mrna_data)

  res <- cbind.data.frame(mirna_data, mrna_data[rownames(mirna_data), ])

  res <- MirMrnaExprs(res)
  attr(res, "mirna_index") <- mirna_index
  attr(res, "mrna_index") <- mrna_index
  res
}


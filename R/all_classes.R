#' MirMrnaExprs object and constructor
#'
#' MirMrnaExprs extends data.frame. It is used by
#' \code{\link{combine_mir_mrna_exprs}} to wrap up the results. This constructor
#' function would not typically be used by "end users".
#'
#'
#' @param data.frame a data.frame of combine_mir_mrna_exprs()
#'
#' @return a MirMrnaExprs object
#' @docType class
#' @aliases MirMrnaExprs-class
#' @rdname MirMrnaExprs
#' @export
MirMrnaExprs <- function(data.frame) {
  if(inherits(data.frame, "matrix")) data.frame <- as.data.frame(data.frame)
  structure(data.frame, class = c("data.frame", "MirMrnaExprs"))
}

#' MirTarget object and constructor
#'
#' MirTarget extends data.frame. It is used to wrap up the results
#' of predicted and validated target. This constructor
#' function would not typically be used by "end users".
#'
#'
#' @param data.frame a data frame
#'
#' @return a MirTarget object
#' @docType class
#' @aliases MirTarget-class
#' @rdname MirTarget
#' @export
MirTarget <- function(data.frame) {

   min_cnames <- c("mirna_name", "target.gene_name",  "status")

   if(!(all(min_cnames%in%names(data.frame))))
     stop("Target data must contains at least these three columns: ",
          paste(mir_cnames, collapse = ", "))

   structure(data.frame, class = c("data.frame", "MirTarget"))
}




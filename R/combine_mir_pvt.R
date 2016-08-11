#' @include all_classes.R
NULL
#'Combine miRNA predicted and validated targets
#'
#'@description A helper function for combining miRNA predicted and validated
#'  targets. Duplicated miRNA-target interactions are automatically removed.
#'@param p_targets,v_targets an object of class MirTarget
#'
#'@return  Returns an object of class MirTarget which is a data frame containing
#'  combined predicted and validated targets for each miRNA. The final results
#'  might contains different status of miRNA-target interactions (MTIs):
#'  \itemize{ \item V: for validated MTIs \item P: for predicted MTIs}
#'
#'@author Alboukadel Kassambara \email{alboukadel.kassambara@@gmail.com}
#'@references A. Kassambara. Statistical Tools for High-throughput Data
#'  Analysis. http://www.sthda.com
#' @examples
#' \dontrun{
#' # Example of miRNAs
#' miRNAs <- c("hsa-miR-16", "hsa-miR-155")
#'
#' # Validated target from miRecords
#' v_targets <- get_mirecords_vt(miRNAs)
#'
#' # Get predicted target
#' p_targets <- get_mirecords_pt(miRNAs)
#'
#'# Combine
#' targets <- combine_mir_pvt(p_targets, v_targets)
#' head(targets)
#' }
#'
#'@name combine_mir_pvt
#'@rdname combine_mir_pvt
#'@export
combine_mir_pvt <- function(p_targets, v_targets){

  if(!inherits(p_targets, "MirTarget"))
    stop("p_targets must be an object of class MirTarget.")

  if(!inherits(v_targets, "MirTarget"))
    stop("v_targets must be an object of class MirTarget.")

  p_targets$status <- rep("P", nrow(p_targets))
  v_targets$status <- rep("V", nrow(v_targets))

  rownames(v_targets) <- paste0(v_targets$mirna_name, "::", v_targets$target.gene_name)
  rownames(p_targets) <- paste0(p_targets$mirna_name, "::", p_targets$target.gene_name)

  only_v <- subset(v_targets, !(rownames(v_targets) %in% rownames(p_targets)))
  only_p <- subset(p_targets, !(rownames(p_targets) %in% rownames(v_targets)))
  pv <- subset(p_targets, (rownames(p_targets) %in% rownames(v_targets)))
  pv$status <- rep("V", nrow(pv))
  targets <- rbind(only_v, only_p, pv)
  rownames(targets) <- 1:nrow(targets)
  targets <- na.omit(targets)
  MirTarget(targets)
}

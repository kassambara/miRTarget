#' @include all_classes.R
NULL
#' Get predicted and validated targets for miRNAs using miRecords database
#'
#' @description miRecords (\url{http://c1.accurascience.com/miRecords/}) is a
#'   resource for animal miRNA-target interactions. There are two components in
#'   miRecords. The experimentally Validated Targets (vt) component and the
#'   Predicted Targets (pt) component which is an integration of predicted miRNA
#'   targets produced by 11 established miRNA target prediction programs.
#'   \itemize{
#'
#'   \item \bold{get_mirecords_pt()}: Recursively retrieve the predicted targets
#'   for each miRNA. Only predicted targets by at least n/11 database are kept,
#'   where \bold{n} is user-defined. Internet connexion is required the first
#'   time you use this function. \item \bold{get_mirecords_vt()}: Download
#'   validated targets for each miRNA. Internet connexion is required. }
#'
#' @param miRNAs a character vector containing miRNA names (e.g.: miRNAs =
#'   c("hsa-miR-16", "hsa-miR-34a))
#' @param n integer specifying the minimal number of prediction for each miRNA.
#'   In other words, Only predicted target by at least n/11 database are kept.
#'   Default value is 5.
#' @param species species names as available on miRecords database. Possible
#'   values are one of: "Homo sapiens", "Mus musculus", "Rattus norvegicus",
#'   "Caenorhabditis elegans", "Drosophila melanogaster", "Gallus gallus", "Ovis
#'   aries", "Canis familiaris". Default value is "Homo sapiens".
#' @param result_file path to result file for holding miRNA predicted/validated
#'   targets. Default values are "mirna_mirecords_predicted_targets.txt".
#' @param keep_db_names logical value. If TRUE, keep the name of the 11 databases used for target predictions.
#' @param show_progress logical value. If TRUE, a progress bar is shown.
#' @return \itemize{ \item \bold{get_mirecords_pt()}: Downloads and returns an object of class MirTarget which is a
#' data frame containing predicted targets for each miRNA. It saves also the
#' results as a tab-delimited .txt file, which default name is
#' "mirna_mirecords_predicted_targets.txt". If this file exists already in your
#' working directory, then get_mirecords_pt() will simply import it into R.
#' \item \bold{get_mirecords_vt()}:  Downloads and returns an object of class MirTarget which is a data frame
#' containing validated targets for each miRNA.
#'
#' }
#' @author Alboukadel Kassambara \email{alboukadel.kassambara@@gmail.com}
#' @references A. Kassambara. Statistical Tools for High-throughput Data
#'   Analysis. http://www.sthda.com
#' @examples
#' \donttest{
#' # Predicted targets
#'  ptget <- get_mirecords_pt(c("hsa-miR-16", "hsa-miR-155"))
#'  head(ptget)
#'
#' # Validated targets
#'  vtget <- get_mirecords_vt(c("hsa-miR-16", "hsa-miR-155"))
#'  head(vtget)
#'
#' }
#'
#' @name get_mirecords
#' @rdname get_mirecords
#' @export
get_mirecords_pt <- function(miRNAs, n = 5, species = "Homo sapiens",
                             result_file = "mirna_mirecords_predicted_targets.txt",
                             keep_db_names = FALSE,
                             show_progress = TRUE){

  .check_species(species)

  # Columns contained in the result file

  columns <- c("miRNA ID", 	"Symbol",
               "diana", "microinspector",	"miranda",	"mirtarget2",
               "mitarget", "nbmirtar",	"pictar", "pita",	"rna22",
               "rnahybrid", "targetscan")

  columns_2 <- columns
  columns_2[1:2] <- c("mirna_name", "target.gene_name")
  species = gsub(" ", "+", species, fixed = TRUE)

  if(file.exists(result_file)){
    warning(result_file, " exists already and has been simply imported into R. ",
             "If you want to download it again, remove the old file.")

    res <- read.table(result_file, sep ="\t", header= TRUE, row.names = NULL,
                      comment.char = "#", quote = "")
    rsum <- apply(res[, 3:13], 1, sum)
    res <- subset(res, rsum >= n)

    # Remove duplicated rows
    row_ids <- paste0(res$mirna_name, res$target.gene_name)
    res <- res[!duplicated(row_ids), , drop = FALSE]

    if(!keep_db_names) res <- res[, 1:2, drop = FALSE]

    res$status <- rep("predicted", nrow(res))
    res <- subset(res, res$mirna_name %in% miRNAs)
    return(MirTarget(res))
  }

    write.table(matrix(columns_2, nrow = 1), file = result_file, sep ="\t",
              append = FALSE, quote = FALSE, row.names = FALSE,
              col.names = FALSE)

  # For each miRNA find the predicted target by at least 5 data base
  if(show_progress) message("\nDownloading predicted target....\n")
  if(show_progress) progressBar <- txtProgressBar(min = 0, max = length(miRNAs), style = 3)

  i = 0
  for(mir in miRNAs){
    # 1. Download predicted target for the miRNA
    url <- paste0("http://c1.accurascience.com/miRecords/download_data.php?",
                  "p=1&species=", species, "&targetgene_type=refseq_acc&",
                  "targetgene_info=&search_int=Search&pn=", n, "&mirna_acc=", mir)

    dest_file <- paste0(mir, ".xls")
    download.file(url, dest_file, quiet = TRUE)

    # 2. Read the xls file
    dd <- read.table(dest_file, sep="\t",
                     header = TRUE, row.names = NULL, quote = "",
                     comment.char = "#", check.names = FALSE)
    dd <- dd[, columns, drop = FALSE]
    if(nrow(dd)== 0) dd[1, ] <-c(mir, rep(NA, length(columns)-1))

    # 3. Append dd in the final output file
    write.table(dd, file = result_file, sep ="\t",
                append = TRUE, quote = FALSE, row.names = FALSE,
                col.names = FALSE)

    # unlink xlsx file
     unlink(dest_file)
    i = i+1
    if(show_progress) setTxtProgressBar(progressBar, i)
  }
  if(show_progress) {
    close(progressBar)
    message("**Finished**")
  }
  message("Results have been saved in the following file: ", result_file)
  res <- read.table(result_file, sep ="\t", header= TRUE, row.names = NULL,
                    quote = "", comment.char = "#")
  # Remove duplicated rows
  row_ids <- paste0(res$mirna_name, res$target.gene_name)
  res <- res[!duplicated(row_ids), , drop = FALSE]

  if(!keep_db_names) res <- res[, 1:2, drop = FALSE]

  res$status <- rep("predicted", nrow(res))
  return(MirTarget(res))
}

#' @param version miRecords version. Default value is 4
#' @name get_mirecords
#' @rdname get_mirecords
#' @export
get_mirecords_vt <- function(miRNAs, species = "Homo sapiens", version = 4){

  .check_species(species)

  message("Downloading miRecords miRNA validated targets...")

  url <- paste0("http://c1.accurascience.com/miRecords/download_data.php?v=", version)
  download.file(url, "mirecords_vt.xls", quiet = TRUE)
  mirecords <- readxl::read_excel("mirecords_vt.xls")
  unlink("mirecords_vt.xls")
  hs_vt <- mirecords[which(mirecords$miRNA_species %in% species),
                     c("Target gene_name",  "miRNA_mature_ID")]
  colnames(hs_vt) <- tolower(make.names(colnames(hs_vt)))

  miRNAs <- data.frame(mirna_name = miRNAs)
  v_target <- merge(x=miRNAs, y = hs_vt,
                    by.x="mirna_name", by.y="mirna_mature_id",
                    all.x = TRUE, sort = FALSE)
  # Remove duplicated rows
  row_ids <- paste0(v_target$mirna_name, v_target$target.gene_name)
  v_target <- v_target[!duplicated(row_ids), ]

  v_target$status <- rep("validated", nrow(v_target))
  return(MirTarget(v_target))
}


# Helper functions
.check_species <- function(species)
  {
  sp <- c("Homo sapiens", "Mus musculus", "Rattus norvegicus",
          "Caenorhabditis elegans", "Drosophila melanogaster",
          "Gallus gallus", "Ovis aries", "Canis familiaris")
  if(!(species %in% sp)) stop(species, " is not supported. Allowed values are: ",
                              paste(sp, collapse =", "))
 }

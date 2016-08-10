#' @include all_classes.R
NULL
#' Get validated targets for miRNAs using miRTarBase database
#'
#' @description miRTarBase (\url{http://mirtarbase.mbc.nctu.edu.tw/index.php})
#'   is an experimentally validated microRNA-target interactions (MTIs)
#'   database. MTIs are validated experimentally by reporter assay, western
#'   blot, microarray and next-generation sequencing experiments. The miRTarBase
#'   provides the most updated collection by comparing with other similar,
#'   previously developed databases. \itemize{ \item \bold{get_mirtarbase_vt()}:
#'   Download validated targets for each miRNA using miRTarBase. Internet
#'   connexion is required. }
#'
#' @param miRNAs a character vector containing miRNA names (e.g.: miRNAs =
#'   c("hsa-miR-16", "hsa-miR-34a))
#' @param species of interest as available on miRTarbase (see
#'   http://mirtarbase.mbc.nctu.edu.tw/php/download.php). Allowed values are one
#'   of: 'Arabidopsis thaliana', 'Bombyx mori', 'Bos taurus', 'Caenorhabditis
#'   elegans', 'Drosophila melanogaster', 'Danio rerio', 'Epstein Barr virus',
#'   'Gallus gallus', 'Human cytomegalovirus', 'Homo sapiens', 'Kaposi
#'   sarcoma-associated herpesvirus', 'Mus musculus', 'Ovis aries', 'Oryza
#'   sativa', 'Rattus norvegicus', 'Vesicular stomatitis Indiana virus',
#'   'Xenopus laevis', 'Xenopus tropicalis'.
#' @param version the current version of miRTarbase
#' @return \itemize{ \item \bold{get_mirtarbase_vt()}:  Downloads and returns an
#'   object of class .MirTarget which is a data frame containing validated
#'   targets for each miRNA. Internet connexion is required.
#'   }
#' @author Alboukadel Kassambara \email{alboukadel.kassambara@@gmail.com}
#' @references A. Kassambara. Statistical Tools for High-throughput Data
#'   Analysis. http://www.sthda.com
#' @examples
#' \donttest{
#' # 3. Get validated targets for miRNA of interest
#'  vtget <- get_mirtarbase_vt(c("hsa-miR-16", "hsa-miR-155"))
#'
#'  head(vtget)
#' }
#'
#' @name get_miretarbase
#' @rdname get_mirtarbase
#' @export
get_mirtarbase_vt <- function(miRNAs, species = "Homo sapiens", version = 6.1){

  # Dowload the file
  message("Downloading miRTarbase miRNA validated targets...")
  destfile <- .get_file_name(species)
  url <- paste0("http://mirtarbase.mbc.nctu.edu.tw/cache/download/",
                version, "/", destfile)
  download.file(url, destfile, quiet = TRUE)

  # Read the excel file
  mirtarbase <- readxl::read_excel(destfile, 1)
  mirtarbase <- mirtarbase[, c("miRNA" ,"Target Gene")]
  colnames(mirtarbase) <- c("mirna_name", "target.gene_name")

  miRNAs <- data.frame(mirna_name = miRNAs)
  v_target <- merge(x=miRNAs, y = mirtarbase,
                    by.x="mirna_name", by.y="mirna_name",
                    all.x = TRUE, sort = FALSE)
  # Remove duplicated rows
  row_ids <- paste0(v_target$mirna_name, v_target$target.gene_name)
  v_target <- v_target[!duplicated(row_ids), ]
  v_target$status <- rep("validated", nrow(v_target))
  MirTarget(v_target)
}


# Helper
.get_file_name <- function(species){

  sp <- c('Arabidopsis thaliana', 'Bombyx mori', 'Bos taurus',
          'Caenorhabditis elegans', 'Drosophila melanogaster',
          'Danio rerio', 'Epstein Barr virus', 'Gallus gallus',
          'Human cytomegalovirus', 'Homo sapiens', 'Kaposi sarcoma-associated herpesvirus',
          'Mus musculus', 'Ovis aries', 'Oryza sativa', 'Rattus norvegicus',
          'Vesicular stomatitis Indiana virus', 'Xenopus laevis', 'Xenopus tropicalis')

  ff <- c('ath_MTI.xls', 'bmo_MTI.xls', 'bta_MTI.xls', 'cel_MTI.xls',
          'dme_MTI.xls', 'dre_MTI.xls', 'ebv_MTI.xls', 'gga_MTI.xls',
          'hcmv_MTI.xls', 'hsa_MTI.xlsx', 'kshv_MTI.xls', 'mmu_MTI.xls',
          'oar_MTI.xls', 'osa_MTI.xls', 'rno_MTI.xls', 'vsv_MTI.xls',
          'xla_MTI.xls', 'xtr_MTI.xls')

  names(ff) <- sp
  if(!(species %in% sp)) stop(species, " is not supported. Allowed values are: ",
                              paste(sp, collapse =", "))
  ff[species]
}

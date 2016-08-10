<!-- README.md is generated from README.Rmd. Please edit that file -->
miRTarget : Integrative analysis of miRNA and mRNA
==================================================

miRTarget helps to find miRNA predicted and validated targets. Two databases are used [miRecords](http://c1.accurascience.com/miRecords/) and [miRTarBase](http://mirtarbase.mbc.nctu.edu.tw)

Installation and loading
------------------------

-   Install the latest version from [GitHub](https://github.com/kassambara/miRTarget) as follow:

``` r
# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/miRTarget")
```

-   Loading

``` r
library(miRTarget)
```

Examples of miRNAs
------------------

``` r
miRNAs <- c("hsa-miR-28-5p", "hsa-miR-768-5p")
```

Find miRNA targets
------------------

### Get predicted miRNA targets

[miRecords.v4](c1.accurascience.com/miRecords/) database is used. For each miRNA, we want to identify the predicted target genes by at least 5/11 databases.

The 11 databases are : "diana", "microinspector", "miranda", "mirtarget2", "mitarget", "nbmirtar", "pictar", "pita", "rna22", "rnahybrid", "targetscan".

Internet connexion is required.

``` r
p_targets <- get_mirecords_pt(miRNAs, n = 5, species = "Homo sapiens",
                                      result_file = "mirna_mirecords_predicted_targets.txt")
#> 
#> Downloading predicted target....
#> 
  |                                                                       
  |                                                                 |   0%
  |                                                                       
  |================================                                 |  50%
  |                                                                       
  |=================================================================| 100%
#> **Finished**
#> Results have been saved in the following file: mirna_mirecords_predicted_targets.txt
head(p_targets, 10)
#>       mirna_name target.gene_name    status
#> 1  hsa-miR-28-5p              EN2 predicted
#> 2  hsa-miR-28-5p         KIAA0355 predicted
#> 3  hsa-miR-28-5p            MYST3 predicted
#> 4  hsa-miR-28-5p            HOXA1 predicted
#> 5  hsa-miR-28-5p            YPEL3 predicted
#> 6  hsa-miR-28-5p              RHO predicted
#> 7  hsa-miR-28-5p            LSM12 predicted
#> 9  hsa-miR-28-5p            IKZF4 predicted
#> 10 hsa-miR-28-5p          CSNK1G1 predicted
#> 11 hsa-miR-28-5p            CABP7 predicted
```

### Get miRNA validated targets

miRecords and miRtarbase are used. Internet connexion is required.

1.  miRecords

``` r
mirecords_vt <- get_mirecords_vt(miRNAs, 
                                 species = "Homo sapiens", version = 4)
#> Downloading miRecords miRNA validated targets...
head(mirecords_vt, 10)
#>       mirna_name target.gene_name    status
#> 1  hsa-miR-28-5p          gag-pol validated
#> 2 hsa-miR-768-5p             <NA> validated
```

1.  miRtarbase

``` r
mirtarbase_vt <- get_mirtarbase_vt(miRNAs)
#> Downloading miRTarbase miRNA validated targets...
head(mirtarbase_vt, 10)
#>       mirna_name target.gene_name    status
#> 1  hsa-miR-28-5p        LINC00346 validated
#> 2  hsa-miR-28-5p           SEMA4C validated
#> 3  hsa-miR-28-5p           ZNF106 validated
#> 4  hsa-miR-28-5p          NKIRAS2 validated
#> 5  hsa-miR-28-5p           IMPDH1 validated
#> 6  hsa-miR-28-5p             AAAS validated
#> 7  hsa-miR-28-5p           CDKN1A validated
#> 8  hsa-miR-28-5p            CENPV validated
#> 9  hsa-miR-28-5p            SMYD1 validated
#> 10 hsa-miR-28-5p            PAQR5 validated
```

1.  Combine validated targets

``` r
v_targets <- combine_mir_vt(mirecords_vt, mirtarbase_vt)
# head(v_targets) 
```

### Merge predicted and validated targets

``` r
targets <- combine_mir_pvt(p_targets, v_targets)
head(targets)
#>       mirna_name target.gene_name status
#> 1  hsa-miR-28-5p          gag-pol      V
#> 2 hsa-miR-768-5p             <NA>      V
#> 3  hsa-miR-28-5p        LINC00346      V
#> 4  hsa-miR-28-5p           SEMA4C      V
#> 5  hsa-miR-28-5p           ZNF106      V
#> 6  hsa-miR-28-5p          NKIRAS2      V
```

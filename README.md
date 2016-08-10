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
#> Warning in get_mirecords_pt(miRNAs, n = 5, species = "Homo
#> sapiens", result_file = "mirna_mirecords_predicted_targets.txt"):
#> mirna_mirecords_predicted_targets.txt exists already and has been simply
#> imported into R. If you want to download it again, remove the old file.
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
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [583, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [583, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [583, 25] got `{Using both wild-type and
#> mutant constructs of human ZEB1 and ZEB2 3_UTRs carrying mutations in all
#> miR-200b/c/429 targeting sites, we now demonstrate that ectopic miR-200c
#> suppresses by directly affecting the predicted miR-200c targeting sites
#> (Fig. 3C)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [752, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [752, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [752, 25] got `{The endogenous wild-type
#> IRS-1 is again down-regulated (about 50) by miR145, but the truncated IRS-1
#> is not.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [753, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [753, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [753, 25] got `{The endogenous wild-type
#> IRS-1 is again down-regulated (about 50) by miR145, but the truncated IRS-1
#> is not.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [951, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [951, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [951, 25] got `{Next, the studies were
#> repeated with random mutations in the recognition sequence, which resulted
#> in abolition of the reporter activation by miR-370 precursor (Figure 5).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1066, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1067, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1068, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1069, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1070, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1071, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1072, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1073, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1074, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1075, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1076, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1077, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1078, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1079, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1080, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1081, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1082, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1083, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1084, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1085, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1086, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1087, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1088, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1089, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1090, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1091, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1092, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1093, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1094, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1095, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1096, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1097, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1098, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1099, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1100, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1101, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1102, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1103, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1104, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1105, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1106, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1107, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1108, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1109, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1110, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1111, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1112, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1113, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1114, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1115, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1116, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1117, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1118, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1119, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1120, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1121, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1122, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1123, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1124, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1125, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1126, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1127, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1128, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1129, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1130, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1131, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1132, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1133, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1134, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1135, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1136, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1137, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1138, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1139, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1140, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1141, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1142, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1143, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1144, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1145, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1146, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1147, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1148, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1149, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1150, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1151, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1152, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1153, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1154, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1155, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1156, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1157, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1158, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1159, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1160, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1161, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1162, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1163, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1164, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1165, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1166, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1167, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1168, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1169, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1170, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1171, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1172, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1173, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1174, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1175, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1176, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1177, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1178, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1179, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1180, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1181, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1182, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1183, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1184, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1185, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1186, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1187, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1188, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1189, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1190, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1191, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1192, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1193, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1194, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1195, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1196, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1197, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1198, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1199, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1200, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1201, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1202, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1203, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1204, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1205, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1206, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1207, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1208, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1209, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1210, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1211, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1212, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1213, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1214, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1215, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1216, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1217, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1218, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1219, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1220, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1221, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1222, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1223, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1224, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1225, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1226, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1227, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1228, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1229, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1230, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1231, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1232, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1233, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1234, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1235, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1236, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1237, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1238, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1239, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1240, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1241, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1242, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1243, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1244, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1245, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1246, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1247, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1248, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1249, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1250, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1251, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1252, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1253, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1254, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1255, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1256, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1257, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1258, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1259, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1260, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1261, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1262, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1263, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1264, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1265, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1266, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1267, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1268, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1269, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1270, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1271, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1272, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1273, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1274, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1275, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1276, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1277, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1278, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1279, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1280, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1281, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1282, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1283, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1284, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1285, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1286, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1287, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1288, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1289, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1290, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1291, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1292, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1293, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1294, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1295, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1296, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1297, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1298, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1299, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1300, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1301, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1302, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1303, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1304, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1305, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1306, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1307, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1308, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1309, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1310, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1311, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1312, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1313, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1314, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1315, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1316, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1317, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1318, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1319, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1320, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1321, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1322, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1323, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1324, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1325, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1326, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1327, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1328, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1329, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1330, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1331, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1332, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1333, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1334, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1335, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1336, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1337, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1338, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1339, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1340, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1341, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1342, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1343, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1344, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1345, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1346, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1347, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1348, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1349, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1350, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1351, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1352, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1353, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1354, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1355, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1356, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1357, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1358, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1359, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1360, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1361, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1362, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1363, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1364, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1365, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1366, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1367, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1368, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1369, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1370, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1371, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1372, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1373, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1374, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1375, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1376, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1377, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1378, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1379, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1380, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1381, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1382, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1383, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1384, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1385, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1386, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1387, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1388, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1389, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1390, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1391, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1392, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1394, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1395, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1396, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1397, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1398, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1399, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1400, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1401, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1402, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1403, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1404, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1405, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1406, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1407, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1408, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1409, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1410, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1411, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1412, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1413, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1414, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1415, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1416, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1417, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1418, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1419, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1420, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1421, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1422, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1423, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1424, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1425, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1426, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1427, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1428, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1429, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1430, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1431, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1432, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1433, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1434, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1435, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1436, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1437, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1438, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1439, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1440, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1441, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1442, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1443, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1444, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1445, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1446, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1447, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1448, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1449, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1450, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1451, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1452, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1453, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1454, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1455, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1456, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1457, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1458, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1459, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1460, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1461, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1462, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1463, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1464, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1465, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1466, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1467, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1468, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1469, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1470, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1471, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1472, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1473, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1474, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1475, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1476, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1477, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1486, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1487, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1488, 25] got `NA`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1489, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1489, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1489, 25] got `{A reporter with
#> mutations in the predicted miR-29 target site (Fig. 4b, white) was not
#> suppressed by miR-29 miRNAs.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1490, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1490, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1490, 25] got `{but a reporter with
#> mutated target sites was not repressed by miR-29 (Fig. 4e, white). This
#> suggests that these two sites mediate miR-29‚Äôs regulation of CDC42}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1491, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1491, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1491, 25] got `{but a reporter with
#> mutated target sites was not repressed by miR-29 (Fig. 4e, white). This
#> suggests that these two sites mediate miR-29‚Äôs regulation of CDC42}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1492, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1492, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1492, 25] got `{Transfection of a
#> CDC34-m1&m2 vector resulted in luciferase activity at levels similar
#> to the control plasmid in the presence or absence of exogenous let-7,
#> demonstrating specific downregulation of reporter activity by let-7 through
#> the Cdc34 3‚ÄôUTR}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1493, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1493, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1493, 25] got `{Cells transfected with
#> miR-128 showed a reduction of 40 229954616n luciferase activity compared
#> to those transfected with empty vectors (Student'st test, p<0.05). When the
#> hypothesized miR-128 binding site in the 3'UTR of E2F3a mRNA was mutated,
#> luciferase activity was restored close to the control level (Fig. 3b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1509, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1509, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1509, 25] got `{mutation in the Bcl-2
#> 3'UTR complimentary to the miR-34 root sequence abolished this effect,
#> indicating that the observed reporter activity is miR-34 sequence-
#> specific.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1510, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1510, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1510, 25] got `{mutation in the Bcl-2
#> 3'UTR complimentary to the miR-34 root sequence abolished this effect,
#> indicating that the observed reporter activity is miR-34 sequence-specific}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1511, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1511, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1511, 25] got `{mutation in the Bcl-2
#> 3'UTR complimentary to the miR-34 root sequence abolished this effect,
#> indicating that the observed reporter activity is miR-34 sequence-
#> specific.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1514, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1514, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1514, 25] got `{In addition, to validate
#> whether RECK is a direct target of miR-21, we mutated the miR-21 binding
#> site in the 30UTR of RECK (in the reporter plasmid) and observed loss of
#> repression (Figure 7d and e).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1515, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1515, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1515, 25] got `{Results from triplicate
#> experiments showed that reporter activity for each site was reduced by the
#> ectopic expression of miR-155, with site 1 exhibiting a more significan
#> tresponse than the two other sites. When these sites were mutated,the
#> luciferase reporter was no longer inhibited by miR-155 (Fig. 5F and G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1516, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1516, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1516, 25] got `{Results from triplicate
#> experiments showed that reporter activity for each site was reduced by the
#> ectopic expression of miR-155, with site 1 exhibiting a more significan
#> tresponse than the two other sites. When these sites were mutated,the
#> luciferase reporter was no longer inhibited by miR-155 (Fig. 5F and G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1517, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1517, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1517, 25] got `{Results from triplicate
#> experiments showed that reporter activity for each site was reduced by the
#> ectopic expression of miR-155, with site 1 exhibiting a more significan
#> tresponse than the two other sites. When these sites were mutated,the
#> luciferase reporter was no longer inhibited by miR-155 (Fig. 5F and G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1525, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1525, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1525, 25] got `{Luciferase constructs
#> were developed that contain each of the miR-181b putative binding sites
#> identified in the mouse AID 3'UTR (BS1-3), or mutated versions of the
#> same (mutBS1-3). Reporter constructs, which included a fi refly luciferase
#> cassette to allow internal Renilla luciferase activity normalization, were
#> transiently cotransfected together with miR-181b duplexes into 293T cells,
#> and luciferase activity was analyzed 24 h later (Fig. S9 shows raw values
#> of luciferase measurements). We found that transfection of the BS1 and BS2
#> constructs in the presence of miR-181b resulted in a signifi cant decrease
#> of luciferase activity when compared with their mutant counterparts mutBS1
#> (85 ¬± 9) and BS2 (45 ¬± 9 0.000000ig. 3 A ),}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1526, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1526, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1526, 25] got `{Luciferase constructs
#> were developed that contain each of the miR-181b putative binding sites
#> identified in the mouse AID 3'UTR (BS1-3), or mutated versions of the
#> same (mutBS1-3). Reporter constructs, which included a fi refly luciferase
#> cassette to allow internal Renilla luciferase activity normalization, were
#> transiently cotransfected together with miR-181b duplexes into 293T cells,
#> and luciferase activity was analyzed 24 h later (Fig. S9 shows raw values
#> of luciferase measurements). We found that transfection of the BS1 and BS2
#> constructs in the presence of miR-181b resulted in a signifi cant decrease
#> of luciferase activity when compared with their mutant counterparts mutBS1
#> (85 ¬± 9) and BS2 (45 ¬± 9 0.000000ig. 3 A ),}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1529, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1529, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1529, 25] got `{let-7a precursor
#> inhibitor had no effect on the activity of pGL3-CASP3/mut-3'UTR reporter.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1530, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1530, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1530, 25] got `{We then proceeded to
#> identify the authenticmiRNAtarget sites bymutagenizing each putativemiRNA
#> target site (except for the first miR-130 target site) conserved in
#> vertebrates, as well as one miR-130 target site that is unique to humans
#> (Supplementary Methods and Supplementary Figs. 6 and 7 online).Most of the
#> conserved putativemiRNA target sites, except for the fourth miR-19 target
#> site and the miR-130 target site unique to humans, were authentic (Fig. 1f
#> and Supplementary Figs. 6 and 7).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1531, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1531, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1531, 25] got `{We then proceeded to
#> identify the authenticmiRNAtarget sites bymutagenizing each putativemiRNA
#> target site (except for the first miR-130 target site) conserved in
#> vertebrates, as well as one miR-130 target site that is unique to humans
#> (Supplementary Methods and Supplementary Figs. 6 and 7 online).Most of the
#> conserved putativemiRNA target sites, except for the fourth miR-19 target
#> site and the miR-130 target site unique to humans, were authentic (Fig. 1f
#> and Supplementary Figs. 6 and 7).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1532, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1532, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1532, 25] got `{We then proceeded to
#> identify the authenticmiRNAtarget sites bymutagenizing each putativemiRNA
#> target site (except for the first miR-130 target site) conserved in
#> vertebrates, as well as one miR-130 target site that is unique to humans
#> (Supplementary Methods and Supplementary Figs. 6 and 7 online).Most of the
#> conserved putativemiRNA target sites, except for the fourth miR-19 target
#> site and the miR-130 target site unique to humans, were authentic (Fig. 1f
#> and Supplementary Figs. 6 and 7).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1533, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1533, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1533, 25] got `{This effect was
#> abolished on a mutated construct in which the putative miR‚ÄìmRNA
#> interaction sequence was deleted, confirming that this miRNA was
#> effectively targeting Gli1 mRNA (Figure 3D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1534, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1534, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1534, 25] got `{As a control, no
#> repression was observed with Smo-3'UTR mutant constructs deleted in the
#> miRNA-binding sites (Figure 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1535, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1535, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1535, 25] got `{As a control, no
#> repression was observed with Smo-3'UTR mutant constructs deleted in the
#> miRNA-binding sites (Figure 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1536, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1536, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1536, 25] got `{As a control, no
#> repression was observed with Smo-3'UTR mutant constructs deleted in the
#> miRNA-binding sites (Figure 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1537, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1537, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1537, 25] got `{In contrast, miR-34a
#> has a minimal effect on a reporter vector with a mutated miR-34a response
#> element. Furthermore, miR-34a does not affect SIRT1 RNA (Fig. 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1540, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1540, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1540, 25] got `{Moreover, miR-19a and
#> miR-19b mimics inhibited the expression of a reporter vector containing
#> SOCS-1 3'UTR, while mutation of the predicted miRNA-binding site abrogated
#> this effect (Fig. 3 B and C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1541, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1541, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1541, 25] got `{Moreover, miR-19a and
#> miR-19b mimics inhibited the expression of a reporter vector containing
#> SOCS-1 3'UTR, while mutation of the predicted miRNA-binding site abrogated
#> this effect (Fig. 3 B and C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1542, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1542, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1542, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF
#> 3'UTR. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1543, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1543, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1543, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF 3'UTR.}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1544, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1544, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1544, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF 3'UTR.}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1545, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1545, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1545, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF 3'UTR.}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1546, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1546, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1546, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF 3'UTR.}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1547, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1547, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1547, 25] got `{Mutation of the
#> predicted miRNA binding sites in the reporter vector abrogated this
#> effect,indicating that these miRNAs directly interact with the PCAF 3'UTR.}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1559, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1559, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1559, 25] got `{Addition of 12 nM
#> miR-659 to N2A cells transfected with vectorD18 failed to repress the
#> luciferase activity (Fig. 4D), supporting the hypothesis that miR-659 binds
#> to the predicted binding-site in the 30-UTR of GRN, overlapping with rs5848
#> at position 78.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1560, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1560, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1560, 25] got `{Mutation of the seed
#> sequence attenuates the repression effect (Fig. 4E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1562, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1562, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1562, 25] got `{Importantly, the mutant
#> miR-26a responsive element was able to mitigate repression (Figure 5F),
#> therefore suggesting a direct regulation of EZH2 via miR-26a}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1563, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1563, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1563, 25] got `{There was a decreased
#> level of relative luciferase activity in cells expressing miR-302a compared
#> to the level in the negative control after transfection with the WT cyclin
#> D1 UTR plasmid (P <0.05), whereas the cells transfected with the mutant
#> cyclin D1 UTR plasmid did not have a decrease in relative luciferase
#> activity, suggesting that miR-302a directly regulates the expression of
#> cyclin D1.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1569, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1569, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1569, 25] got `{For CCNE1, mutation
#> of the single conserved seed complementary site had only a partial effect
#> (Figure 4D), and mutations of both seed complementary sites fully rescued
#> repression for CCNE1, indicating a combination of both sites effects of
#> miR-16}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1571, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1571, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1571, 25] got `{For CCND3, only mutation
#> of thefirst putative binding site rescued repression, which suggestedthat
#> miR-16 regulated CCND3 by targeting thefirst seed complementary site}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1572, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1572, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1572, 25] got `{{Luciferase assays
#> indicated that overexpression of miR-16, miR-195 and miR-424 could reduce
#> the luciferase activity from the reporter construct containing wild-type
#> CCND1 30-UTR (containing both putative binding sites), whereas had no
#> effectiveness on any deletant of CCND1 30-UTR (Figure 2D)}}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1573, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1573, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1573, 25] got `{{Luciferase assays
#> indicated that overexpression of miR-16, miR-195 and miR-424 could reduce
#> the luciferase activity from the reporter construct containing wild-type
#> CCND1 30-UTR (containing both putative binding sites), whereas had no
#> effectiveness on any deletant of CCND1 30-UTR (Figure 2D)}}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1574, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1574, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1574, 25] got `{Luciferase assays
#> indicated that overexpression of miR-16, miR-195 and miR-424 could reduce
#> the luciferase activity from the reporter construct containing wild-type
#> CCND1 30-UTR (containing both putative binding sites), whereas had no
#> effectiveness on any deletant of CCND1 3'-UTR (Figure 2D)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1575, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1575, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1575, 25] got `{Luciferase assays
#> indicated that overexpression of miR-16, miR-195 and miR-424 could reduce
#> the luciferase activity from the reporter construct containing wild-type
#> CCND1 30-UTR (containing both putative binding sites), whereas had no
#> effectiveness on any deletant of CCND1 3'-UTR (Figure 2D)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1584, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1584, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1584, 25] got `{Luciferase activity with
#> the wild-type Dicer 3' UTR construct was significantly lower than that with
#> the vector control or the mutant Dicer 3' UTR construct (Figure 3F).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1585, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1585, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1585, 25] got `{Luciferase activity with
#> the wild-type Dicer 3' UTR construct was significantly lower than that with
#> the vector control or the mutant Dicer 3' UTR construct (Figure 3F).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1586, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1586, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1586, 25] got `{Mutation of the
#> miR-17/20 binding site abrogated repression of luciferase activity ( Fig. 4
#> E )}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1587, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1587, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1587, 25] got `{Mutation of the
#> miR-17/20 binding site abrogated repression of luciferase activity ( Fig. 4
#> E )}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1591, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1591, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1591, 25] got `{Mutation of six
#> nucleotides in the miR-126 "seed"region (miR-126 m) or its complementary
#> sequence in the Spred-1 3' UTR (Spred-1 m UTR) relieved the repressive
#> effect of miR-126 (Figure 6E)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1593, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1593, 23] got `{Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1593, 25] got `{Direct evidence that the
#> mutant MREs in the transgene were indeed mir-338 resistant was obtained by
#> transfection of synthetic miR-338 that silenced the MRE-wild-type transgene
#> (lane 3) but not the MRE-mutant (lane 6).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1594, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1594, 23] got `{Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1594, 25] got `{Direct evidence that the
#> mutant MREs in the transgene were indeed mir-338 resistant was obtained by
#> transfection of synthetic miR-338 that silenced the MRE-wild-type transgene
#> (lane 3) but not the MRE-mutant (lane 6).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1595, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1595, 23] got `{Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1595, 25] got `{Direct evidence that the
#> mutant MREs in the transgene were indeed mir-338 resistant was obtained by
#> transfection of synthetic miR-338 that silenced the MRE-wild-type transgene
#> (lane 3) but not the MRE-mutant (lane 6).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1596, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1596, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1596, 25] got `{Therefore we tested
#> mir-520c, we observed that mir-520c over-expression significantly decreased
#> luciferase activity when the putative mir-106a target site was included in
#> the reporter compared to either a reporter lacking the putative target site
#> or a reporter carrying a seed-region mutant ofthe putative mir-106a target
#> site (Figure 1B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1597, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1597, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1597, 25] got `{(Figure 1B)We observed a
#> signifi-cant ~50 229954616ecrease (p < 0.0001) in luciferase activity when
#> the putative mir-106a target site was included in the reporter compared to
#> either a reporter lacking the putative target site or reporter carrying a
#> seed-region mutant of the putative mir-106a target site}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1598, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1598, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1598, 25] got `{The reporter experiments
#> showed that pmiR150-GFP effectively repressed zebrafish MYB WT and mt1
#> reporters (to 48.2 0x0p+0nd 45.5respectively) and did not significantly
#> repress the zebrafish MYB mt2 and mt1mt2 plasmids, suggesting that target
#> site 2, not target site 1, of 3# UTR of zebrafish c-Myb transcripts is the
#> miR-150 target site (fig. 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1599, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1599, 23] got `{GFP activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1599, 25] got `{As shown in figure
#> 1B, miR-150 repressed neither the empty reporter vector nor theMYBmt1mt2
#> reporter but effectively repressed MYB WT reporter (to 54.6) and repressed
#> the positive reporter control p150AS most effectively (to13.8). Besides,
#> miR-150 repressed both MYB mt1 (to75.8) and mt2 (to 64.7) reporters, albeit
#> to a lesser degree than MYB mt1mt2, suggesting that both sites are the
#> targets for miR-150.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1600, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1600, 23] got `{GFP activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1600, 25] got `{As shown in figure
#> 1B, miR-150 repressed neither the empty reporter vector nor theMYBmt1mt2
#> reporter but effectively repressed MYB WT reporter (to 54.6) and repressed
#> the positive reporter control p150AS most effectively (to13.8). Besides,
#> miR-150 repressed both MYB mt1 (to75.8) and mt2 (to 64.7) reporters, albeit
#> to a lesser degree than MYB mt1mt2, suggesting that both sites are the
#> targets for miR-150.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1601, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1601, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1601, 25] got `{As shown in Figure 3C,
#> miR-126 significantly reduced the luciferase activity of the wild-type p85b
#> when compared to the mutant p85Œ≤ and this reduction in luciferase activity
#> was dependent on the concentration of miR-126.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1606, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1606, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1606, 25] got `{The transfection
#> results in 293T cells showed that the luciferase activity from PTPRO 3'UTR
#> WT reporter was approximately 501555152070f the empty vector, while the
#> luciferase activity from PTPRO 3'UTR Mut reporter was rescued (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1607, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1607, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1607, 25] got `{no changes in reporter
#> activity were observed after transfection of a miR-30a-based non-silencing
#> control (‚ÄòNSC30‚Äô, Fig. 3B), in which the seed sequence (nt 2‚Äì7, see
#> Fig. 4D for details) was mutated in order to disrupt complementarity with
#> BDNF 3'-UTR target sites.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1608, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1608, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1608, 25] got `{In contrast, pGL3
#> carrying the mutant 3¬∂ UTR of HIF-1a with 4-bp deletions in the core of
#> seed sequences of each target site for miR-17-5p and miR-20a did not show
#> obvious decreases in luciferase activities when transfected into clones #31
#> and #57 (Fig. 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1611, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1611, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1611, 25] got `{the 3‚Ä≤ UTR of Itgb1
#> (Itgb1-WT) was inserted after a luciferase reporter gene. miR-124 repressed
#> reporter activity approximately three-fold (Fig. 8B). The ability of
#> miR-124 to inhibit the luciferase activity was attenuated by mutations in
#> either or both predicted miR-124 binding sites on Itgb1 3‚Ä≤ UTR (Fig. 8B),
#> indicating that these sites mediate miR-124 inhibition.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1613, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1613, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1613, 25] got `{Mutation of site 1 alone
#> (mutS1, position 1648‚Äì1654) resulted in luciferase activity that was
#> 501555152070f control compared to 34 0.000000or the wild type sites [22]
#> (Fig. 2c).Mutation of site 2 (mutS2, position 7788‚Äì7794) alone increased
#> activity to 733636360f control, and mutation of both sites (mutS1, S2)
#> restored luciferase activity to 933740200f control}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1614, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1614, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1614, 25] got `{Mutation of site 1 alone
#> (mutS1, position 1648‚Äì1654) resulted in luciferase activity that was
#> 501555152070f control compared to 34 0.000000or the wild type sites [22]
#> (Fig. 2c).Mutation of site 2 (mutS2, position 7788‚Äì7794) alone increased
#> activity to 733635440f control, and mutation of both sites (mutS1, S2)
#> restored luciferase activity to 933740200f control}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1617, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1617, 25] got `{p-miR-20a/p-zbtb7a
#> 3'UTR interaction reduced the fluorescence, while p-miR-20a/p-zbtb7a 3'UTRm
#> interaction rescues the inhibition (Figure 1g) indicating that miR-20a
#> binds directly zbtb7a 3'UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1621, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1621, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1621, 25] got `{MiR-9 and let-7a
#> decreased normalized Renilla luciferase activities to 39.2% ,and 41.7% of
#> negative controls, respectively,whereas cotransfection with miR-155 showed
#> no significant difference (Figure 3A)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1622, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1622, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1622, 25] got `{Mutations in the
#> predicted target sites for each of these miRNAs relieve repression of
#> luciferase activities (Figure 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1623, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1623, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1623, 25] got `{Mutations in the
#> predicted target sites for each of these miRNAs relieve repression of
#> luciferase activities (Figure 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1624, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1624, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1624, 25] got `{Mutations in the
#> predicted target sites for each of these miRNAs relieve repression of
#> luciferase activities (Figure 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1625, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1625, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1625, 25] got `{miR132 transfection
#> markedly suppressed luciferase activity of the p250GAP MRE luciferase
#> construct. In contrast,coexpression of miR132 with the reverse complement
#> control had no effect on luciferase activity (Fig. 3A).We next generated a
#> p250GAP mutant (mt-p250GAP) that contained a two-nucleotide deletion in the
#> miR132MRE seed sequence to test whether this site was required for miR132-
#> mediated repression. Expression of miR132 attenuated expression of WT-
#> p250GAP but had no effect on mt-p250GAP (Fig. 3B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1627, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1627, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1627, 25] got `{Co-transfection of
#> U251 cells with a WT CDK6-3'UTR (CDK6-WT) reporter and the miR-137 mimic
#> resulted in a significant decrease in luminescence (P < 0.0001) relative
#> to cells co-transfected with CDK6-WT and a negative control miRNA mimic
#> (Figure 6D). Mutation of the CDK6 miR-137 seed region rendered the reporter
#> construct insensitive to inhibition by miR-137 (Figure 6D)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1628, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1628, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1628, 25] got `{Importantly, the FL
#> ABCG2 3'UTR construct with a deletion of the putative hsa-miR-519c binding
#> site (3820- 3841) restored the luciferase activity to about 401555152070f
#> the pGL3-control level.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1637, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1637, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1637, 25] got `{Luciferase activity
#> assays indicated that mutation of the essential target site abolished the
#> effect of miR-328, while mutation of the non-essential site produced little
#> effect of miR-328‚Äôs repression activity (Fig 4D). These}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1641, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1641, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1641, 25] got `{Interestingly, the
#> relative luciferase activity of the reporter that contained wild-type 3'-
#> UTR was significantly suppressed when pc3-miR-101 was cotransfected(Fig.
#> 3B). In contrast, the luciferase activity of mutant reporter was unaffected
#> by simultaneous transfection of pc3-miR-101 (Fig. 3B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1642, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1642, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1642, 25] got `{Consequently, pmiR-221
#> and pmiR-222, but not pDNR-CMV or pmiR-145, inhibited luciferase activity
#> (Figure 5B). In the mutated control groups,the inhibitory effect of
#> pmiR-221 and miR-222 disappeared(Figure 5B). The results suggested that
#> miR-221 and miR-222 were able to bind to p27(Kip1) and p57(Kip2) directly
#> and inhibit their expression}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1643, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1643, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1643, 25] got `{Consequently, pmiR-221
#> and pmiR-222, but not pDNR-CMV or pmiR-145, inhibited luciferase activity
#> (Figure 5B). In the mutated control groups,the inhibitory effect of
#> pmiR-221 and miR-222 disappeared(Figure 5B). The results suggested that
#> miR-221 and miR-222 were able to bind to p27(Kip1) and p57(Kip2) directly
#> and inhibit their expression}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1647, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1647, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1647, 25] got `{Cotransfection of the
#> intact SOCS1 3' UTR with miR155 resulted in an appreciable repression of
#> the reporter activity, whereas mutation of the miR155 seed-binding sequence
#> abolished this repression (Figure 6E)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1648, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1648, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1648, 25] got `{Mutant luciferase
#> reporter was unaffected by either overexpression or knockdown of miR-143
#> (Figure 3f).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1649, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1649, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1649, 25] got `{Mutant luciferase
#> reporter was unaffected by either overexpression or knockdown of miR-143
#> (Figure 3f).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1652, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1652, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1652, 25] got `{precursor molecules for
#> miR106b were cotransfected with reporter constructs containing the ITCH
#> 3‚Äô UTR with the miR106b predicted binding site and either the 3‚ÄôUTR in
#> the antisense orientation or a mutated construct lacking the first seven
#> bases of the binding site, into HeLa cells. Our results indicate that
#> overexpression of miR106b specifically inhibited the expression of the
#> reporter construct containing the ITCH 3‚ÄôUTR (Figure 4B) suggesting that
#> miR106b directly interacts with the 3‚ÄôUTR of the Itch mRNA.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1655, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1655, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1655, 25] got `{In these experiments,
#> miR-7 reduced the expression of a reporter construct that carried both
#> of the predicted miR-7 target sites from the Raf1 3‚Äô-UTR but not of a
#> reporter containing an analogous insert with three point mutations in each
#> seed match region (Fig. 5C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1656, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1656, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1656, 25] got `{In these experiments,
#> miR-7 reduced the expression of a reporter construct that carried both
#> of the predicted miR-7 target sites from the Raf1 3‚Äô-UTR but not of a
#> reporter containing an analogous insert with three point mutations in each
#> seed match region (Fig. 5C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1657, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1657, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1657, 25] got `{Using A549 cells, miR-7
#> reduced the expression of reporters bearing putative target sites B and
#> C, but not of the corresponding mutant reporters (Fig. 1F). In contrast,
#> putative target site A did not mediate a change in reporter expression by
#> miR-7 (Fig. 1F)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1658, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1658, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1658, 25] got `{Using A549 cells, miR-7
#> reduced the expression of reporters bearing putative target sites B and
#> C, but not of the corresponding mutant reporters (Fig. 1F). In contrast,
#> putative target site A did not mediate a change in reporter expression by
#> miR-7 (Fig. 1F)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1661, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1661, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1661, 25] got `{After introducing
#> mutation into the targeting sites of M1 or M2 (Fig. 3C, right panel),
#> luciferase activity of M1(mut)-luc or M2(mut)-luc were not suppressed by
#> mir-320 (Fig. 3D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1662, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1662, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1662, 25] got `{After introducing
#> mutation into the targeting sites of M1 or M2 (Fig. 3C, right panel),
#> luciferase activity of M1(mut)-luc or M2(mut)-luc were not suppressed by
#> mir-320 (Fig. 3D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1663, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1663, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1663, 25] got `{Transfection of LV-
#> miR196a-infected hASC with the parental luciferase construct (without the
#> HOXC8 3'UTR) or mutant did not significantly alter the expression of the
#> reporter.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1664, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1664, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1664, 25] got `{We found that luciferase
#> activity in cells transfected with luciferase containing wild-type E2f5
#> 3'UTR and siRNA449 was significantly lower than in cellstransfected with
#> the luciferase plasmid without siRNA449.Confirming that this reduction was
#> due to the presence of the miR449 target site at the 3‚Ä≤UTR, we did not
#> see a difference for the mutant construct when it was transfected with or
#> without siRNA449. Results of these experiments are presented in Fig. 5}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1665, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1665, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1665, 25] got `{Moreover, we did not
#> observe variations of the luciferase activity in cells cotransfected with
#> pGL3-mut and miR-101, in comparison to cells transfected only with pGL3-mut
#> (Fig. 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1668, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1668, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1668, 25] got `{Co-transfection of
#> pRL-S3'UTR and miR-27a into HEK293 cells resulted in a pronounced (~50)
#> reduction of luciferase activity compared with miR-negativecontrol (miR-
#> NC)-transfected cells (Fig. 2A). Mutations introduced in the 3'UTR miR-27a
#> binding sites, either the first (Mut1; also see Fig. S2) or the second
#> (Mut2), significantly reduced the inhibitory effect of miR-27a, and
#> mutation in both sites [Mut (1+2)] completely abolished it (Fig. 2A)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1671, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1671, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1671, 25] got `{(A) miR-142-3p targets
#> 3'-UTR of AC9 messenger RNA (mRNA). miR-142-3p inhibited the expression
#> of the luciferase gene containing AC9 3'-UTR but not mutated AC9 3'-UTR;
#> *<0.05, compared with AC9 3'-UTR group}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1673, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1673, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1673, 25] got `{To confirm this result,
#> we mutated the miR-205 binding site on SHIP2 3'UTR (Fig. 1B, SHIP2.mut1).
#> The mutation prevented miR-205from interfering With luciferase activity,
#> indicating that the 3'UTR of SHIP2 is indeed a target of miR-205 (Fig. 1C)}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1674, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1674, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1674, 25] got `{if the 8-mer seed
#> sequence was removed from the 3'UTR construct, luciferase levels did not
#> vary from those of the control reporter (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1675, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1675, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1675, 25] got `{As expected, miR-223 had
#> no effects on LMO2 mut-pRL-TK that carried the mutant miR-223 binding sites
#> (Fig. 7B, C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1677, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1677, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1677, 25] got `{We cloned these three
#> 3'UTRs and their relevant mutants into luciferase report vector pcDNA3.1-
#> Luc. Luciferase activity assay showed that ectopically expressed miR-21
#> decreased the luciferase activity of 30UTRs with wild-type binding sites,
#> but ectopically expressed miR-21 had no effect on 3'UTRs with mutant type
#> binding sites (Fig. 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1678, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1678, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1678, 25] got `{We cloned these three
#> 3'UTRs and their relevant mutants into luciferase report vector pcDNA3.1-
#> Luc. Luciferase activity assay showed that ectopically expressed miR-21
#> decreased the luciferase activity of 3'UTRs with wild-type binding sites,
#> but ectopically expressed miR-21 had no effect on 3'UTRs with mutant type
#> binding sites (Fig. 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1679, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1679, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1679, 25] got `{We cloned these three
#> 3'UTRs and their relevant mutants into luciferase report vector pcDNA3.1-
#> Luc. Luciferase activity assay showed that ectopically expressed miR-21
#> decreased the luciferase activity of 3'UTRs with wild-type binding sites,
#> but ectopically expressed miR-21 had no effect on 3'UTRs with mutant type
#> binding sites (Fig. 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1684, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1684, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1684, 25] got `{A 338-bp fragment
#> encompassing this region inserted 3'of a luciferase expression cassette
#> significantly reduced luciferase expression after pre-miR-128-1
#> transfection in a dose-dependent manner (Fig.2B). mutagenesis of the
#> predicted miR-128 binding site blocked this effect (Fig. 2B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1685, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1685, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1685, 25] got `{To examine whether
#> miR-101 regulates the 3'UTR of EZH2, we generated luciferase reporters
#> encoding the normal, antisense, and mutated versions of the EZH2 3'UTR.
#> Overexpression of miR-101, but not miR-217 or control miRNA, decreased
#> the activity of the luciferase reporter encoding the 3'UTR of EZH2 (fig.
#> S1). Similarly, the antisense and mutant EZH2 3'UTR activities were not
#> inhibited by miR-101}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1686, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1686, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1686, 25] got `{To examine whether
#> miR-101 regulates the 3'UTR of EZH2, we generated luciferase reporters
#> encoding the normal, antisense, and mutated versions of the EZH2 3'UTR.
#> Overexpression of miR-101, but not miR-217 or control miRNA, decreased
#> the activity of the luciferase reporter encoding the 3'UTR of EZH2 (fig.
#> S1). Similarly, the antisense and mutant EZH2 3'UTR activities were not
#> inhibited by miR-101}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1688, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1688, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1688, 25] got `{(A) Sequence of miR-138
#> and its binding site in mouse cspg2 3'UTR with complementary nucleotides
#> indicated in red. Luciferase activity in Cos cells on introduction of wild
#> type or mutated (mut) cspg2 3'UTR sequences downstream of a CMV-driven
#> luciferase (LUC) reporter with or without miR-138 is shown.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1689, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1689, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1689, 25] got `{Point mutations in
#> the miR-138 binding site, located where nucleotides 2‚Äì7 of the miRNA
#> are predicted to bind, abolished repression,indicating that miR-138 can
#> directly target this binding site in the 3'UTR of aldh1a2.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1692, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1692, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1692, 25] got `{we observed a 3 to 4.5-
#> fold increase in Rluc activity from the reporter genes carrying mutated BS
#> for both miRNAs, as compared to the wild-type (WT) sequence (Fig. 6B, left
#> and right panels).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1693, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1693, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1693, 25] got `{we observed a 3 to 4.5-
#> fold increase in Rluc activity from the reporter genes carrying mutated BS
#> for both miRNAs, as compared to the wild-type (WT) sequence (Fig. 6B, left
#> and right panels).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1694, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1694, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1694, 25] got `{In the case of the
#> miR-33 and miR-7 mutants, that do not bind to the original target, no
#> significant difference of GUS stainingwas observed when comparedwith the
#> control (Fig. 5A-4/5)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1695, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1695, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1695, 25] got `{In the case of the
#> miR-33 and miR-7 mutants, that do not bind to the original target, no
#> significant difference of GUS stainingwas observed when comparedwith the
#> control (Fig. 5A-4/5)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1697, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1697, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1697, 25] got `{This was specific to
#> miR-29 binding since luciferase was less affected when transfections were
#> repeated with an irrelevant miR or with a mutant lacking the miR-29 binding
#> site in the YY1 3'UT}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1698, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1698, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1698, 25] got `{This was specific to
#> miR-29 binding since luciferase was less affected when transfections were
#> repeated with an irrelevant miR or with a mutant lacking the miR-29 binding
#> site in the YY1 3'UT}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1699, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1699, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1699, 25] got `{This was specific to
#> miR-29 binding since luciferase was less affected when transfections were
#> repeated with an irrelevant miR or with a mutant lacking the miR-29 binding
#> site in the YY1 3'UT}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1703, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1703, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1703, 25] got `{no reduction was
#> observed with the Mut cyclin E 3'UTR,confirming that miR-15a directly
#> inhibits cyclin E1 translation via binding to its 3'-UTR at the predicted
#> sites.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1704, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1704, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1704, 25] got `{In addition, a
#> luciferase reporter containing the 3' UTR of the CDC42 mRNA was suppressed
#> by ~40when the cells were transfected with miR-29 miRNAs (Fig. 4e, black),
#> but a reporter with mutated target sites was not repressed by miR-29 (Fig.
#> 4e, white)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1705, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1705, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1705, 25] got `{In addition, a
#> luciferase reporter containing the 3' UTR of the CDC42 mRNA was suppressed
#> by ~40when the cells were transfected with miR-29 miRNAs (Fig. 4e, black),
#> but a reporter with mutated target sites was not repressed by miR-29 (Fig.
#> 4e, white)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1706, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1706, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1706, 25] got `{A reporter with
#> mutations in the predicted miR-29 target site (Fig. 4b, white) was not
#> suppressed by miR-29 miRNAs.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1707, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1707, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1707, 25] got `{but a reporter with
#> mutated target sites was not repressed by miR-29 (Fig. 4e, white). This
#> suggests that these two sites mediate miR-29‚Äôs regulation of CDC42}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1708, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1708, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1708, 25] got `{but a reporter with
#> mutated target sites was not repressed by miR-29 (Fig. 4e, white). This
#> suggests that these two sites mediate miR-29‚Äôs regulation of CDC42}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1709, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1709, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1709, 25] got `{A reporter with
#> mutations in the predicted miR-29 target site (Fig. 4b, white) was not
#> suppressed by miR-29 miRNAs.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1711, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1711, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1711, 25] got `{Moreover, miR-1-
#> dependent repression of luciferase activity was abrogated upon the deletion
#> of both miR-1 cognate sites, whereas deletion of each site individually
#> inhibited luciferase activity by 50}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1712, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1712, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1712, 25] got `{Moreover, miR-1-
#> dependent repression of luciferase activity was abrogated upon the deletion
#> of both miR-1 cognate sites, whereas deletion of each site individually
#> inhibited luciferase activity by 50}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1716, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1716, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1716, 25] got `{Luciferase activity
#> in respective cells was then measured. Compared with the decrease
#> in luciferase activity observed when the authentic c-myb 3'UTR was
#> cotransfected with miR-15a, deletion of the miR-15a binding sites in the
#> c-myb 3'UTR resulted in a 2- to 3-fold increase in luciferase activity,
#> indicating that miR15a was no longer able to bind the UTR with the same
#> avidity (Figure 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1717, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1717, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1717, 25] got `{Luciferase activity
#> in respective cells was then measured. Compared with the decrease
#> in luciferase activity observed when the authentic c-myb 3'UTR was
#> cotransfected with miR-15a, deletion of the miR-15a binding sites in the
#> c-myb 3'UTR resulted in a 2- to 3-fold increase in luciferase activity,
#> indicating that miR15a was no longer able to bind the UTR with the same
#> avidity (Figure 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1718, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1718, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1718, 25] got `{As shown in Fig. 3C,
#> miR-130a directly interacts with the two binding sites, over achieving the
#> most significant repression of luciferase expression when both the site
#> interactions are allowed, while site-specific mutants, in which the seed
#> sequence has been disrupted, prevented the interaction}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1719, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1719, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1719, 25] got `{To test whether miR-8
#> directly targets the 3'UTR of wls, we generated a sensor for wls by cloning
#> the wls 3'UTRdownstream of the coding region for lacZ. The wls 3'UTRsensor
#> was suppressed by miR-8 in Kc167 cells, and mutation of the seed region
#> (base pairs2‚Äì8) of the putativemiR-8‚Äìbinding site partially blocked the
#> ability of miR-8 to inhibit the wls sensor (Fig. 3A)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1720, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1720, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1720, 25] got `{Expression of miR-8
#> inhibited the CG32767 sensor 3-fold in Kc167 cells (Fig. 5B). This
#> inhibition was blocked by mutation of the base pairs of both sites
#> predicted to bind the seed region of miR-8 (Fig. 5B). Mutation of either
#> site alone gave only a partial rescue, suggesting that both sites are
#> functionally important(data not shown).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1721, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1721, 23] got `{activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1721, 25] got `{Expression of miR-8
#> inhibited the CG32767 sensor 3-fold in Kc167 cells (Fig. 5B). This
#> inhibition was blocked by mutation of the base pairs of both sites
#> predicted to bind the seed region of miR-8 (Fig. 5B). Mutation of either
#> site alone gave only a partial rescue, suggesting that both sites are
#> functionally important(data not shown).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1734, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1734, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1734, 25] got `{while luciferase
#> activity with mutated IRS-1 3'-UTR reporter was not inhibited (Fig. 3B and
#> C)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1742, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1742, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1742, 25] got `{Furthermore, the
#> luciferase reporter conjugated with mutant Foxg1 3'UTR (luc-Mm-Foxg1MT),
#> in which the target sequence was transversely mutated, was not effectively
#> suppressed by miR-9-1WT, miR-9-2WT, or miR-9-3WT(Fig. 2A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1743, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1743, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1743, 25] got `{Luciferase expression
#> from luciferase reporters conjugated with chick or Xenopus tropicalis Foxg1
#> 3'UTR (luc-Gg-Foxg1WT and luc-Xt-Foxg1WT,respectively) were effectively
#> suppressed by mouse miR-9-2WT,and not by miR-9-2MT (Fig. 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1744, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1744, 25] got `{miR-451‚Äìmediated
#> repression on the gata2-3'UTR was abolished when both seed sequences were
#> mutated (GFP-3'UTRgata2-mut), shown by comparable GFP-fluorescence of this
#> reporter construct alone and in the presence of miR-451 (Figure 4C,D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1745, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1745, 25] got `{miR-451‚Äìmediated
#> repression on the gata2-3'UTR was abolished when both seed sequences were
#> mutated (GFP-3'UTRgata2-mut), shown by comparable GFP-fluorescence of this
#> reporter construct alone and in the presence of miR-451 (Figure 4C,D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1754, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1754, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1754, 25] got `{The WT Cyclin D2
#> reporter showed an approximately three fold inhibition of Renilla
#> luciferase activity relative to a mutant reporter (mutant; Mut) with
#> mismatched sequences inserted into the ‚Äúseed‚Äù sequences of the
#> predicted miR-302b-binding site (Fig.4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1761, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1761, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1761, 25] got `{We found that when
#> the cells were transfected with a reporter construct harboring wild-type
#> CDKN1A, luciferase activity was significantly repressed, compared with
#> cells transfected with a construct harboring a CDKN1A mutant (Figure 3D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1764, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1764, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1764, 25] got `{Luciferase activity was
#> significantly lower in cells cotransfected with luc-Cxcl12-wt and siR-140
#> than in cells cotransfected with luc-Cxcl12-wt and siR-96, luc-Cxcl12-mut
#> and siR-140 or luc-Cxcl12 without siRNA (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1765, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1765, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1765, 25] got `{As shown in Figure 7B,
#> in PCK-CCL cotransfected with miR15a precursor and Cdc25A WT construct,
#> luciferase reporter translation wasdecreased by 75.18ompared with that
#> in PCK-CCL transfected with Cdc25A WT construct only. However, in PCK-cCL
#> cotransfected with miR15a precursor and Cdc25A mutant construct, expression
#> of luciferase reporter was not inhibited.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1766, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1766, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1766, 25] got `{As expected, the
#> mutations of the complementary bases abolished the interaction between
#> MIRN155 and Ets-1 3'-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1767, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1767, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1767, 25] got `{As expected, the
#> mutations of the complementary bases abolished the interaction between
#> MIRN155 and Ets-1 3'-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1768, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1768, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1768, 25] got `{Reporter construct
#> with MIRN155 binding site deleted (‚ñ≥/155) was produced as additional
#> control. As expected, ‚ñ≥/155 construct was resistant to MIRN155-mediated
#> repression(Fig 5B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1772, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1772, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1772, 25] got `{no difference in
#> luciferase activity was found in cells transfected with the 3'UTR mutant
#> compared with the empty vector control (Fig. 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1773, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1773, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1773, 25] got `{Accordingly, pmiR-21,
#> but not pDNR-CMV or pmiR-145 inhibited luciferase activity (Fig. 6B). In
#> the mutated control group, the inhibitory effect of pmiR-21 and pmiR-222
#> disappeared (Fig. 6B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1813, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1813, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1813, 25] got `{Mef2a has two conserved
#> miR-1 recognition sequences in its 3' UTR (Fig. 7a). These sequences
#> conferred miR-1 responsiveness to a luciferase reporter (Fig. 7b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1814, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1814, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1814, 25] got `{Mef2a has two conserved
#> miR-1 recognition sequences in its 3' UTR (Fig. 7a). These sequences
#> conferred miR-1 responsiveness to a luciferase reporter (Fig. 7b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1815, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1815, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1815, 25] got `{Both contain highly
#> conserved miR-1 seed match sequences in their 3'UTRs (Fig. 5a). When
#> cloned downstream of luciferase, these sequences mediated downregulation of
#> luciferase activity by miR-1 (Fig. 5b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1816, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1816, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1816, 25] got `{Both contain highly
#> conserved miR-1 seed match sequences in their 3'UTRs (Fig. 5a). When
#> cloned downstream of luciferase, these sequences mediated downregulation of
#> luciferase activity by miR-1 (Fig. 5b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1820, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1820, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1820, 25] got `{We further showed that
#> the miR-145 binding site in c-Myc 3'UTR was required for this regulation;
#> deletion of the binding site (Luc-c-Myc-UTR-d) abolished its suppression
#> (Fig. 4F).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1821, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1821, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1821, 25] got `{As shown in Figure 2B,
#> the deletion of miR-29b interaction sites abrogated the miR-29b/DNMT3A
#> and miR-29b/DNMT3B interaction evidenced by no change in the normalized
#> luciferase activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1822, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1822, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1822, 25] got `{Concurrent mutations
#> of sites 1 and 2 (i.e., 3370, 3763) or sites 1, 2 and 3 (i.e., 3370, 3763,
#> 3818) predicted miR-29b binding sites abrogated the miR-29b/Sp1 interaction
#> evidenced by no change in the normalized luciferase activity, Mutations
#> of only site 1 (i.e., 3370) did not suffice in preventing this interaction
#> (Figure 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1823, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1823, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1823, 25] got `{As shown in Figure 2B,
#> the deletion of miR-29b interaction sites abrogated the miR-29b/DNMT3A
#> and miR-29b/DNMT3B interaction evidenced by no change in the normalized
#> luciferase activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1824, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1824, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1824, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1825, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1825, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1825, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1826, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1826, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1826, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1827, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1827, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1827, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1828, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1828, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1828, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3'UTR of KLF13 and
#> MBNL2, but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1829, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1829, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1829, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1830, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1830, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1830, 25] got `{The results of these
#> reporter assays showed that miR-302d and miR-372 were indeed able to
#> suppress specifically the luciferase activities of the reporter vectors
#> harboring the predicted binding sites of wild-type 3UTR of KLF13 and MBNL2,
#> but not mutant-types (Fig. 1D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1831, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1831, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1831, 25] got `{Mutating the binding
#> site had abolished the ability of miR-126 to inhibit the expression of the
#> luciferase reporter}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1832, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1832, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1832, 25] got `{As shown in Fig. 5C,
#> deletion of the first binding site impaired the suppression of luciferase
#> activity, but we still detected about 30hԴ uppression; deletion of the
#> second binding site had a similar effect. When both sites were deleted,
#> however, miR-30e‚Äìmediated suppression of luciferase activity was
#> abolished.These results suggest that both binding sites are critical for
#> microRNA regulation}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1833, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1833, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1833, 25] got `{As shown in Fig. 5C,
#> deletion of the first binding site impaired the suppression of luciferase
#> activity, but we still detected about 30hԴ uppression; deletion of the
#> second binding site had a similar effect. When both sites were deleted,
#> however, miR-30e‚Äìmediated suppression of luciferase activity was
#> abolished.These results suggest that both binding sites are critical for
#> microRNA regulation}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1834, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1834, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1834, 25] got `{As shown in Fig. 5C,
#> deletion of the first binding site impaired the suppression of luciferase
#> activity, but we still detected about 30hԴ uppression; deletion of the
#> second binding site had a similar effect. When both sites were deleted,
#> however, miR-30e‚Äìmediated suppression of luciferase activity was
#> abolished.These results suggest that both binding sites are critical for
#> microRNA regulation}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1835, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1835, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1835, 25] got `{As shown in Fig. 5C,
#> deletion of the first binding site impaired the suppression of luciferase
#> activity, but we still detected about 30hԴ uppression; deletion of the
#> second binding site had a similar effect. When both sites were deleted,
#> however, miR-30e‚Äìmediated suppression of luciferase activity was
#> abolished.These results suggest that both binding sites are critical for
#> microRNA regulation}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1836, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1836, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1836, 25] got `{ As expected, this
#> suppressive effect could be abolished by partially deleting the perfectly
#> complementary sequences in the 3'-UTR of Bcl-2 mRNA (pGL3-mut Bcl-2-3'-
#> UTR), which disrupted the interaction between miR-15b/miR-16 and Bcl-2(Fig.
#> 7).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1837, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1837, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1837, 25] got `{ As expected, this
#> suppressive effect could be abolished by partially deleting the perfectly
#> complementary sequences in the 3'-UTR of Bcl-2 mRNA (pGL3-mut Bcl-2-3'-
#> UTR), which disrupted the interaction between miR-15b/miR-16 and Bcl-2(Fig.
#> 7).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1838, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1838, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1838, 25] got `{As shown in Figure
#> 5F, we similarly demonstrated that miR-205 directly targets VEGF-A by
#> interacting with the putative miR-205 binding site in its 3‚Ä≤-UTR}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1839, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1839, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1839, 25] got `{miR-205-mediated
#> suppression of the luciferase activity was completely abolished in Luc-
#> ErbB3-3‚Ä≤-UTR-d (Figure5C), suggesting that the miR-205 binding site is
#> critical for miR-205-mediated suppression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1856, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1856, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1856, 25] got `{The dual luciferase
#> assay demonstrated that miR-1, miR-206 could significantly reduce the
#> luciferase activities mediated by pGL3-Mmbs2 (p < 0.05), and miR-1,
#> miR-206 could reduce luciferase activities mediated by pGL3-mbs12 a little
#> more efficiently than those mediated by pGL3-Mmbs2 without significant
#> differences (p > 0.05) (Fig. 3).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1857, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1857, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1857, 25] got `{The dual luciferase
#> assay demonstrated that miR-1, miR-206 could significantly reduce the
#> luciferase activities mediated by pGL3-Mmbs2 (p < 0.05), and miR-1,
#> miR-206 could reduce luciferase activities mediated by pGL3-mbs12 a little
#> more efficiently than those mediated by pGL3-Mmbs2 without significant
#> differences (p > 0.05) (Fig. 3).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1858, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1858, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1858, 25] got `{co-transfection of
#> miR-29a led to a strong reduction of the luciferase signal (Fig 2C, WT).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1859, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1859, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1859, 25] got `{For HMGA1, two mutants
#> were constructed for HMGA1 RE1 and RE2, denoted as m1 and m2 respectively.
#> Only the mutation of the RE1 (m1) completely corrected the inhibition of
#> the luciferase activity (Fig. 2 A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1860, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1860, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1860, 25] got `{For caprin-1, the
#> mutation of the sole RE completely abolished the inhibition of luciferase
#> activity (Fig. 2 B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1861, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1861, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1861, 25] got `{We could restore the
#> luciferase activity only by concomitantly mutating the two miR-16 binding
#> sites (m3 mutant), while independent mutation of each of them was quasi
#> Inefficient (Fig. 2 C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1862, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1862, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1862, 25] got `{We could restore the
#> luciferase activity only by concomitantly mutating the two miR-16 binding
#> sites (m3 mutant), while independent mutation of each of them was quasi
#> Inefficient (Fig. 2 C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1863, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1863, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1863, 25] got `{miR-199a* significantly
#> inhibited activity of the wildtype reporter gene pGL3Smad1, whereas
#> mutation of either seed site largely abolished miR-199a*-mediated
#> repression of reporter gene activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1864, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1864, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1864, 25] got `{miR-199a* significantly
#> inhibited activity of the wildtype reporter gene pGL3Smad1, whereas
#> mutation of either seed site largely abolished miR-199a*-mediated
#> repression of reporter gene activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1865, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1865, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1865, 25] got `{In contrast, exogenous
#> miR-34b expression did not reduce LUC activity with the mutated CREB 3'-
#> UTR, further suggesting that CREB expression is typically regulated by
#> miR-34b (Fig. 2A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1866, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1866, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1866, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1867, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1867, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1867, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1868, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1868, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1868, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1869, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1869, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1869, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1870, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1870, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1870, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1871, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1871, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1871, 25] got `{ Further
#> characterization of the Lmnb1 3‚Ä≤UTR revealed that there are three
#> separate miR-23 binding sites within this region (see supplementary
#> material Fig. S1 and Table S1). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1877, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1877, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1877, 25] got `{Importantly,mutation of
#> the four candidate miR-150 binding sites abrogated miR-150 repression,}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1878, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1878, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1878, 25] got `{Inclusion of this
#> sequence within the 3'UTR of a luciferase gene rendered it a target
#> of miR-199a, as demonstrated by the inhibition of its activity on
#> overexpression of miR-199a (Figure 2b)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1879, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1879, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1879, 25] got `{Inclusion of this target
#> sequence within the 3'UTR of a luciferase gene rendered it a target of
#> miR-199a, as demonstrated demonstrated by the inhibition of its activity on
#> overexpression of miR-199a, relative to a mutant sequence (Figure 5b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1880, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1880, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1880, 25] got `{Luciferase activity
#> in U373 cells co-transfected with pre-miR-146b and pGL3-MMP16 vector was
#> decreased when compared with controls (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1881, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1881, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1881, 25] got `{Luciferase activity
#> in U373 cells co-transfected with pre-miR-146b and pGL3-MMP16 vector was
#> decreased when compared with controls (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1882, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1882, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1882, 25] got `{disruption of miR-328
#> MRE within ABCG2 3‚Äô-UTR,particularly the segment complementary to 8-bp
#> seed sequence (Fig. 1A), resulted in a 300 229954616ncrease in luciferase
#> activity in MCF-7 cells (Fig. 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1884, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1884, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1884, 25] got `{However, the activity of
#> the reporter construct deleted at the seed sequences of microRNA-21 target
#> site was unaffected by a simultaneous transfection with anti‚ÄìmicroRNA-21
#> (Fig. 5F)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1885, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1885, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1885, 25] got `{Moreover, the mutation
#> of the miR-205 binding site in HER3-3'UTR prevented the down-regulation of
#> luciferase expression,}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1886, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1886, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1886, 25] got `{Importantly, mutation
#> of six bases (Figure3A, top panel) in the candidate miR-223 binding site
#> totally abrogated miR-223-dependent repression}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1887, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1887, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1887, 25] got `{An inhibitory effect
#> was not suggested with mutant 1, whereas minimal luciferase inhibition by
#> approximately 18was indicated with mutant 2 (P =.19) (Figure 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1888, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1888, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1888, 25] got `{However, luciferase
#> activity was significantly up-regulated after 3T3 cells were transfected
#> with the Reck-pGL3-Mutant plasmid containing the mutated binding site and
#> the miR-21 precursor (Fig. 7E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1889, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1889, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1889, 25] got `{Activity of the
#> FL‚ÄìMut2/3, MutS2 or MutS3 reporter vector was not affected, (Fig. 3d),
#> indicating that miR-146a interferes with CXCR4 mRNA translation through a
#> direct interaction with S2 and S3 sites in the 3¬¥UTR‚ÄìFL.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1890, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1890, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1890, 25] got `{Activity of the
#> FL‚ÄìMut2/3, MutS2 or MutS3 reporter vector was not affected, (Fig. 3d),
#> indicating that miR-146a interferes with CXCR4 mRNA translation through a
#> direct interaction with S2 and S3 sites in the 3¬¥UTR‚ÄìFL.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1891, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1891, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1891, 25] got `{Cotransfection
#> experiments revealed that the DM is completely refractory to
#> miR-135a&b‚Äìmediated repression, indicating the direct suppression of APC
#> by miR-135a&b (Fig. 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1892, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1892, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1892, 25] got `{Cotransfection
#> experiments revealed that the DM is completely refractory to
#> miR-135a&b‚Äìmediated repression, indicating the direct suppression of APC
#> by miR-135a&b (Fig. 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1895, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1895, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1895, 25] got `{Introducing a mutation
#> (exchange of two nucleotides) into the hsa-let-7a target site led to an
#> increase of luciferase expression of 70(¬±5) in HMB2-MIA5 cells compared
#> with the wild-type 3'-UTR construct}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1896, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1896, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1896, 25] got `{Importantly, the mutant
#> miR-26a responsive element was able to mitigate repression (Figure 5F),}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1899, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1899, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1899, 25] got `{A reporter construct
#> with mutated miR-26a target site, m(236-257), also lost the inhibition to
#> the reporter construct (Fig. 3D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1901, 23] got `N/A`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1902, 15] got `{no}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1912, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1912, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1912, 25] got `{Introduction of excess
#> wild-type human miR-33a/b precursor oligonucleotides resulted in further
#> repression of the wild-type ABCA1 3‚Ä≤UTR reporter (Fig. 2E). By contrast,
#> miR-33a/b precursors mutated in the seed base-pairing sequence had no
#> effect, as compared with precursor control (PC) (Fig. 2E and fig. S5C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1913, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1913, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1913, 25] got `{Introduction of excess
#> wild-type human miR-33a/b precursor oligonucleotides resulted in further
#> repression of the wild-type ABCA1 3‚Ä≤UTR reporter (Fig. 2E). By contrast,
#> miR-33a/b precursors mutated in the seed base-pairing sequence had no
#> effect, as compared with precursor control (PC) (Fig. 2E and fig. S5C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1916, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1916, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1916, 25] got `{"Our results clearly
#> demonstrated a significant decrease of luciferase activity compared to
#> either mutant or empty vector controlsupon transient over-expression of
#> miR-215 (Figure 1C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1917, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1917, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1917, 25] got `{"Our results clearly
#> demonstrated a significant decrease of luciferase activity compared to
#> either mutant or empty vector controls upon transient over-expression of
#> miR-215 (Figure 1C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1918, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1918, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1918, 25] got `{"Our results clearly
#> demonstrated a significant decrease of luciferase activity compared to
#> either mutant or empty vector controls upon transient over-expression of
#> miR-215 (Figure 1C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1920, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1920, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1920, 25] got `{Luciferase activity
#> with p53 3' UTR mutant constructs decreased less than with the wild-
#> type construct, especially in mutants of the first target site (Fig. 2C).
#> Furthermore, the inhibitory effect of miR-1285 on luciferase activity was
#> abrogated when a p53 3' UTR containing the two mutant binding sites was
#> used (Fig. 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1921, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1921, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1921, 25] got `{Luciferase activity
#> with p53 3' UTR mutant constructs decreased less than with the wild-
#> type construct, especially in mutants of the first target site (Fig. 2C).
#> Furthermore, the inhibitory effect of miR-1285 on luciferase activity was
#> abrogated when a p53 3' UTR containing the two mutant binding sites was
#> used (Fig. 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1922, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1922, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1922, 25] got `{Cotransfection
#> of a pMir-Reporter containing the AKT2 binding site for miR-184 and
#> mature miR-184 mimics significantly (p < 0.003) diminished luciferase
#> activity while co-transfection of the reporter with a negative control
#> oligonucleotide had no effect (Figure 4d). A three base pair mutation
#> introduced into the seed region of the miR-184 binding site in the AKT2
#> 3' UTR completely abolished the ability of mature miR-184 mimics to affect
#> luciferase activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1923, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1923, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1923, 25] got `{Luciferase activity
#> was markedly diminished in cells transfected with miR-650 precursor and
#> wildtype 3'UTR reporter plasmid transfected cells, compared to luciferase
#> activity in cells transfected with miR-650 precursor and mutant 3'UTR
#> reporter plasmids (Fig. 3C, p < 0.05).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1951, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1951, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1951, 25] got `{Suppression of
#> luciferase activity by miR-148a was seen with the MSK1 3 -UTR MT2 reporter
#> gene, which was almost similar to that with the WT reporter gene (Fig. 5C).
#> However, miR-148 showed little or no effects on luciferase activity with
#> the MT1 and MT3 reporter genes.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1952, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1952, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1952, 25] got `{Suppression of
#> luciferase activity by miR-148a was seen with the MSK1 3 -UTR MT2 reporter
#> gene, which was almost similar to that with the WT reporter gene (Fig. 5C).
#> However, miR-148 showed little or no effects on luciferase activity with
#> the MT1 and MT3 reporter genes.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1953, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1953, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [1953, 25] got `{Suppression of
#> luciferase activity by miR-148a was seen with the MSK1 3 -UTR MT2 reporter
#> gene, which was almost similar to that with the WT reporter gene (Fig. 5C).
#> However, miR-148 showed little or no effects on luciferase activity with
#> the MT1 and MT3 reporter genes.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1954, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1954, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1954, 25] got `{miR-17/20 repressed IL-8
#> luciferase reporter gene activity, and mutation of themiR-17/20 binding
#> site of the IL-8 3‚Ä≤ UTR reduced the repression (Fig. 5 B and C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1955, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1955, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1955, 25] got `{miR-17/20 repressed IL-8
#> luciferase reporter gene activity, and mutation of themiR-17/20 binding
#> site of the IL-8 3‚Ä≤ UTR reduced the repression (Fig. 5 B and C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1956, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1956, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1956, 25] got `{Our data show that in
#> resting RAW264.7 cells, miR-466l downregulated the wildtype IL-10 39UTR
#> luciferase activity, but had no effect on that of mutant IL-10 3'UTR
#> reporter gene. Down regulation of luciferase activity is unchanged if the
#> first, second, or fourth potential miR-466l binding sites are mutated,
#> whereas downregulation of luciferase activity is abolished if the third
#> binding site is mutated (Fig. 3B). In LPS-stimulated RAW264.7 cells,
#> miR-466l upregulated the wildtypeIL-10 3'UTR luciferase activity, but had
#> no effect on that of mutant IL-10 3'UTR reporter gene. The first and fourth
#> mutation of potential miR-466l binding sites did not block the upregulation
#> of luciferase activity, whereas the second and third mutation abolished the
#> upregulation of luciferase activity caused by miR-466l (Fig. 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1960, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1960, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1960, 25] got `{"We also cotransfected
#> these cells with an miR-15a mimic or mimic control and measured luciferase
#> activity. As shown in Figure 6C,the miR-15a mimic at a concentration of
#> 50 nM decreases luciferase activity of the reporter vector containing the
#> miR-15a binding sequence (Fig. 6C). In contrast, the miR-15a mimic has
#> no significant effect on a reporter vector with a mutated miR-15a binding
#> sequence."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1962, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1962, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1962, 25] got `{"The relative luciferase
#> activity of the reporter that contained wild-type 30UTR was significantly
#> suppressed whenmiR-375was cotransfected (Fig. 2A). In contrast, the
#> luciferase activity of the mutant reporter was unaffected by cotransfection
#> ofmiR-375 (Fig. 2A)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1964, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1964, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1964, 25] got `{Subsequently, we
#> generated two Luciferase report vectors that contain the putative miR-155
#> binding sites within 30UTR and mutant 30UTR (30MUT), as shown in Fig.
#> 1B, the relative luciferase activity was reduced by 50 0.000000ollowing
#> cotransfection with miR-155 mimics compared with transfection with miR-155
#> control. In contrast, no change of luciferase was observed in cells
#> transfected with 30MUT constructs or miR-155 inhibitors.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1966, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1966, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1966, 25] got `{Inhibition of miR-34c
#> with a 20 O-methyl oligonucleotide (anti-miR) relieves repression of
#> a luciferase reporter harboring the wild-type c-myc 30 'UTR (pLSVM30)
#> relative to a version with a point mutation in the miR-34c target-site
#> (pLSVM30mut) (Fig. 1A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1971, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1971, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1971, 25] got `{Both pcDNA3.0‚ÄìmiR-22
#> and miR-22 duplex reduced luciferase activities expressed in
#> pGL3m‚ÄìESR1‚Äì3¬¢-UTR‚ÄìWT by 50but such a reduction was completely
#> abolished in pGL3m‚ÄìESR1-3¬¢‚ÄìUTR‚ÄìMUT (Fig. 2B, C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1972, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1972, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1972, 25] got `{To determine whether
#> miR-9 targets CDH1 directly, we performed reporter assays and found that
#> miR-9 decreased the activity of a luciferase reporter fused to the wild-
#> type CDH1 3¬¥ UTR but not to a mutant 3¬¥ UTR (Fig. 1d);}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1973, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1973, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1973, 25] got `{An enhanced level of
#> miR-22 expression decreased the WT-vector luciferase activity (P < 0.05);
#> however, no difference was observed between MT-vectors with precursor (Fig.
#> 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1980, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1980, 23] got `{fluorescence intensity}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1980, 25] got `{Injection of the
#> WT sensor mRNA alone resulted in bright GFP fluorescence, which was
#> significantly dampened by miR-143 (P =0.002),Additionally, a single point
#> mutation in the predicted miR-143 binding site blocked the observed GFP
#> silencing by miR-143 (Fig. 6D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1981, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1981, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1981, 25] got `{Cotransfection of cells
#> with pGL3-F plus the miR-512-3p decreased the luciferase activity in a
#> dose-dependent manner.To further determine the suppression of miR-512-3p
#> on c-FLIP by binding to c-FLIP 3'UTR, the seed region of c-FLIP 3'UTR was
#> deleted and subcloned downstream of luciferase gene (designated as pGL3-
#> FM). As we expected, the luciferase activity in pGL3-FM was unchanged by
#> overexpression of miR-512-3p (Fig. 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1982, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1982, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1982, 25] got `{As shown in Fig. 2E, the
#> reporter activities of wildtype (WT) but not mutated (MUT) pMIR-FOXO3a are
#> reversely correlated with miR-155 expression levels, i.e., the activity is
#> high in miR-155 low cells (e.g., MDA-MB-468 and BT-474) and low in miR-155
#> high cells (e.g., (HS578T and MDA-MB-157). Further, expression of miR-155
#> represses WT-pMIR-FOXO3a but not MUT-pMIR-FOXO3a reporter activity in
#> BT-474 (Fig. 2F).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1986, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1986, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1986, 25] got `{Using a reporter assay,
#> we found that the reporter fused to the A24G-mutated SOCS1 3‚Ä≤UTR was not
#> repressed by miR-155 (Fig. 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1987, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1987, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1987, 25] got `{"Compared with the
#> control, transfection with pre-miR-34a reduced the luciferase activities
#> significantly (Figure 2A). However, the pre-miR scramble or pre-miR-34a
#> did not affect the luciferase activity in the mutant construct and their
#> luciferase activitiesdid not have any significant differences when compared
#> with the control."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1988, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1988, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1988, 25] got `{"Compared with the
#> control, transfection with pre-miR-34a reduced the luciferase activities
#> significantly (Figure 2A). However, the pre-miR scramble or pre-miR-34a
#> did not affect the luciferase activity in the mutant construct and their
#> luciferase activitiesdid not have any significant differences when compared
#> with the control."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1992, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1992, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [1992, 25] got `{We performed luciferase
#> assays in which the miR-17 target sequence in the Jak1 3¬¥UTR was cloned
#> in the luciferase 3¬¥UTR. Overexpression of miR-17 reduced luciferase
#> activity, but exhibited no effect on a mutated construct (Fig. 5F) showing
#> that miR-17 directly targets the Jak1 3¬¥UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2002, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2002, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2002, 25] got `{We transfected a ESR1
#> 3‚Ä≤-UTR (3‚Ä≤-ESR1-wt) luciferase reporter construct (Fig. S4B) together
#> with miR-18a precursors into HEK-293 cells and noticed an ‚àº60reduction in
#> luciferase activity compared to cells transfected with the scramble control
#> (Fig. 3B). Conversely, no reduction in luciferase activity was detected
#> with the miR-18a seed-modified ESR1 3‚Ä≤- UTR (3‚Ä≤-ESR1-mut) reporter
#> construct.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2003, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2003, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2003, 25] got `{We transfected a ESR1
#> 3‚Ä≤-UTR (3‚Ä≤-ESR1-wt) luciferase reporter construct (Fig. S4B) together
#> with miR-18a precursors into HEK-293 cells and noticed an ‚àº60reduction in
#> luciferase activity compared to cells transfected with the scramble control
#> (Fig. 3B). Conversely, no reduction in luciferase activity was detected
#> with the miR-18a seed-modified ESR1 3‚Ä≤- UTR (3‚Ä≤-ESR1-mut) reporter
#> construct.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2005, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2005, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2005, 25] got `{Luciferase activity was
#> significantly lower following the siRNA transfection suggesting that Smad3
#> is a direct target of miR-140 (Fig. 2). Mutations were introduced to all
#> three potential target sites, which rendered the construct insensitive to
#> the siRNA (Fig. 2).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2006, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2006, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2006, 25] got `{miR-150 suppressed the
#> luciferase activity of the Luc-EGR2 3'UTR by approximately 508ompared to
#> the vector control, while mutation or removal of the miR-150 binding site
#> blocked this suppression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2007, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2007, 23] got `{immunocytochemistry}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2007, 25] got `{Concomitantly, the
#> expression of p53 with wild type but not the mutated 39UTR could be
#> significantly suppressed by miR-30a (Figure 2E) or miR-30b (data not
#> shown).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2008, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2008, 23] got `{immunocytochemistry}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2008, 25] got `{Concomitantly, the
#> expression of p53 with wild type but not the mutated 39UTR could be
#> significantly suppressed by miR-30a (Figure 2E) or miR-30b (data not
#> shown).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2012, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2012, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2012, 25] got `{We then transfected this
#> luciferase reporter vector with either wild-type or mutant miR-497 binding
#> sequences into N2A cells. We also co-transfected these cells with a miR-497
#> mimic or mimic control and measured luciferase activity. As shown in Fig.
#> 4, the miR-497 mimic administered at a concentration of 50 nM decreases
#> luciferase activity of the reporter vector containing miR-497 binding
#> sequences (Fig. 4). As expected, the miR-497 mimic has no significant
#> effect on the reporter vector with mutated miR-497 binding sequences. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2013, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2013, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2013, 25] got `{We then transfected this
#> luciferase reporter vector with either wild-type or mutant miR-497 binding
#> sequences into N2A cells. We also co-transfected these cells with a miR-497
#> mimic or mimic control and measured luciferase activity. As shown in Fig.
#> 4, the miR-497 mimic administered at a concentration of 50 nM decreases
#> luciferase activity of the reporter vector containing miR-497 binding
#> sequences (Fig. 4). As expected, the miR-497 mimic has no significant
#> effect on the reporter vector with mutated miR-497 binding sequences. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2014, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2014, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2014, 25] got `{"We examined whether
#> MEK1 was directly regulated by miR-34a. Transfection of the miR-34a
#> precursor oligonucleotide significantly reduced luciferase expression from
#> a reporter plasmid that contained the 3 ' UTR of MEK1 compared with the
#> transfection of ascrambled RNA control (Fig. 5B)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2015, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2015, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2015, 25] got `{The miR-221 or miR-222
#> precursor oligonucleotide reduced the activity of a reporter plasmid that
#> contained the 3 ' UTR of c-fos (Fig. 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2016, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2016, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2016, 25] got `{The miR-221 or miR-222
#> precursor oligonucleotide reduced the activity of a reporter plasmid that
#> contained the 3 ' UTR of c-fos (Fig. 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2017, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2017, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2017, 25] got `{As illustrated in Figure
#> 2b, when cells were transfected with miR-138, the luciferase activity
#> was significantly diminished when compared to the cells transfected with
#> negative control. When the seed region of the targeting site was mutated
#> (pGL3-RhoCm), the miR-138 effect on luciferase was abolished.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2018, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2018, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2018, 25] got `{As illustrated in Figure
#> 3b, when cells were transfected with miR-138 mimic, the luciferase activity
#> was significantly reduced when compared to the cells transfected with
#> negative control. However, when the seed region of the targeting site was
#> mutated (pGL3-ROCK2m), the miR-138 effect on luciferase was abolished.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2019, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2019, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2019, 25] got `{"When pre375 was
#> cotransfected, the relative luciferase activity of a reporter containing
#> WT-3‚Ä≤ UTR was significantly suppressedby 30(P < 0.001) compared with that
#> of a reporter containing MUT-3‚Ä≤ UTR (Fig. 3D)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2024, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2024, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2024, 25] got `{Instead, coexpression
#> of 3 UTR MCP-2 with mir-146a (MCP-2 146a) resulted in a reproducible
#> 25reduction of R/L values (P 0.05). The control reporter plasmid carrying
#> the MCP-2 3 UTR mutated in the mir-146a seeding site was not affected by
#> the addition of mir-146a (mutMCP-2 146a).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2025, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2025, 25] got `{eGFP expression was
#> analysed by flow cytometry 72 h later. As shown in Figure 4A, expression
#> of eGFP-Var or eGFP-GLO remained unchanged in the three conditions tested.
#> However, a significant decrease in expression of eGFP-WT was observed in
#> MG63 cells transfected with hsa-miR-433 compared with the mock transfected
#> cells (39 229954616ecrease, Fig. 4A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2037, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2037, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2037, 25] got `{As indicated in Fig. 2B,
#> the introduction of miR-133a mimic decreased luciferase activity 408ompared
#> with the cells treated with a control mimic (P < 0.05). In a parallel
#> experiment, the inhibitory effect of miR-133a in cells transfected with the
#> mutant reporter vector (the two putative targeting sites were mutated) was
#> completely abolished.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2038, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2038, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2038, 25] got `{As indicated in Fig. 2B,
#> the introduction of miR-133a mimic decreased luciferase activity 408ompared
#> with the cells treated with a control mimic (P < 0.05). In a parallel
#> experiment, the inhibitory effect of miR-133a in cells transfected with the
#> mutant reporter vector (the two putative targeting sites were mutated) was
#> completely abolished.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2039, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2039, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2039, 25] got `{We observed a
#> significant dose-dependent miR-21-mediated decrease (P <0.05) in luciferase
#> activity (Fig. 3B).mutant Peli1 reporter levels in cultured cells did not
#> decrease upon pre-miR-21 cotransfections (Fig. 4).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2040, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2040, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2040, 25] got `{Deletion as well as
#> mutation of the miR-27 site completely abolished the LPS-mediated reduction
#> of luciferase activity (Fig. 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2041, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2041, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2041, 25] got `{Furthermore, to
#> determine the specific sites targeted by the two microRNAs, we constructed
#> vectors covering four conserved sites for miR-145 and one site for miR-133a
#> (Figure 2B). The luminescence intensity was significantly decreased at the
#> two sites targeted by miR-145 (positions 377‚Äì383 and 1140‚Äì1146) and one
#> site targeted by miR-133a (position 745‚Äì751) (Figure 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2042, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2042, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2042, 25] got `{Furthermore, to
#> determine the specific sites targeted by the two microRNAs, we constructed
#> vectors covering four conserved sites for miR-145 and one site for miR-133a
#> (Figure 2B). The luminescence intensity was significantly decreased at the
#> two sites targeted by miR-145 (positions 377‚Äì383 and 1140‚Äì1146) and one
#> site targeted by miR-133a (position 745‚Äì751) (Figure 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2043, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2043, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2043, 25] got `{Furthermore, to
#> determine the specific sites targeted by the two microRNAs, we constructed
#> vectors covering four conserved sites for miR-145 and one site for miR-133a
#> (Figure 2B). The luminescence intensity was significantly decreased at the
#> two sites targeted by miR-145 (positions 377‚Äì383 and 1140‚Äì1146) and one
#> site targeted by miR-133a (position 745‚Äì751) (Figure 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2044, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2044, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2044, 25] got `{Furthermore, to
#> determine the specific sites targeted by the two microRNAs, we constructed
#> vectors covering four conserved sites for miR-145 and one site for miR-133a
#> (Figure 2B). The luminescence intensity was significantly decreased at the
#> two sites targeted by miR-145 (positions 377‚Äì383 and 1140‚Äì1146) and one
#> site targeted by miR-133a (position 745‚Äì751) (Figure 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2045, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2045, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2045, 25] got `{Furthermore, to
#> determine the specific sites targeted by the two microRNAs, we constructed
#> vectors covering four conserved sites for miR-145 and one site for miR-133a
#> (Figure 2B). The luminescence intensity was significantly decreased at the
#> two sites targeted by miR-145 (positions 377‚Äì383 and 1140‚Äì1146) and one
#> site targeted by miR-133a (position 745‚Äì751) (Figure 2B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2056, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2056, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2056, 25] got `{To ascertain the
#> direct effect of miR-221 on DDIT4, mutant constructs targeting S1, S2, or
#> S1+S2 were generated from human and murine DDIT4 3‚Ä≤UTR. Mutations that
#> disrupted the two binding sites for miR-221 entirely restored luciferase
#> activity (Fig.5B and Fig. S6C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2057, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2057, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2057, 25] got `{To ascertain the
#> direct effect of miR-221 on DDIT4, mutant constructs targeting S1, S2, or
#> S1+S2 were generated from human and murine DDIT4 3‚Ä≤UTR. Mutations that
#> disrupted the two binding sites for miR-221 entirely restored luciferase
#> activity (Fig.5B and Fig. S6C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2060, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2060, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2060, 25] got `{Compared to antimiR-
#> nc, wild-type luciferase vector co-transfection with anti-miR-494 led
#> to a significant increase in luciferase/renilla activity. However, no
#> significant changes were observed in mutated vector co-transfection groups
#> (Fig. 1E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2061, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2061, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2061, 25] got `{Compared to antimiR-
#> nc, wild-type luciferase vector co-transfection with anti-miR-494 led
#> to a significant increase in luciferase/renilla activity. However, no
#> significant changes were observed in mutated vector co-transfection groups
#> (Fig. 1E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2075, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2075, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2075, 25] got `{"As shown in Fig. 3b,
#> suppression of the reporter activity by miR-16-1 was partially relieved
#> by mutation of the single conserved seedcomplementary site, and mutations
#> of both seed complementary sites almost fully rescued the repression for
#> CCNE1,"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2076, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2076, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2076, 25] got `{"As shown in Fig. 3b,
#> suppression of the reporter activity by miR-16-1 was partially relieved
#> by mutation of the single conserved seedcomplementary site, and mutations
#> of both seed complementary sites almost fully rescued the repression for
#> CCNE1,"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2077, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2077, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2077, 25] got `{Our results showed that
#> the relative luciferase activity of the pMIR-RB-3'-UTR construct with anti-
#> miR-675 was significantly increased in Clone A, HT-29 and MIP101 cells.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2078, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2078, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2078, 25] got `{Overexpression of
#> miR-2861 suppressed the luciferase activity of the HDAC5 CDS reporter gene
#> (Figure 4B). Mutation of 2 nucleotides within the putative target site in
#> the HDAC5 CDS (MUT-pGL3-HDAC5) abolished this repression, confirming the
#> specificity of the action (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2079, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2079, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2079, 25] got `{When cotransfected with
#> synthetic miR-495, a 50 229954616ecrease in luciferase activity, relative
#> to control, was observed (Fig. 3A). The luciferase activity was rescued
#> when the miR-495 target site was rendered ineffective by mutating two
#> nucleotides in the seed sequence (Fig. 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2080, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2080, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2080, 25] got `{When a construct with
#> wild-type 30UTR was cotransfected with synthetic miR-218, a decrease in
#> relative luciferase activity was observed, indicating that this 30UTR
#> region was targeted by miR-218 (Fig. 3B). We then generated constructs
#> bearing mutations in the different sites and verified their activity in the
#> presence of miR-218.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2081, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2081, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2081, 25] got `{When a construct with
#> wild-type 30UTR was cotransfected with synthetic miR-218, a decrease in
#> relative luciferase activity was observed, indicating that this 30UTR
#> region was targeted by miR-218 (Fig. 3B). We then generated constructs
#> bearing mutations in the different sites and verified their activity in the
#> presence of miR-218.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2082, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2082, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2082, 25] got `{When a construct with
#> wild-type 30UTR was cotransfected with synthetic miR-218, a decrease in
#> relative luciferase activity was observed, indicating that this 30UTR
#> region was targeted by miR-218 (Fig. 3B). We then generated constructs
#> bearing mutations in the different sites and verified their activity in the
#> presence of miR-218.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2092, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2092, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2092, 25] got `{We performed a
#> luciferase reporter assay and observed a significant decrease in luciferase
#> activity for the reporter vector of the 3'UTR of ECOP in AGS cells treated
#> with pre-miR-218 compared with mutant controls (Fig. 5A),}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2093, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2093, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2093, 25] got `{As anticipated,
#> cotransfection of miR-155 attenuated expression of luciferase from the WT
#> 3‚Ä≤-UTR-luc reporter (Fig 2C, bars 1 and 3), whereas no inhibition was
#> observed when a control miR (miR-CTL) was used (Fig 2C, bar 2). Similarly,
#> a mutated miR-155 (miR-155mut) whose seed sequence had been altered,
#> failed to suppress the luciferase activity originating from WT 3‚Ä≤-UTR-luc
#> plasmid (Fig 2C, bar 4).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2094, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2094, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2094, 25] got `{When the wild-type
#> or mutation-type vector was transfected with miR-129-2, the luciferase
#> activity of wild-type vector was significantly decreased (P < 0.001)
#> compared with mutation-type vector (Fig. 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2095, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2095, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2095, 25] got `{"As shown in Figure 4B,
#> co-transfection with miR-155 expression vector (pc3-miR-155) significantly
#> decreased the luciferase activityof the reporter vector containing the
#> wild-type 3‚ÄôUTR of C/EBPÔÅ¢, but had no effect on the mutant 3‚ÄôUTR of
#> C/EBPÔÅ¢ (Figure 4B),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2103, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2103, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2103, 25] got `{"Luciferase activity of
#> cells co-transfected with pre-miR-139 and pLUC-3'UTR-FoxO1 was decreased
#> compared to cells co-transfected with control pNeg and pLUC-3'UTR-FoxO1.
#> With the negative control constructs, p-LUC-Empty or pLUC-3'UTR mut-FoxO1
#> expressing a mutated sequence of the FoxO1 3'UTR target site, no reduced
#> luciferase activity was observed when cells were co-transfected with
#> premiR-139 compared to pNeg (Fig. 2A)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2105, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2105, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2105, 25] got `{Luciferase activity was
#> strongly suppressed when the reporter gene was linked to the wild-type RECK
#> 3'UTR (3'RECK-wt) (Figure 1e, bar 2). This effect was relieved when the
#> predicted miRNA-target sites were mutated.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2106, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2106, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2106, 25] got `{Luciferase activity was
#> strongly suppressed when the reporter gene was linked to the wild-type RECK
#> 3'UTR (3'RECK-wt) (Figure 1e, bar 2). This effect was relieved when the
#> predicted miRNA-target sites were mutated.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2107, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2107, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2107, 25] got `{Luciferase activity was
#> strongly suppressed when the reporter gene was linked to the wild-type RECK
#> 3'UTR (3'RECK-wt) (Figure 1e, bar 2). This effect was relieved when the
#> predicted miRNA-target sites were mutated.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2108, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2108, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2108, 25] got `{Luciferase activity was
#> strongly suppressed when the reporter gene was linked to the wild-type RECK
#> 3'UTR (3'RECK-wt) (Figure 1e, bar 2). This effect was relieved when the
#> predicted miRNA-target sites were mutated.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2109, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2109, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2109, 25] got `{Transfection with
#> precursors of miR-148a and miR-152 significantly modulated reporter
#> activity in Mz-ChA-1 cells.Next, the studies were repeated with random
#> mutations in the shared recognition sequence, which resulted in abolition
#> of the reporter activation by miR-148a and miR-152 precursors.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2110, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2110, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2110, 25] got `{Transfection with
#> precursors of miR-148a and miR-152 significantly modulated reporter
#> activity in Mz-ChA-1 cells.Next, the studies were repeated with random
#> mutations in the shared recognition sequence, which resulted in abolition
#> of the reporter activation by miR-148a and miR-152 precursors.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2111, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2111, 23] got `{lacZ activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2111, 25] got `{In SAS-miR-31 cells,
#> the A site mutation resulted in a considerable reversion of the Lac Z
#> repression compared with the B site mutation (Fig. 3C). Mutations in both A
#> and B sites resulted in a complete reversion of LacZ repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2112, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2112, 23] got `{lacZ activity assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2112, 25] got `{In SAS-miR-31 cells,
#> the A site mutation resulted in a considerable reversion of the Lac Z
#> repression compared with the B site mutation (Fig. 3C). Mutations in both A
#> and B sites resulted in a complete reversion of LacZ repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2114, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2114, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2114, 25] got `{"A marked reduction in
#> luciferase activity levels in cells overexpressing miR-27b was observed
#> (P < 0.05 versus nontransfectedcontrol) (Figure 3A). In contrast,
#> cotransfection of the mutant reporter plasmid with miR-27b mimic or the
#> reporter plasmid with the negative control microRNA had no effect on
#> luciferase activity in the transfected cells (Figure 3A)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2115, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2115, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2115, 25] got `{As shown in Fig.
#> 3B, a significant decrease of luciferase activity was detected in cells
#> transfected with the ICAM-1 3‚ÄôUTR construct containing the potential
#> binding site compared with mutant control vector, suggesting endogenous
#> translational repression of the construct with the ICAM-1 3‚ÄôUTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2116, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2116, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2116, 25] got `{Transfection of
#> anti‚ÄìmiR-222 into Hep3B was able to restore the luciferase activity of
#> WT construct by 30(P = 0.0066; Fig. 4Biii). By contrast, no effect on the
#> luciferase signal was detected with the deleted construct.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2117, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2117, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2117, 25] got `{As expected, decreased
#> reporter activity was observed in the cells expressing the luciferase
#> shRNA (positive control).Accordingly, when either miR-205-binding site was
#> mutated, we observed a relief of silencing of the reporter gene.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2118, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2118, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2118, 25] got `{As expected, decreased
#> reporter activity was observed in the cells expressing the luciferase
#> shRNA (positive control).Accordingly, when either miR-205-binding site was
#> mutated, we observed a relief of silencing of the reporter gene.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2127, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2127, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2127, 25] got `{Statistically
#> significant repression of luciferase activity was observed in 293T cells
#> cotransfectedwith Pre-miR-181c and a reporter vector containing the NOTCH4
#> or KRAS 3'-UTR target site (Figure 5E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2128, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2128, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2128, 25] got `{Statistically
#> significant repression of luciferase activity was observed in 293T cells
#> cotransfectedwith Pre-miR-181c and a reporter vector containing the NOTCH4
#> or KRAS 3'-UTR target site (Figure 5E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2129, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2129, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2129, 25] got `{"Cotransfection of
#> KYSE140 cells with pIS0-KLF4‚Äì3' -UTR and pcDNA3.0-miR-10b caused a 30
#> 229954616ecrease in the luciferase activity compared with the negative
#> control. This suppression was rescued by the four-nucleotide substitution
#> in the core binding sites(Fig. 3C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2136, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2136, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2136, 25] got `{In addition, our
#> results indicate that both of the binding sites could be involved in
#> miR-30d regulation, as mutation of the two sites separately could restore
#> luciferase activity when this construct was cotransfected with miR-30d
#> (Fig. 3E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2137, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2137, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2137, 25] got `{In addition, our
#> results indicate that both of the binding sites could be involved in
#> miR-30d regulation, as mutation of the two sites separately could restore
#> luciferase activity when this construct was cotransfected with miR-30d
#> (Fig. 3E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2141, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2141, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2141, 25] got `{The normalized
#> luciferase activity increased by 60(P¬º0.0017) in pIS0-TIMP3-3'-UTR
#> transfected cells but not in pIS0-TIMP3-3'-UTR‚ñ≥ expressing cells (Figure
#> 2d(ii)).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2142, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2142, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2142, 25] got `{"Cytomeg-alovirus-driven
#> miR-15b, -16, -195, and -424 resulted in a decrease in luciferase activity,
#> whereas similaramounts of miR-214 had no effect (Fig. 2C). Moreover,
#> miR-15b, -16, -195, and -424 did not decrease the luciferase activities of
#> mutated Arl2‚Äì3 -UTR constructs."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2143, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2143, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2143, 25] got `{"Cytomeg-alovirus-driven
#> miR-15b, -16, -195, and -424 resulted in a decrease in luciferase activity,
#> whereas similaramounts of miR-214 had no effect (Fig. 2C). Moreover,
#> miR-15b, -16, -195, and -424 did not decrease the luciferase activities of
#> mutated Arl2‚Äì3 -UTR constructs."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2144, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2144, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2144, 25] got `{"Cytomeg-alovirus-driven
#> miR-15b, -16, -195, and -424 resulted in a decrease in luciferase activity,
#> whereas similaramounts of miR-214 had no effect (Fig. 2C). Moreover,
#> miR-15b, -16, -195, and -424 did not decrease the luciferase activities of
#> mutated Arl2‚Äì3 -UTR constructs."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2145, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2145, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2145, 25] got `{"Cytomeg-alovirus-driven
#> miR-15b, -16, -195, and -424 resulted in a decrease in luciferase activity,
#> whereas similaramounts of miR-214 had no effect (Fig. 2C). Moreover,
#> miR-15b, -16, -195, and -424 did not decrease the luciferase activities of
#> mutated Arl2‚Äì3 -UTR constructs."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2191, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2191, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2191, 25] got `{"As shown in Fig. 2A,
#> miR-145 suppressed more than 55 0x0p+0ctivity for Luc-MUC1-UTR compared
#> with vector control;neither miR-206 nor miR-224 suppressed Luc-MUC1-UTR.
#> Furthermore, the mutant miR-145 had no suppressive effect."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2197, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2197, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2197, 25] got `{Luciferase activity
#> of the 39 UTR ERK-Luc construct was decreased in the presence of miR-143,
#> whereas luciferase activity of mutated -Luc construct was not affected.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2198, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2198, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2198, 25] got `{"A 60repression of the
#> RhoB 3'UTR reporter was observed, Mutated seed sequences in both target
#> sites in the RhoB 30UTR abolished the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2199, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2199, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2199, 25] got `{"A 60repression of the
#> RhoB 3'UTR reporter was observed, Mutated seed sequences in both target
#> sites in the RhoB 30UTR abolished the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2202, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2202, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2202, 25] got `{Transfection of let-7c
#> to HuH7 cells significantly inhibited the level of Luciferase/Renilla
#> ratio when compared to pre-miR negative control in the presence of the wt
#> 59 and 39 sites, as well as the long 39UTR fragment (Figure 6F). Mutations
#> of either of these two sites considerably reduced luciferase repression by
#> let-7c. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2203, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2203, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2203, 25] got `{Transfection of let-7c
#> to HuH7 cells significantly inhibited the level of Luciferase/Renilla
#> ratio when compared to pre-miR negative control in the presence of the wt
#> 59 and 39 sites, as well as the long 39UTR fragment (Figure 6F). Mutations
#> of either of these two sites considerably reduced luciferase repression by
#> let-7c. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2204, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2204, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2204, 25] got `{Transient transfec- tion
#> of SW620 cells (low endogenous miR-141 expression) with pGL3-SIP1 reporter
#> construct (not pGL3-SIP1-mut) and pre-miR-141 led to a signiÔ¨Åcant
#> decrease of reporter activity as compared with the control .}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2205, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2205, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2205, 25] got `{Transient transfec- tion
#> of SW620 cells (low endogenous miR-141 expression) with pGL3-SIP1 reporter
#> construct (not pGL3-SIP1-mut) and pre-miR-141 led to a signiÔ¨Åcant
#> decrease of reporter activity as compared with the control .}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2210, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2210, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2210, 25] got `{Indeed, Renilla
#> luciferase activity decreased by 508ompared with non-targeting control
#> transfected cells. In addition, site-directed mutagenesis of the seed
#> region abolished the inhibitory effect ofmiR-27b on Renilla luciferase
#> activity .}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2212, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2212, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2212, 25] got `{Co-transfection of
#> H293 cells with miR-182 and psiCHECK2 containing the complete RARG 3'-UTR
#> was signiÔ¨Åcantly decreased compared to cells co-transfected either with
#> miR-182 and psiCHECK2 containing RARG 3'-UTR in which the region containing
#> the predicted miR-182 target sequence was deleted.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2264, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2264, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2264, 25] got `{The single mutants both
#> still were responsive to miR-155 but at slightly higher concentrations than
#> those of the wild-type 3 UTR (Fig. 4C). The double mutant was completely
#> unresponsive to miR-155, indicating that both sites in the JARID2 3 ' UTR
#> are direct targets of miR-155 (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2265, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2265, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2265, 25] got `{The single mutants both
#> still were responsive to miR-155 but at slightly higher concentrations than
#> those of the wild-type 3 UTR (Fig. 4C). The double mutant was completely
#> unresponsive to miR-155, indicating that both sites in the JARID2 3 ' UTR
#> are direct targets of miR-155 (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2272, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2272, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2272, 25] got `{Cotransfection of the
#> catenin-wt construct and pre-miR-200a resulted in significantly decreased
#> luciferase activity compared to transfection with pre-control 1, whereas
#> luciferase activity was not significantly reduced in cells cotransfected
#> with catenin-mt and pre-miR-200a.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2275, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2275, 23] got `{fluorescence intensity}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2275, 25] got `{As a result, the
#> intensity of EGFP fluorescence in pcDNA3B‚ÅÑ pri-miR-9-treated cells
#> is significantly lower than that in the control vector group (Fig. 3B).
#> Similarly, we constructed another EGFP reporter vector containing the
#> mutational NF-jB1 3'-UTR (Fig. 3A). It was shown that overexpression of
#> miR-9 could not affect the intensity of EGFP fluorescence in this 3'-UTR
#> mutant vector.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2276, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2276, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2276, 25] got `{It demonstrated that
#> miR-155 still efficiently inhibited luciferase activity after abrogation of
#> the first seed while it had no inhibitory effect on the activity of MUT2.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2277, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2277, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2277, 25] got `{It demonstrated that
#> miR-155 still efficiently inhibited luciferase activity after abrogation of
#> the first seed while it had no inhibitory effect on the activity of MUT2.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2278, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2278, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2278, 25] got `{In agreement with
#> previous data, miR-155 significantly inhibited the luciferase activity of
#> the 2 constructs, the duplicated site construct being even more sensitive
#> than the wild type 3'UTR KGF construct.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2279, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2279, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2279, 25] got `{In agreement with
#> previous data, miR-155 significantly inhibited the luciferase activity of
#> the 2 constructs, the duplicated site construct being even more sensitive
#> than the wild type 3'UTR KGF construct.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2280, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2280, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2280, 25] got `{The results indicated
#> that let-7e suppressed while as-let-7e enhanced luciferase expression and
#> activity, indicating a direct interaction between let-7e and the 3‚Ä≤UTR of
#> TLR4 (Figure 4C). Mutation at the seed sequence of the TLR4-3‚Ä≤UTR where
#> let-7e was predicted to bind (mutTLR4-UTR-luc) abolished suppression by
#> let-7e (Figure 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2281, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2281, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2281, 25] got `{The results indicated
#> that miR-155 suppressed while as-miR-155 enhanced luciferase expression and
#> activity while mutation of the seed sequence for miR-155 at the 3‚Ä≤UTR of
#> SOCS1.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2294, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2294, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2294, 25] got `{Because cotransfection
#> with either miR-200c (Fig. 6E), miR-200b, or miR-429 (data not shown) and
#> wild-type 3‚Ä≤-UTR/ERRFI-1 significantly reduced the luciferase activity in
#> UMUC3 and T24 and because the double-mutant constructs were able to rescue
#> this activity, we concluded that ERRFI-1 is a direct target of the miR-200
#> in these cells (Fig. 6E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2295, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2295, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2295, 25] got `{Because cotransfection
#> with either miR-200c (Fig. 6E), miR-200b, or miR-429 (data not shown) and
#> wild-type 3‚Ä≤-UTR/ERRFI-1 significantly reduced the luciferase activity in
#> UMUC3 and T24 and because the double-mutant constructs were able to rescue
#> this activity, we concluded that ERRFI-1 is a direct target of the miR-200
#> in these cells (Fig. 6E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2296, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2296, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2296, 25] got `{Because cotransfection
#> with either miR-200c (Fig. 6E), miR-200b, or miR-429 (data not shown) and
#> wild-type 3‚Ä≤-UTR/ERRFI-1 significantly reduced the luciferase activity in
#> UMUC3 and T24 and because the double-mutant constructs were able to rescue
#> this activity, we concluded that ERRFI-1 is a direct target of the miR-200
#> in these cells (Fig. 6E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2300, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2300, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2300, 25] got `{luciferase expression
#> from reporter constructs derived from BCL2 was significantly suppressed by
#> synthetic miRNA and increased by anti-miR transfections (mutant constructs
#> were unresponsive).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2301, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2301, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2301, 25] got `{luciferase expression
#> from reporter constructs derived from BCL2 was significantly suppressed by
#> synthetic miRNA and increased by anti-miR transfections (mutant constructs
#> were unresponsive).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2302, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2302, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2302, 25] got `{The MEF2D wildtype
#> constructs produced significant suppression by each miRNA and anti-
#> miR transfection also resulted in a significant increase in luciferase
#> expression. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2303, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2303, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2303, 25] got `{The MEF2D wildtype
#> constructs produced significant suppression by each miRNA and anti-
#> miR transfection also resulted in a significant increase in luciferase
#> expression. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2304, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2304, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2304, 25] got `{the wildtype MAP3K12
#> MREs displayed significant luciferase suppression by the synthetic miRNA
#> and was increased by anti-miR transfections (with the exception of the
#> combined anti-miR). Mutant MREs were all unresponsive except miR-20a.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2305, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2305, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2305, 25] got `{the wildtype MAP3K12
#> MREs displayed significant luciferase suppression by the synthetic miRNA
#> and was increased by anti-miR transfections (with the exception of the
#> combined anti-miR). Mutant MREs were all unresponsive except miR-20a.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2311, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2311, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2311, 25] got `{As shown in Figure
#> 4B, co-transfection with miR-210 but not miR-185 specifically decreased
#> luciferase levels from the reporter. This effect requires the miR-210 seed
#> region as the miR-210 mutant duplex is much less effective in reducing
#> reporter activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2312, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2312, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2312, 25] got `{As shown in Figure 5B,
#> we observed a marked reduction in luciferase activity in cells transfected
#> with miR-155 mimics and luciferase report vectors (P <.05). In contrast, no
#> change of luciferase was observed in cells transfected with the mutant 3 -
#> UTR constructs or miRcontrol.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2313, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2313, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2313, 25] got `{As shown in Figure 5B,
#> we observed a marked reduction in luciferase activity in cells transfected
#> with miR-155 mimics and luciferase report vectors (P <.05). In contrast, no
#> change of luciferase was observed in cells transfected with the mutant 3 -
#> UTR constructs or miRcontrol.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2314, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2314, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2314, 25] got `{As shown in Figure 5B,
#> we observed a marked reduction in luciferase activity in cells transfected
#> with miR-155 mimics and luciferase report vectors (P <.05). In contrast, no
#> change of luciferase was observed in cells transfected with the mutant 3 -
#> UTR constructs or miRcontrol.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2315, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2315, 23] got `{immunocytochemistry}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2315, 25] got `{Transfection of 293T
#> cells with Œ≤TrCP1Œ¥miR-183 resulted in higher levels of expression of
#> Œ≤TrCP1 mRNA and protein, as compared with the wild-type.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2316, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2316, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2316, 25] got `{The relative luciferase
#> activity of the WT construct of DNMT3A 30UTR in both the colon cancer
#> cells was significantly reduced in the presence of miR-143.whereas such a
#> suppressive effect of miR-143 on luciferase activity was not observed in
#> both cells with the MUT construct of DNMT3A 3'UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2317, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2317, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2317, 25] got `{cotransfected with
#> premiR-7 into HEK293T cells. miR-7 significantly decreased luciferase
#> activity from Œ±-Syn-3 -UTR construct in a dose-dependent manner}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2330, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2330, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2330, 25] got `{"Similarly, the Bmi-1
#> 3‚Ä≤UTR (OV-202 and CP-70) luciferase activity was also significantly
#> lower in the miR-15a‚Äì and miR-16‚Äìtransfectedcells compared with the
#> control (Fig. 4).Mutation of the single miR-16 site rescued the luciferase
#> activity, thus confirming a directinteraction of miR-16 with the 3‚Ä≤UTR of
#> Bmi-1 mRNA."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2331, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2331, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2331, 25] got `{Similarly, the Bmi-1
#> 3‚Ä≤UTR (OV-202 and CP-70) luciferase activity was also significantly lower
#> in the miR-15a‚Äì and miR-16‚Äìtransfected cells compared with the control
#> (Fig. 4) However, mutation of the twomiR-15a sites independently rescued
#> the luciferase activity partially (Fig. 4).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2332, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2332, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2332, 25] got `{Similarly, the Bmi-1
#> 3‚Ä≤UTR (OV-202 and CP-70) luciferase activity was also significantly lower
#> in the miR-15a‚Äì and miR-16‚Äìtransfected cells compared with the control
#> (Fig. 4) However, mutation of the twomiR-15a sites independently rescued
#> the luciferase activity partially (Fig. 4).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2339, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2339, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2339, 25] got `{"miR-125a reduced
#> the activity of a luciferase reporter fused to the wild-type HuR 3'UTR
#> by 50(Fig. 6B and HuR3'UTR-WT). Moreover,deletion of the 7-nt sequence
#> in the HuR 3'UTR complementary to the miR-125a seed sequence restored
#> the luciferase activity of miR-125a transfected cells from 5041555152070
#> 87(Fig. 6B and HuR3'UTR-mut)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2342, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2342, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2342, 25] got `{Furthermore, we observed
#> down-regulation of Mcl-1 and Cdk6 proteins after transfection of synthetic
#> miR-29a and -29b oligonucleotides, but not with the controls in K562 cells
#> (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2344, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2344, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2344, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2345, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2345, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2345, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2346, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2346, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2346, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2347, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2347, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2347, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2349, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2349, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2349, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2350, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2350, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2350, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2351, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2351, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2351, 25] got `{Furthermore, the
#> observed luciferase/Renilla reduction was abrogated when we cotransfected
#> a mutated luciferase reporter vector containing the 3 UTR of MCL-1, CXXC6,
#> and CDK6 with 4 deleted nucleotides at the site of interactions with miR-29
#> (Figure 5E-G).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2353, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2353, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2353, 25] got `{As expected the
#> normalized luciferase activity of Luc-reg-15/16 was reduced significantly
#> by 58.99¬± 6.12 and 66.73¬± 4.44 upon addition of miR-16-1 and miR-15a
#> precursors respectively whereas the non-cognate control miR-95 did
#> not alter the luc expression. Moreover, the Luc-reg16mut plasmid was
#> insensitive to miR-15/16 introduction confirming the specificity of the
#> microRNA::target interaction (Fig. 3B, left).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2354, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2354, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2354, 25] got `{As expected the
#> normalized luciferase activity of Luc-reg-15/16 was reduced significantly
#> by 58.99¬± 6.12 and 66.73¬± 4.44 upon addition of miR-16-1 and miR-15a
#> precursors respectively whereas the non-cognate control miR-95 did
#> not alter the luc expression. Moreover, the Luc-reg16mut plasmid was
#> insensitive to miR-15/16 introduction confirming the specificity of the
#> microRNA::target interaction (Fig. 3B, left).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2355, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2355, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2355, 25] got `{The introduction of
#> a region containing a highly conserved miR-17/20a binding site (Luc-
#> reg-17/20a) led to a significant reduction of luciferase activity [-21.46¬
#> ± 5.44 in cells co-transfected with the CMV-miR-17 cluster plasmid (a kind
#> gift from Joshua Mendell)]. This reduction was completely rescued by the
#> mutation of the putative ‚Äòseed‚Äô sequence in the miRNA binding sites
#> (Fig. 3B, right).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2356, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2356, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2356, 25] got `{The introduction of
#> a region containing a highly conserved miR-17/20a binding site (Luc-
#> reg-17/20a) led to a significant reduction of luciferase activity [-21.46¬
#> ± 5.44 in cells co-transfected with the CMV-miR-17 cluster plasmid (a kind
#> gift from Joshua Mendell)]. This reduction was completely rescued by the
#> mutation of the putative ‚Äòseed‚Äô sequence in the miRNA binding sites
#> (Fig. 3B, right).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2359, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2359, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2359, 25] got `{The 5 UTR of RIP140 mRNA
#> significantly elevated reporter activity 6-fold, relative to the control
#> reporter (Figure 2A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2368, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2368, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2368, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2369, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2369, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2369, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2370, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2370, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2370, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2371, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2371, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2371, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2372, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2372, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2372, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2373, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2373, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2373, 25] got `{we measured changes
#> after miR-24 cotransfection in luciferase activity from a MYC 30UTR
#> reporter. miR-24 reduced luciferase activity 2.2-fold (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2374, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2374, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2374, 25] got `{miR-24 significantly
#> suppressed luciferase activity of a reporter gene containing the E2F2
#> MRE1.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2375, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2375, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2375, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2376, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2376, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2376, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2377, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2377, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2377, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2378, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2378, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2378, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2379, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2379, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2379, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2380, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2380, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2380, 25] got `{"We selected eight
#> genes (AURKB, BRCA1, CCNA2, CHEK1, CDC2, CDK4, FEN1, and PCNA) that
#> play important roles in cell-cycle progressionand cloned their entire
#> 3'UTRs into the luciferase reporter. The 30UTR of six out of eight genes
#> (AURKB, BRCA1, CCNA2, CDC2, CDK4, and FEN1, but not CHEK1 or PCNA) was
#> significantly repressed by miR-24, suggesting that these genes may be
#> direct targets (Figure 6C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2385, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2385, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2385, 25] got `{However, miR-206 dose-
#> dependently decreased the luciferase activity when cotransfected with the
#> mouse notch3 3 -UTR containing the miR- 206 target site.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2386, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2386, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2386, 25] got `{"As expected, miR-206
#> showed a strong inhibitory effect on normal (Fig. 2A, left) but not deleted
#> (Fig. 2A, right) or mutated (supplemental Fig.S2B) human notch3 3 -UTR-
#> luciferase activity."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2388, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2388, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2388, 25] got `{with the wild-type
#> reporter construct to gether with plasmid DpA-miR-128 led to a significant
#> decrease of luciferase activity ( 40) as compared to the control (Fig.
#> 4A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2389, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2389, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2389, 25] got `{the presence of the
#> wild-type sites was sufficient to significantly decrease luciferase
#> activity (57), while the mutated sites were inactive (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2390, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2390, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2390, 25] got `{As indicated,
#> introduction of miR-1 or miR-206 in HEK293 cells with the wild-type 3 -UTR
#> (pLuc-MET 3UTR) construct had significant inhibition of luciferase activity
#> as opposed to negative control (Fig. 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2391, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2391, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2391, 25] got `{As indicated,
#> introduction of miR-1 or miR-206 in HEK293 cells with the wild-type 3 -UTR
#> (pLuc-MET 3UTR) construct had significant inhibition of luciferase activity
#> as opposed to negative control (Fig. 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2393, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2393, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2393, 25] got `{The luciferase
#> activities of this reporter in miR-21 knockout cells were f60-11208gher
#> than that in parental RKO cells but were suppressed by premiR-21
#> transfection (Fig. 4B).We then mutated the miR-21 binding site in the
#> reporter construct Luc-Cdc25A-Mut-UTRand found its activities were similar
#> in parental and miR-21 knockout RKO cells (Fig. 4).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2394, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2394, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2394, 25] got `{As indicated,
#> introduction of miR-1 or miR-206 in HEK293 cells with the wild-type 3 -UTR
#> (pLuc-MET 3UTR) construct had significant inhibition of luciferase activity
#> as opposed to negative control (Fig. 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2395, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2395, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2395, 25] got `{As indicated,
#> introduction of miR-1 or miR-206 in HEK293 cells with the wild-type 3 -UTR
#> (pLuc-MET 3UTR) construct had significant inhibition of luciferase activity
#> as opposed to negative control (Fig. 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2396, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2396, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2396, 25] got `{Transient transfection
#> of T47D cells, with a high endogenous miR-193b level, with the wild-
#> type 30UTR-uPA-luc reporter and anti-193b inhibitor, led to a significant
#> increase in reporter activity compared with control oligo (Figure
#> 3b).However, miR-193b could no longer decrease the luciferase activity of a
#> mutant construct‚Äîwith substitutions of four nucleotides in the miR-193b-
#> binding site (Figure 3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2397, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2397, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2397, 25] got `{When placed downstream
#> of a luci-ferase reporter gene,this target sequence,but not its mutant
#> version, was indeed repressed by miR-133b(Fig. 5A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2398, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2398, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2398, 25] got `{cotransfection with
#> miR-181a significantly suppressed activity of the PLAG1-3 UTRluciferase
#> construct by 43.6 0x0p+0nd in miR-181b by 48.4}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2399, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2399, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2399, 25] got `{cotransfection with
#> miR-181a significantly suppressed activity of the PLAG1-3 UTRluciferase
#> construct by 43.6 0x0p+0nd in miR-181b by 48.4}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2400, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2400, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2400, 25] got `{PLAG1-3 UTR-reporter
#> construct was also significantly suppressed, with 28.6 0x0p+0ctivity
#> reduction by miR-107 and 42.7 0x1.fe0c000004p-1035ctivity reduction by
#> miR-424 .}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2401, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2401, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2401, 25] got `{PLAG1-3 UTR-reporter
#> construct was also significantly suppressed, with 28.6 0x0p+0ctivity
#> reduction by miR-107 and 42.7 0x1.fe0c000004p-1035ctivity reduction by
#> miR-424 .}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2415, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2415, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2415, 25] got `{"we observed that
#> miR-153 repressed the reporter activities based on the 30UTR regions
#> of both Bcl-2 and Mcl-1 moderately but significantly (Figs. 4a and 4b).
#> MiR-153 did not significantly alter the reporter activities based on the
#> mutant 30UTR regions of these respective Bcl-2 and Mcl-1 fragments (Figs.
#> 4a and 4b)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2416, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2416, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2416, 25] got `{"we observed that
#> miR-153 repressed the reporter activities based on the 30UTR regions
#> of both Bcl-2 and Mcl-1 moderately but significantly (Figs. 4a and 4b).
#> MiR-153 did not significantly alter the reporter activities based on the
#> mutant 30UTR regions of these respective Bcl-2 andMcl-1 fragments (Figs. 4a
#> and 4b)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2428, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2428, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2428, 25] got `{PC-3 cells transiently
#> transfected with the WT-3'-UTR-reporter construct and pre-miR-330 led to a
#> significant decrease of reporter activity when compared with the control.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2433, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2433, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2433, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2434, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2434, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2434, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2435, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2435, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2435, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2436, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2436, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2436, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2437, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2437, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2437, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2438, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2438, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2438, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2439, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2439, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2439, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2440, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2440, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2440, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2441, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2441, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2441, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2442, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2442, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2442, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2443, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2443, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2443, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2444, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2444, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2444, 25] got `{We found that forced
#> expression of miR-181s resulted in decreased luciferase activity when
#> the wild-type (WT) sequences were present (Fig 5D). This effect was
#> significantly reduced when the corresponding miR-181 binding sites (five
#> nucleotides within the complementary seed sequences) were mutated (MT) (Fig
#> 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2445, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2445, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2445, 25] got `{miR-34a overexpression
#> reduced luciferase activity by 454524921912eletion of MRE2 or mutation of
#> its seed in the context of the full-length 3 '-UTR significantly increased
#> reporter luciferase activity (supplemental Figure 3B) but did not restore
#> it to control levels.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2446, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2446, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2446, 25] got `{miR-34a overexpression
#> reduced luciferase activity by 454524921912eletion of MRE2 or mutation of
#> its seed in the context of the full-length 3 '-UTR significantly increased
#> reporter luciferase activity (supplemental Figure 3B) but did not restore
#> it to control levels.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2447, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2447, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2447, 25] got `{miR-34a overexpression
#> reduced luciferase activity by 454524921912eletion of MRE2 or mutation of
#> its seed in the context of the full-length 3 '-UTR significantly increased
#> reporter luciferase activity (supplemental Figure 3B) but did not restore
#> it to control levels.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2448, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2448, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2448, 25] got `{However, cotransfection
#> of B7-H3-WT with miR-29a significantly reduced luciferase activity,
#> reducing by > 60when compared to control level. This repression was
#> reversed by a single base mutation in the binding site (B7-H3-mt).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2451, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2451, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2451, 25] got `{Similarly, with the
#> full-length ERBB-2 3‚Äô-UTR, the miR-331-3p precursor induced a significant
#> decrease in reporter activity.In 22RV1 cells transfected with mutant A and
#> B site reporters, the effect of miR-331-3p was eliminated, consistent with
#> miR-331-3p binding directly to each of the two target sites (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2452, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2452, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2452, 25] got `{Similarly, with the
#> full-length ERBB-2 3‚Äô-UTR, the miR-331-3p precursor induced a significant
#> decrease in reporter activity.In 22RV1 cells transfected with mutant A and
#> B site reporters, the effect of miR-331-3p was eliminated, consistent with
#> miR-331-3p binding directly to each of the two target sites (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2462, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2462, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2462, 25] got `{As expected, the anti-
#> miR-130a 29-O-methyl oligonucleotide had no effect on the translational
#> efficiency of the reporter with a mutation of the A site (compare columns
#> 4 & 5, Fig. 3E). In contrast, translational repression of the reporter
#> construct was relieved in a dosedependent fashion with the addition of
#> increasing amounts of antimiR-130a 29-O-methyl oligonucleotide, resulting
#> in luciferase levels that were equivalent to those seen with the mutated A
#> site in the FOG-2 UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2463, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2463, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2463, 25] got `{It was found that miR-21
#> decreased the luciferase activity of the reporter vector containing either
#> the miR-21 response elements B12 or B34 [Fig. 3(A,B)].}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2464, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2464, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2464, 25] got `{It was found that miR-21
#> decreased the luciferase activity of the reporter vector containing either
#> the miR-21 response elements B12 or B34 [Fig. 3(A,B)].}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2465, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2465, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2465, 25] got `{It was found that miR-21
#> decreased the luciferase activity of the reporter vector containing either
#> the miR-21 response elements B12 or B34 [Fig. 3(A,B)].}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2466, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2466, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2466, 25] got `{It was found that miR-21
#> decreased the luciferase activity of the reporter vector containing either
#> the miR-21 response elements B12 or B34 [Fig. 3(A,B)].}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2468, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2468, 23] got `{fluorescence intensity}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2468, 25] got `{The results showed that
#> the expression level of EGFP was significantly increased when endogenous
#> miR-21 was blocked by miR-21 ASO (Fig. 3D). However, when the reporter
#> vector containing a mutational miR-21 binding site was used, the increase
#> in the level of EGFP was aborted.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2469, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2469, 23] got `{fluorescence intensity}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2469, 25] got `{We found that the
#> expression of EGFP was strongly increased when miR-21 function was
#> inhibited by transfecting cells with an antisense oligonucleotide (Figure
#> 4B),The EGFP expression from the mutated vector, pcDNA3/EGFP-BTG2MUT, was
#> not affected by miR-21, regardless of its expression levels (Figure 4B and
#> 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2470, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2470, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2470, 25] got `{we transfected 4175
#> cells with the pMIR-ST14-wt along with the antisense miR-27b and assayed
#> for luciferase activity. The cells showed enhancement in luciferase
#> activity compared with control cells (without the oligomer) or to cells
#> transfected with the control oligomer.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2472, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2472, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2472, 25] got `{miR-216a or miR-217
#> mimics significantly inhibited Pten 3‚Ä≤UTR Luc activity relative to
#> negative controls, while Pten 3‚Ä≤UTR containing mutations at miR-216a and/
#> or miR-217 sites lost this response (Fig. 2k and Supplementary Fig. S4a).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2473, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2473, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2473, 25] got `{miR-216a or miR-217
#> mimics significantly inhibited Pten 3‚Ä≤UTR Luc activity relative to
#> negative controls, while Pten 3‚Ä≤UTR containing mutations at miR-216a and/
#> or miR-217 sites lost this response (Fig. 2k and Supplementary Fig. S4a).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2474, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2474, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2474, 25] got `{Moreover, pmiR-145, but
#> not pDNR-CMV or pmiR-31 inhibited luciferase activity (Figure 6B). In the
#> mutated control groups, the inhibitory effect of pmiR-145 on luciferase
#> activity disappeared (Figure 6B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2477, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2477, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2477, 25] got `{As shown in Figure 3C,
#> cotransfection of T98G, MDA-MB-468 and H1299 cells with 50 nM or 100 nM
#> of the miR-30a mimic resulted in a 40‚Äì80reduction in the activity of the
#> reporter gene vector containing the wild-type miR-30a targeting sequences
#> (psiCHECKTM2-WT-BECN-3'-UTR), in comparison to that of the vector with the
#> deletion mutant (psiCHECKTM2-MTBECN-3'-UTR).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2478, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2478, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2478, 25] got `{Our results demonstrate
#> a decrease of the relative luciferase activity following ectopic expression
#> of hsa-miR-127, thus suggesting that BLIMP-1 expression is directly
#> regulated by this miRNA (Fig. 7a). As a further confirmation, no increase
#> of the relative luciferase activity was observed when sequence mutants in
#> the 30-UTR region of BLIMP-1 were cotransfected with the synthetic miRNA
#> (Fig. 7b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2480, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2480, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2480, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2481, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2481, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2481, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2482, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2482, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2482, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2483, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2483, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2483, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2484, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2484, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2484, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2485, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2485, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2485, 25] got `{Reporter assays using
#> miR-31-expressing 231 cells revealed that miR-31 repressed six of the UTRs:
#> frizzled3 (Fzd3), integrin Œ±5 (ITGA5), myosin phosphatase-Rho interacting
#> protein (M-RIP), matrix metallopeptidase 16 (MMP16), radixin (RDX), and
#> RhoA (Figure 4A). Mutation of the putative miR-31 site(s) in these six 3‚Äô
#> UTRs (Table S3) abrogated responsiveness to miR-31 (Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2487, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2487, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2487, 25] got `{The relative luciferase
#> activity was reduced by 50 0.000000ollowing cotransfection with miR-210
#> compared with transfection with control RNA (Fig. 3B).When the targeted
#> sequence of AcvR1b was mutated, the reduction of the luciferase activity by
#> miR-210 was impaired (Fig. 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2489, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2489, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2489, 25] got `{Co-transfection
#> of HEK293 cells with Luciferase construct (pMIR-TLR2) and a vector
#> overexpressing miR-105 precursor (pMIF-miR-105) inhibited Luciferase
#> activity (Fig. 7A, panel C). The mutant Luciferase vector (pMIRmutTLR2)
#> co-transfected with pMIF-miR-105 retained luciferase activity (Fig. 7A,
#> panelD).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2507, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2507, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2507, 25] got `{GALNT1 and SOX4 both
#> showed significant reduction in luciferase activity on transfection with
#> pre-miR-129 compared with GALNT1 and SOX4 3¬∂-UTRs with mutated miR-129
#> target sites.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2515, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2515, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2515, 25] got `{Interestingly,
#> the relative luciferase activity was markedly diminished in cells
#> cotransfected with the pMIR/618/ 5'-3'construct and miR-548d-3p, miR-559 or
#> miR-548d-3p plus miR-559, especially miR-548d-3p plus miR-559 (50 nM final
#> concentration, Fig. 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2516, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2516, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2516, 25] got `{Interestingly,
#> the relative luciferase activity was markedly diminished in cells
#> cotransfected with the pMIR/618/ 5'-3'construct and miR-548d-3p, miR-559 or
#> miR-548d-3p plus miR-559, especially miR-548d-3p plus miR-559 (50 nM final
#> concentration, Fig. 3A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2522, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2522, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2522, 25] got `{Indeed, miR-92a
#> overexpression reduced luciferase activity (Fig.4C).Mutation of the target
#> sequence prevented down-regulation of luciferase activity by pre-miR-92a
#> (Fig. 4C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2523, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2523, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2523, 25] got `{The levels of luciferase
#> activity in pGL3-Dlx5/miR-141 and -200a sensor-B or -D, which contain the
#> 1072‚Äì1091 region of the 3 -UTR of Dlx5, were lower than those in the
#> nonspecific control sensor vector (Fig. 5B).Onthe other hand, the levels
#> of luciferase activity in pGL3-Dlx5/miR-141 and -200a sensor-A or -C, which
#> lacks the 1072‚Äì1091 region of the 3 -UTR of Dlx5, were unchanged compared
#> with those in the nonspecific control sensor vector (p 0.1). We further
#> attempted to confirm these observations by using three different mutants of
#> pGL3-Dlx5/miR-141 and -200a sensor-B. The levels of luciferase activity in
#> cells transfected with the pGL3-Dlx5/miR-141 and -200a sensor-B (wild type)
#> were significantly reduced, although in cells transfected with the mutants
#> of seed region (Fig. 5C) the decrease in luciferase activities was canceled
#> (Fig. 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2524, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2524, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2524, 25] got `{The levels of luciferase
#> activity in pGL3-Dlx5/miR-141 and -200a sensor-B or -D, which contain the
#> 1072‚Äì1091 region of the 3 -UTR of Dlx5, were lower than those in the
#> nonspecific control sensor vector (Fig. 5B).Onthe other hand, the levels
#> of luciferase activity in pGL3-Dlx5/miR-141 and -200a sensor-A or -C, which
#> lacks the 1072‚Äì1091 region of the 3 -UTR of Dlx5, were unchanged compared
#> with those in the nonspecific control sensor vector (p 0.1). We further
#> attempted to confirm these observations by using three different mutants of
#> pGL3-Dlx5/miR-141 and -200a sensor-B. The levels of luciferase activity in
#> cells transfected with the pGL3-Dlx5/miR-141 and -200a sensor-B (wild type)
#> were significantly reduced, although in cells transfected with the mutants
#> of seed region (Fig. 5C) the decrease in luciferase activities was canceled
#> (Fig. 5D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2525, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2525, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2525, 25] got `{Coexpression of pc3-
#> miR-195 significantly suppressed firefly luciferase activity of the
#> reporter with wildtype 3 UTR but not that of the mutant reporter (Fig.4A).}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2526, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2526, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2526, 25] got `{Coexpression of pc3-
#> miR-195 significantly suppressed firefly luciferase activity of the
#> reporter with wildtype 3 UTR but not that of the mutant reporter (Fig.4A).}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2527, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2527, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2527, 25] got `{Coexpression of pc3-
#> miR-195 significantly suppressed firefly luciferase activity of the
#> reporter with wildtype 3 UTR but not that of the mutant reporter (Fig.4A).}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2528, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2528, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2528, 25] got `{Coexpression of pc3-
#> miR-195 significantly suppressed firefly luciferase activity of the
#> reporter with wildtype 3 UTR but not that of the mutant reporter (Fig.4A).}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2529, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2529, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2529, 25] got `{Coexpression of pc3-
#> miR-195 significantly suppressed firefly luciferase activity of the
#> reporter with wildtype 3 UTR but not that of the mutant reporter (Fig.4A).}
#> `
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2534, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2534, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2534, 25] got `{Co-expression of
#> either miR-221 or miR-222 significantly (P < 0.05) suppressed the reporter
#> activity compared to the control (Fig. 5C, wt). Mutations introduced into
#> the predicted binding site almost eliminated this suppression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2535, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2535, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2535, 25] got `{Co-expression of
#> either miR-221 or miR-222 significantly (P < 0.05) suppressed the reporter
#> activity compared to the control (Fig. 5C, wt). Mutations introduced into
#> the predicted binding site almost eliminated this suppression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2543, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2543, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2543, 25] got `{"Furthermore, co-
#> transfection of HeLa cells with psiCHECK-UTRwt and miR-31 showed a
#> significant decrease (48) in reporter luciferase activitycompared with
#> psiCHECK-UTRwt alone (Fig. 6A), while psiCHECK-UTRwt activity was not
#> affected by co-transfection with miR-Ctrl."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2544, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2544, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2544, 25] got `{As shown in Figure 4D,
#> miR-124a selectively suppressed the luciferase activity driven by the wild-
#> type 3 -UTR, but not the mutant form.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2545, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2545, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2545, 25] got `{Subsequent luciferase
#> assays revealed that miR-124a specifically suppressed the luciferase
#> activity driven by the 3 '-UTR of MCP-1 mRNA (Figure 5B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2546, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2546, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2546, 25] got `{In the case of the WNT1
#> 3 -UTR vector, miR-34a and let-7e, individually or in combination, but
#> not the negative nontargeting miRNA, suppressed the luciferase activity by
#> approximately 3041555152070 50(Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2547, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2547, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2547, 25] got `{In the case of the WNT1
#> 3 -UTR vector, miR-34a and let-7e, individually or in combination, but
#> not the negative nontargeting miRNA, suppressed the luciferase activity by
#> approximately 3041555152070 50(Figure 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2548, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2548, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2548, 25] got `{In the JAG1 3 '-
#> UTR vector, both miR-21 and miR-34a, alone or in combination, suppressed
#> luciferase activity by a modest but significant amount compared with the
#> negative nontargeting miRNA.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2556, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2556, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2556, 25] got `{It was found that co-
#> transfection of the plasmid expressing miR-155 reduced the activity of
#> the wild type 3 -UTR of the PU.1 reporter by 85The reporters that did not
#> contain the seeding sequence for miR-155, both control and mutant exhibited
#> no significant reduction in their Renilla luciferase activity, when co-
#> transfected with the miR-155 expressing vector (Fig. 2A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2557, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2557, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2557, 25] got `{Lefties wild-type
#> 3'UTRs (Lefty1-WT and Lefty2-WT) were specifically repressed by a synthetic
#> miR-302, whereas this negative effect was absent when reporters lacking the
#> seed-complementary sequence (Lefty1-Mut and Lefty2-Mut) were used (Figure
#> 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2558, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2558, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2558, 25] got `{Lefties wild-type
#> 3'UTRs (Lefty1-WT and Lefty2-WT) were specifically repressed by a synthetic
#> miR-302, whereas this negative effect was absent when reporters lacking the
#> seed-complementary sequence (Lefty1-Mut and Lefty2-Mut) were used (Figure
#> 2C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2563, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2563, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2563, 25] got `{Co-transfection of
#> miR-320 in H9c2 cells strongly inhibited the luciferase activity from the
#> reporter construct containing the 3‚Ä≤UTR segment of Hsp20, whereas no
#> effect was observed with a construct containing a mutated segment of Hsp20
#> 3‚Ä≤UTR (seed sequence CAGCUUU was mutated to GACACAA, Fig. 5H).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2574, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2574, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2574, 25] got `{This reporter system
#> showed that the translational level of all five luciferase-UTR constructs
#> was controlled by human miR-96, and that both mutations led to reduced
#> silencing of luciferase expression compared to wild-type miR-96.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2575, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2575, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2575, 25] got `{This reporter system
#> showed that the translational level of all five luciferase-UTR constructs
#> was controlled by human miR-96, and that both mutations led to reduced
#> silencing of luciferase expression compared to wild-type miR-96.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2576, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2576, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2576, 25] got `{This reporter system
#> showed that the translational level of all five luciferase-UTR constructs
#> was controlled by human miR-96, and that both mutations led to reduced
#> silencing of luciferase expression compared to wild-type miR-96.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2577, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2577, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2577, 25] got `{This reporter system
#> showed that the translational level of all five luciferase-UTR constructs
#> was controlled by human miR-96, and that both mutations led to reduced
#> silencing of luciferase expression compared to wild-type miR-96.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2578, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2578, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2578, 25] got `{This reporter system
#> showed that the translational level of all five luciferase-UTR constructs
#> was controlled by human miR-96, and that both mutations led to reduced
#> silencing of luciferase expression compared to wild-type miR-96.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2579, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2579, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2579, 25] got `{We used a luciferase
#> assay with siRNAs mimicking the wildtype and mutant miR-96. The siRNAs were
#> co-transfected into NIH 3T3 cells with a construct containing the 3‚Ä≤UTR
#> of each candidate gene, either with the putative binding sites intact, or
#> with the sites replaced by an EcoR1 site to disrupt binding. Five genes
#> were validated as targets of miR-96: Aqp5, Celsr2, Myrip, Odf2 and Ryk
#> (Fig. S3a,b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2580, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2580, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2580, 25] got `{We used a luciferase
#> assay with siRNAs mimicking the wildtype and mutant miR-96. The siRNAs were
#> co-transfected into NIH 3T3 cells with a construct containing the 3‚Ä≤UTR
#> of each candidate gene, either with the putative binding sites intact, or
#> with the sites replaced by an EcoR1 site to disrupt binding. Five genes
#> were validated as targets of miR-96: Aqp5, Celsr2, Myrip, Odf2 and Ryk
#> (Fig. S3a,b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2581, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2581, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2581, 25] got `{We used a luciferase
#> assay with siRNAs mimicking the wildtype and mutant miR-96. The siRNAs were
#> co-transfected into NIH 3T3 cells with a construct containing the 3‚Ä≤UTR
#> of each candidate gene, either with the putative binding sites intact, or
#> with the sites replaced by an EcoR1 site to disrupt binding. Five genes
#> were validated as targets of miR-96: Aqp5, Celsr2, Myrip, Odf2 and Ryk
#> (Fig. S3a,b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2582, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2582, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2582, 25] got `{We used a luciferase
#> assay with siRNAs mimicking the wildtype and mutant miR-96. The siRNAs were
#> co-transfected into NIH 3T3 cells with a construct containing the 3‚Ä≤UTR
#> of each candidate gene, either with the putative binding sites intact, or
#> with the sites replaced by an EcoR1 site to disrupt binding. Five genes
#> were validated as targets of miR-96: Aqp5, Celsr2, Myrip, Odf2 and Ryk
#> (Fig. S3a,b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2583, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2583, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2583, 25] got `{We used a luciferase
#> assay with siRNAs mimicking the wildtype and mutant miR-96. The siRNAs were
#> co-transfected into NIH 3T3 cells with a construct containing the 3‚Ä≤UTR
#> of each candidate gene, either with the putative binding sites intact, or
#> with the sites replaced by an EcoR1 site to disrupt binding. Five genes
#> were validated as targets of miR-96: Aqp5, Celsr2, Myrip, Odf2 and Ryk
#> (Fig. S3a,b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2584, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2584, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2584, 25] got `{Co-transfection of
#> MCF-7 cells with a wild-type RTKN-3'UTR (RTKN-wt) reporter and the miR-145-
#> overexpressing plasmid resulted in a significant decrease in luminescence,
#> whereas mutation of the RTKN miR-145 seed region (RTKN-mu) rendered the
#> reporter construct insensitive to inhibition by miR-145 (Fig. 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2586, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2586, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2586, 25] got `{Cotransfection with the
#> miR-302 expression plasmid and subsequent luciferase assays revealed that
#> both putative target sites indeed contribute to the suppressive effect of
#> miR-302 (Fig. 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2587, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2587, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2587, 25] got `{Cotransfection with the
#> miR-302 expression plasmid and subsequent luciferase assays revealed that
#> both putative target sites indeed contribute to the suppressive effect of
#> miR-302 (Fig. 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2599, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2599, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2599, 25] got `{We found a direct
#> effect of miR-92-1 on VHL 3' UTR with significant repression of luciferase
#> activity (approximately 60) by miR-92-1 compared with control vectors, a
#> mutated target mRNAsequence, or a miRNAthat has no interaction site with
#> VHL (miR-16; Figure 3C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2601, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2601, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2601, 25] got `{we blocked endogenous
#> miR-34a using inhibitor antisense RNA oligo. 5ULuc3U expression was greater
#> than that of 5ULuc or Luc3U, suggesting that the 5'-UTR of AXIN2 together
#> with the 3'-UTR are functional target sites for miR-34a in the cells (Fig.
#> 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2602, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2602, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2602, 25] got `{we blocked endogenous
#> miR-34a using inhibitor antisense RNA oligo. 5ULuc3U expression was greater
#> than that of 5ULuc or Luc3U, suggesting that the 5'-UTR of AXIN2 together
#> with the 3'-UTR are functional target sites for miR-34a in the cells (Fig.
#> 2D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2605, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2605, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2605, 25] got `{"We found that ectopic
#> expression of miR-451 inhibited the expression of the reporter vector
#> containing MIF 3'UTR but not the reporter vectorcontaining the mutation of
#> the seed‚ÄìmiR-451 binding site (Fig. 5D)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2606, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2606, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2606, 25] got `{Transient transfection
#> of HEK-293T cells, with a low endogenous miR-21 expression, with the
#> wildtype-3'-UTR reporter plasmid and miR-21 mimics led to a significant
#> decrease in reporter activity as compared to the control (Fig. 4A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2607, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2607, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2607, 25] got `{The fact that expression
#> from the 3 UTR reporter corresponding to the parental ADAM17 sequences (but
#> not from one with a mutated binding sequences, ADAM17-M) had significantly
#> suppressed luciferase activity in miR-122 transfected 293T cells confirmed
#> the authenticity of this binding site (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2653, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2653, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2653, 25] got `{Aggregate data (Figure
#> 5A left) reveal an 86 229954616ncrease in NFAT1 protein expression when the
#> cells were treated with antisense to miR-184.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2670, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2670, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2670, 25] got `{the miR-497 mimic
#> administered at a concentration of 50 nM decreases luciferase activity
#> of the reporter vector containing miR-497 binding sequences (Fig. 4). As
#> expected the miR-497 mimic has no significant effect on the reporter vector
#> with mutated miR-497 binding sequences.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2672, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2672, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2672, 25] got `{Co-transfections of
#> miR-10a mimic with the HDAC4‚Äì3 -UTR reporter resulted in the repression
#> of luciferase activity when compared with the mimic negative control (p
#> 0.05) (Fig. 2B). On the other hand, the HDAC4-mut-3 -UTR reporter was not
#> repressed by miR-10a mimic}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2673, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2673, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2673, 25] got `{As indicated in Fig. 2B,
#> the introduction of miR-133a mimic decreased luciferase activity 408ompared
#> with the cells treated with a control mimic (P 0.05). In a parallel
#> experiment, the inhibitory effect of miR-133a in cells transfected with the
#> mutant reporter vector (the two putative targeting sites were mutated) was
#> completely abolished,}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2674, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2674, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2674, 25] got `{"Luciferase analysis
#> revealed that the activities of three wild type 3'UTR reporters were
#> significantly suppressed by miR-129, but not by miR-410(Fig. 4B).
#> Suppression by miR-129 depends on the wild type miR-129 complementary
#> sites, and was no longer observed in reporters in which miR-129
#> complementary sites were mutated (Fig. 4B)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2675, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2675, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2675, 25] got `{Introduction of miR-148a
#> precursor into PC3 cells decreased relative luciferase activity of the
#> reporter gene containing the MSK1 3 -UTR WT compared with a control
#> precursor, while that of the reporter gene containing the MSK1 3 -UTRMTwas
#> not affected by miR-148a (Fig. 5A).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2676, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2676, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2676, 25] got `{miR-17/20 repressed IL-8
#> luciferase reporter gene activity, and mutation of themiR-17/20 binding
#> site of the IL-8 3‚Ä≤ UTR reduced the repression (Fig. 5 B and C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2678, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2678, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2678, 25] got `{Indeed, mutant Peli1
#> reporter levels in cultured cells did not decrease upon pre-miR-21
#> cotransfections(Fig. 4)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2679, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2679, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2679, 25] got `{As indicated in Fig. 2B,
#> the introduction of miR-133a mimic decreased luciferase activity 408ompared
#> with the cells treated with a control mimic (P 0.05). In a parallel
#> experiment, the inhibitory effect of miR-133a in cells transfected with the
#> mutant reporter vector (the two putative targeting sites were mutated) was
#> completely abolished,}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2680, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2680, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2680, 25] got `{As indicated in Fig. 2B,
#> the introduction of miR-133a mimic decreased luciferase activity 408ompared
#> with the cells treated with a control mimic (P 0.05). In a parallel
#> experiment, the inhibitory effect of miR-133a in cells transfected with the
#> mutant reporter vector (the two putative targeting sites were mutated) was
#> completely abolished,}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2681, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2681, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2681, 25] got `{"The recipient cell
#> line Caco-2 (derived from colon carcinoma) endogenously expressed all three
#> groups of miRNAs (Figure 2). Luciferase activity was strongly suppressed
#> when the reporter gene was linked to the wild-type RECK 30UTR (30RECK-wt)
#> (Figure 1e, bar 2). This effect was relievedwhen the predicted miRNA-target
#> sites were mutated (Figure 1e and Supplementary Figure 1),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2682, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2682, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2682, 25] got `{"The recipient cell
#> line Caco-2 (derived from colon carcinoma) endogenously expressed all three
#> groups of miRNAs (Figure 2). Luciferase activity was strongly suppressed
#> when the reporter gene was linked to the wild-type RECK 30UTR (30RECK-wt)
#> (Figure 1e, bar 2). This effect was relievedwhen the predicted miRNA-target
#> sites were mutated (Figure 1e and Supplementary Figure 1),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2683, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2683, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2683, 25] got `{"The recipient cell
#> line Caco-2 (derived from colon carcinoma) endogenously expressed all three
#> groups of miRNAs (Figure 2). Luciferase activity was strongly suppressed
#> when the reporter gene was linked to the wild-type RECK 30UTR (30RECK-wt)
#> (Figure 1e, bar 2). This effect was relievedwhen the predicted miRNA-target
#> sites were mutated (Figure 1e and Supplementary Figure 1),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2684, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2684, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2684, 25] got `{"The recipient cell
#> line Caco-2 (derived from colon carcinoma) endogenously expressed all three
#> groups of miRNAs (Figure 2). Luciferase activity was strongly suppressed
#> when the reporter gene was linked to the wild-type RECK 30UTR (30RECK-wt)
#> (Figure 1e, bar 2). This effect was relievedwhen the predicted miRNA-target
#> sites were mutated (Figure 1e and Supplementary Figure 1),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2685, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2685, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2685, 25] got `{"The recipient cell
#> line Caco-2 (derived from colon carcinoma) endogenously expressed all three
#> groups of miRNAs (Figure 2). Luciferase activity was strongly suppressed
#> when the reporter gene was linked to the wild-type RECK 30UTR (30RECK-wt)
#> (Figure 1e, bar 2). This effect was relievedwhen the predicted miRNA-target
#> sites were mutated (Figure 1e and Supplementary Figure 1),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2688, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2688, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2688, 25] got `{Cotransfection of
#> a plasmid expressing miR-33 resulted in a 50‚Äì60 229954616ecrease in
#> luciferase activity when the reporter plasmid contained the human/mouse box
#> 1 sequence from ABCA1 or the mouse ABCG1 sequence(Fig. 2D, lanes 5, 6, 9,
#> and 10). The specificity of this effect issupported by the finding of no
#> repression when the reporter gene contained either sequences corresponding
#> to box 2 of ABCA1 (Fig. 2D), or mutant box 1 or mutant mouse ABCG1
#> sequences}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2689, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2689, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2689, 25] got `{Cotransfection of
#> a plasmid expressing miR-33 resulted in a 50‚Äì60 229954616ecrease in
#> luciferase activity when the reporter plasmid contained the human/mouse box
#> 1 sequence from ABCA1 or the mouse ABCG1 sequence(Fig. 2D, lanes 5, 6, 9,
#> and 10). The specificity of this effect issupported by the finding of no
#> repression when the reporter gene contained either sequences corresponding
#> to box 2 of ABCA1 (Fig. 2D), or mutant box 1 or mutant mouse ABCG1
#> sequences}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2690, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2690, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2690, 25] got `{Cotransfection of
#> a plasmid expressing miR-33 resulted in a 50‚Äì60 229954616ecrease in
#> luciferase activity when the reporter plasmid contained the human/mouse box
#> 1 sequence from ABCA1 or the mouse ABCG1 sequence(Fig. 2D, lanes 5, 6, 9,
#> and 10). The specificity of this effect issupported by the finding of no
#> repression when the reporter gene contained either sequences corresponding
#> to box 2 of ABCA1 (Fig. 2D), or mutant box 1 or mutant mouse ABCG1
#> sequences}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2694, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2694, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2694, 25] got `{The relative luciferase
#> activity of the WT construct of the KRAS 3#-UTR in PANC-1 cells was
#> significantly reduced in the presence of pre-miR-217 (P , 0.05); the
#> relative luciferase activity of the WT construct of the KRAS 3#-UTR in
#> MIAPaCa-2 cells was significantly increased in the presence of anti-miR-217
#> (P , 0.05). However, this effect was not observed in either cell line
#> carrying the MUT construct of the KRAS 3#-UTR, highlighting the direct and
#> specific interaction of miR-217 with the KRAS 3#-UTR (Figure 4D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2696, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2696, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2696, 25] got `{found that wild-type
#> CTLA-4 39-UTR luciferase activity was significantly (P < .01) suppressed
#> by cotransfected miR-155 (premiR-155) in comparison with nontargeting miRNA
#> (control;Fig 5, B). Moreover, significantly (P < .01) lower luciferase
#> activitywas detected in the cells transfected by the wild-type CTLA-4
#> construct relative to the constructs containing the mutated miR-155 seed
#> region, indicating that the CTLA-4 transcript is a direct target of miR-155
#> (Fig 5, B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2698, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2698, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2698, 25] got `{"Cells cotransfected
#> with pcDNA3-miR-34a and luciferase linked to the FOXP1-30UTR showed
#> repression of luciferase compared to control (Figure 3B). When the
#> conserved site in the FOXP1 30UTR was mutated (as depicted in Figure 3A),
#> luciferase expressionwas derepressed (Figure 3B; FOXP1mt)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2699, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2699, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2699, 25] got `{Similarly, co-
#> transfection of miR-451 resulted in greater reduction of the luciferase
#> activity, compared to miR controls (Fig. 4E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2700, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2700, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2700, 25] got `{Similarly, co-
#> transfection of miR-451 resulted in greater reduction of the luciferase
#> activity, compared to miR controls (Fig. 4E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2704, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2704, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2704, 25] got `{"When Faslg-luc was
#> cotransfected with miR-21 mimic into 293T-HEK cells, the luciferase
#> activity was attenuated by 43 ¬± 138ompared to cellscotransfected with
#> miR-67 mimic (n=4; P<0.02; Fig. 3C).To confirm the putative miR-21 binding
#> site, we repeated the above experiment with a mutated Faslg 3‚Ä≤UTR. The
#> sequence differed from the Faslg-luc in that the 9-mer putative binding
#> site was scrambled (Mut-luc; see methods for sequence). After transfection
#> with Mut-luc, there was no statistically significant difference in any
#> experimental group"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2707, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2707, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2707, 25] got `{"Luciferase activity of
#> cells transfected with miR-122a was decreased by 19 0x0p+0s compared with
#> NC (Fig. 4B);To test whether miR-122a regulated luciferase activity of50-
#> UTR of PRDXII through its binding to the predictedtarget site, we generated
#> the mutated reporter vector inwhich the predicted target sites were
#> mutated in PRDXII50-UTR. We found that mutation in the predicted target
#> sitesabolished the repressive effects of miR-122a on luciferaseactivity
#> (Fig. 4C),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2708, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2708, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2708, 25] got `{"When the WT-p53
#> reporter was transfected along withmiR-380 into human embryonic kidney
#> cells, luciferase activity wasdecreased ~308ompared to cells transfected
#> with a control vector(Fig. 3d). Suppression of luciferase activity was not
#> observed whenthe MUT-p53 reporter was transfected with miR-380"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2709, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2709, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2709, 25] got `{Using the luciferase
#> reporter construct containing the FBXW7 3‚Ä≤-UTR, we confirmed that
#> expression of miR-25, miR-27a, and miR-223 repressed reporter activity in
#> HCT116 cells, We confirmed both the predicted binding sites for miR-25 and
#> miR-223 within the FBXW7 3‚Ä≤-UTR by showing that mutation of each of these
#> sites relieved repression of reporter activity by the corresponding miRNA
#> but not the other (Fig. 2, A and B). Thus, miR-25 and miR-223 are able to
#> bind sites within the FBXW7 3‚Ä≤-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2710, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2710, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2710, 25] got `{Using the luciferase
#> reporter construct containing the FBXW7 3‚Ä≤-UTR, we confirmed that
#> expression of miR-25, miR-27a, and miR-223 repressed reporter activity in
#> HCT116 cells, We confirmed both the predicted binding sites for miR-25 and
#> miR-223 within the FBXW7 3‚Ä≤-UTR by showing that mutation of each of these
#> sites relieved repression of reporter activity by the corresponding miRNA
#> but not the other (Fig. 2, A and B). Thus, miR-25 and miR-223 are able to
#> bind sites within the FBXW7 3‚Ä≤-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2713, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2713, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2713, 25] got `{Reporter assay revealed
#> reduction of miR-221/222 led to a marked increase of luciferase activity of
#> pGL3-WT-PUMA-3'UTR plasmid, without change in luciferase activity of pGL3-
#> MUT-PUMA-3'UTR plasmid (Fig. ‚Äã(Fig.2D).2D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2714, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2714, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2714, 25] got `{Reporter assay revealed
#> reduction of miR-221/222 led to a marked increase of luciferase activity of
#> pGL3-WT-PUMA-3'UTR plasmid, without change in luciferase activity of pGL3-
#> MUT-PUMA-3'UTR plasmid (Fig. ‚Äã(Fig.2D).2D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2715, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2715, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2715, 25] got `{We normalised luciferase
#> activity, taking the value for MDVT-150mut cells as 100 0x0p+0s mutated
#> gga-miR-150 did not repress activity in MDVT-150mut cells. The activity
#> of the MYB WT reporter was specifically repressed by gga-miR-150 in PA9
#> and MSB-1T-150 cells (by up to about 80) (Fig. ‚Äã(Fig.2B).2B). The same
#> reporter activity patterns were observed in both systems, demonstrating
#> that the observed pattern of target site usage resulted from intrinsic
#> characteristics of chicken c-myb 3'UTR. We found that pmiR-150 did not
#> repress the activity of the MYB mt1234 reporter or the MYB mt2 construct
#> whereas the activities of MYB mt1, mt3 and mt4 were significantly repressed
#> (by about 40 to 60) (Fig. ‚Äã(Fig.3B).3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2716, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2716, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2716, 25] got `{Cells cotransfected with
#> MT-fLuc-dpt-3‚Ä≤UTR and control mir-92b vectors strongly expressed reporter
#> luciferase (Fig. 3). Luciferase expression was markedly repressed in cells
#> cotransfected with MT-fLuc-dpt-3‚Ä≤UTR and let-7 vectors. To verify that
#> the identified let-7 sequence of the diptericin 3‚Ä≤UTR was responsible
#> for its repression, we generated a MT-fLuc-dpt-3‚Ä≤UTRmutant where 20
#> nucleotides including the candidate let-7 binding site were deleted. This
#> mutant luciferase reporter was not repressed in cells cotransfected with
#> the let-7 vector }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2717, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2717, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2717, 25] got `{the relative luciferase
#> activity was reduced by 50 0.000000ollowing cotransfection with miR-155
#> mimics compared with transfection with miR-155 control. In contrast,
#> no change of luciferase was observed in cells transfected with 3‚Ä≤MUT
#> constructs or miR-155 inhibitors. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2718, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2718, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2718, 25] got `{Results showed that
#> luciferase activity was greatly decreased in the embryos injected with
#> I300 RNA and TK-Rluc-dkk3 3‚Ä≤ UTR, compared to that of embryos injected
#> with I300 RNA with a plasmid in which the luciferase cDNA did not contain
#> 3‚Ä≤ UTR of dkk3 (TK-Rluc) (Figure 5C). If embryos received injection with
#> I300 RNA using a plasmid in which the luciferase cDNA contained mutated
#> sequences of dkk3 3‚Ä≤ UTR (TK-Rluc-mdkk3 3‚Ä≤ UTR) (Figure 5B), the
#> luciferase activity was not responsive to miR-In300 }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2719, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2719, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2719, 25] got `{The luciferase
#> signals for wild-type 3‚Ä≤-UTR sequences of both LATS2 and PPP2R2A were
#> repressed by cotransfection of pre‚ÄìmiR-31 in ED-1 cells and increased by
#> cotransfection of anti‚ÄìmiR-31. In contrast, engineered mutations of the
#> miR-31‚Äìbinding site antagonized these effects (Figure ‚Äã(Figure6,6, C
#> and D). These results indicated that miR-31 can directly bind to the 3‚Ä≤-
#> UTR sequences of LATS2 and PPP2R2A. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2720, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2720, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2720, 25] got `{The luciferase
#> signals for wild-type 3‚Ä≤-UTR sequences of both LATS2 and PPP2R2A were
#> repressed by cotransfection of pre‚ÄìmiR-31 in ED-1 cells and increased by
#> cotransfection of anti‚ÄìmiR-31. In contrast, engineered mutations of the
#> miR-31‚Äìbinding site antagonized these effects (Figure ‚Äã(Figure6,6, C
#> and D). These results indicated that miR-31 can directly bind to the 3‚Ä≤-
#> UTR sequences of LATS2 and PPP2R2A. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2724, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2724, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2724, 25] got `{Our results showed
#> that overexpression of miR-1 significantly inhibited the activity of Pim-1
#> 3‚Ä≤ UTR luciferase reporter gene (Fig. 5E). More specifically, mutations
#> introduce into the miR-1 seed sequences resulted in loss of inhibition by
#> miR-1 (Fig. 5E). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2725, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2725, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2725, 25] got `{We found that co-
#> transfection with miR-31 did not affect the luciferase activity of the
#> original empty vector control, while coexpression of miR-31 with the
#> reporter containing SATB2 3‚Ä≤UTR reduced the luciferase activity (Fig.
#> 5B). To identify whether both predicted binding sites are functional, we
#> cloned each of them separately into the same reporter vector. To prove the
#> specificity of the miR-31 effect, we also deleted several base pairs in
#> the seed regions of the miR-31 binding sites. The results show that each
#> of the wild-type binding sites (but not the mutated sequence) is capable
#> of reducing luciferase activity when co-transfected with miR-31 (Fig. 5B).
#> These data confirm that SATB2 is a direct target of miR-31.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2738, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2738, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2738, 25] got `{This was further
#> confirmed by the luciferase reporter assay wherein miR-29a significantly
#> inhibited the luciferase activity of the reporter vector containing the
#> PI3Kp85Œ± wild type 3‚Ä≤UTR (Fig. 6C). This inhibition was not observed
#> with the reporter containing the PI3Kp85Œ± mutated 3‚Ä≤UTR that indicates
#> the specificity of the miR-29a-PI3Kp85Œ± 3‚Ä≤UTR interaction.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2739, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2739, 25] got `{We compared the ASF-
#> UTR GFP activity in HEK293 recipient cells with equivalent constructs
#> where either the miR-28 (mut-28) or the miR-505 (mut-505) seed sites were
#> mutated. Inactivation of either miR-28 or miR-505 binding sites in the ASF-
#> UTR significantly increases GFP expression, indicating a direct binding of
#> these miRNAs on ASF/SF2 3‚Ä≤-UTR (Fig. 3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2740, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2740, 23] got `{GFP fluorescence }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2740, 25] got `{We compared the ASF-
#> UTR GFP activity in HEK293 recipient cells with equivalent constructs
#> where either the miR-28 (mut-28) or the miR-505 (mut-505) seed sites were
#> mutated. Inactivation of either miR-28 or miR-505 binding sites in the ASF-
#> UTR significantly increases GFP expression, indicating a direct binding of
#> these miRNAs on ASF/SF2 3‚Ä≤-UTR (Fig. 3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2757, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2757, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2757, 25] got `{As shown in Fig. 6 B,
#> transfected miR-125b duplex drastically inhibited the reporter activity,
#> whereas it had no effect on the control reporter without the 3‚Ä≤ UTR
#> (vector). Most importantly, when the predicted miR-125b seed region in the
#> 3‚Ä≤ UTR was mutated, the mutant reporter no longer responded to miR-125b
#> (Fig. 6 B), strongly suggesting that the predicted site is a bona fide
#> target of miR-125b and it is solely responsible for miR-125b targeting of
#> the Igf2 3‚Ä≤ UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2758, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2758, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2758, 25] got `{miR-98 significantly
#> reduced the activity of D2-3UTR compared to that of D2-3UTRm in
#> cardiomyocytes, whereas the control vector did not (Fig. 7I). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2761, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2761, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2761, 25] got `{Co-transfection of
#> the pAck1 3‚ÄôUTR-wt construct (453‚Äì840 nt) and pre-miR-7 resulted in
#> significantly decreased luciferase activity compared to transfection with
#> pre-control 1 (Fig. 4D). We next investigated the relative contribution
#> of each putative miR-7 target site in the Ack1 3‚ÄôUTR. miR-7 reduced the
#> expression of all three reporters carrying the different putative target
#> sites A and B, and C, but not of the corresponding mutant (mt) reporters
#> (Fig. 4E). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2765, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2765, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2765, 25] got `{The reporter assay
#> showed that miR-15a was able to significantly repress luciferase expression
#> (Fig. 4C), and mutation of 4 nt in the miR-15a target sequence led to
#> complete abrogation the suppressive effect (Fig. 4C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2768, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2768, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2768, 25] got `{In Drosophila S2
#> cultured cells, overexpression of miR-310 cluster caused a significant
#> repression of a luciferase sensor carrying the entire Khc-73 3‚Ä≤-UTR
#> (p=0.00002), indicating that Khc-73 is sensitive to the activity of the
#> miR-310 cluster (Figure 3B). We tested the importance of the predicted
#> conserved miR-310 cluster sites on Khc-73 3‚Ä≤-UTR by mutating all three
#> conserved sites (see Experimental Procedures); these mutations abolished
#> the sensitivity of the luciferase sensor to the miR-310 cluster (Figure
#> 3B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2769, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2769, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2769, 25] got `{In Drosophila S2
#> cultured cells, overexpression of miR-310 cluster caused a significant
#> repression of a luciferase sensor carrying the entire Khc-73 3‚Ä≤-UTR
#> (p=0.00002), indicating that Khc-73 is sensitive to the activity of the
#> miR-310 cluster (Figure 3B). We tested the importance of the predicted
#> conserved miR-310 cluster sites on Khc-73 3‚Ä≤-UTR by mutating all three
#> conserved sites (see Experimental Procedures); these mutations abolished
#> the sensitivity of the luciferase sensor to the miR-310 cluster (Figure
#> 3B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2770, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2770, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2770, 25] got `{In Drosophila S2
#> cultured cells, overexpression of miR-310 cluster caused a significant
#> repression of a luciferase sensor carrying the entire Khc-73 3‚Ä≤-UTR
#> (p=0.00002), indicating that Khc-73 is sensitive to the activity of the
#> miR-310 cluster (Figure 3B). We tested the importance of the predicted
#> conserved miR-310 cluster sites on Khc-73 3‚Ä≤-UTR by mutating all three
#> conserved sites (see Experimental Procedures); these mutations abolished
#> the sensitivity of the luciferase sensor to the miR-310 cluster (Figure
#> 3B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2771, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2771, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2771, 25] got `{In Drosophila S2
#> cultured cells, overexpression of miR-310 cluster caused a significant
#> repression of a luciferase sensor carrying the entire Khc-73 3‚Ä≤-UTR
#> (p=0.00002), indicating that Khc-73 is sensitive to the activity of the
#> miR-310 cluster (Figure 3B). We tested the importance of the predicted
#> conserved miR-310 cluster sites on Khc-73 3‚Ä≤-UTR by mutating all three
#> conserved sites (see Experimental Procedures); these mutations abolished
#> the sensitivity of the luciferase sensor to the miR-310 cluster (Figure
#> 3B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2772, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2772, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2772, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2773, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2773, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2773, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2774, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2774, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2774, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2775, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2775, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2775, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2776, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2776, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2776, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2777, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2777, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2777, 25] got `{In this case, co-
#> transfection of the miR-132 mimic, but not the microRNA Negative Control,
#> caused a subtle (~5‚Äì10) reduction in luciferase activity, which we
#> attributed as a non-sequence-specific effect of miR-132 overexpression in
#> vitro. Most importantly, the wild-type 3‚Ä≤UTRs of all genes examined were
#> significantly repressed by the miR-132 mimic, with a range of repression
#> between 28 and 50(Fig. 1D). In all cases except for Jarid1a, the effects
#> of the miR-132 mimic were abolished by the mutation of the seed site (Fig.
#> 1D). For Jarid1a, which bears two putative miR-132 MREs within its 3‚Ä≤UTR,
#> mutation of the first MRE (site 1), but not the second (site 2), abolished
#> the repressive effects of the miR-132 mimic (Fig. 1D).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2782, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2782, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2782, 25] got `{Relative to the effect
#> of scrambled control oligomers, miR-200b and 200c suppressed the activity
#> of the Flt1 3‚Ä≤-UTR reporter by 5041555152070 60which was similar to the
#> effect of these oligomers on the Zeb1 3‚Ä≤-UTR reporter, and had no effect
#> on the control luciferase reporter (Fig. 1B). This suppressive effect was
#> abrogated by site-directed mutagenesis of the 5‚Ä≤ putative miR-200 binding
#> site but not the 3‚Ä≤ binding site (Fig. 1B). Furthermore, other miR-200
#> family members (200a and 429) had no effect on Flt1 3‚Ä≤-UTR reporter
#> activity (data not shown), suggesting that Flt1 regulation is specific to
#> miR-200b and 200c.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2783, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2783, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2783, 25] got `{Relative to the effect
#> of scrambled control oligomers, miR-200b and 200c suppressed the activity
#> of the Flt1 3‚Ä≤-UTR reporter by 5041555152070 60which was similar to the
#> effect of these oligomers on the Zeb1 3‚Ä≤-UTR reporter, and had no effect
#> on the control luciferase reporter (Fig. 1B). This suppressive effect was
#> abrogated by site-directed mutagenesis of the 5‚Ä≤ putative miR-200 binding
#> site but not the 3‚Ä≤ binding site (Fig. 1B). Furthermore, other miR-200
#> family members (200a and 429) had no effect on Flt1 3‚Ä≤-UTR reporter
#> activity (data not shown), suggesting that Flt1 regulation is specific to
#> miR-200b and 200c.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2784, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2784, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2784, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2785, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2785, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2785, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2786, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2786, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2786, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2787, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2787, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2787, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2788, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2788, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2788, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2789, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2789, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2789, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2790, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2790, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2790, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2791, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2791, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2791, 25] got `{we used a luciferase
#> 3‚Ä≤-UTR reporter assay (Fig. 4A) to measure the inhibitory effects of
#> different miR-302 concentrations on the target sites of CDK2, cyclin D1/
#> D2, and BMI1 polycomb ring finger oncogene (BMI-1). In the presence
#> of 10 Œºmol/L Dox, miR-302 effectively bound to these target sites and
#> successfully silenced >801555152070f the reporter luciferase expression in
#> all targets (Fig. 4B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2793, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2793, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2793, 25] got `{"Rat ST15A cells were
#> transfected with the indicated miRNA mimics and, as opposed to the negative
#> control and the unrelated miR-494, only miR-18 prominently inhibited the
#> luciferase activity (Fig. 3C). In order to define the site of interaction,
#> we mutated the reporter construct in the putative binding region, which
#> abolished the effect of miR-18 on the luciferase activity (Fig. 3D). These
#> results confirmed Hsf2 as a direct target of miR-18 and identified the site
#> of interaction in the 3‚Ä≤UTR of Hsf2 mRNA. "}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2794, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2794, 23] got `{GFP fluorescence }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2794, 25] got `{we find that in mir-52
#> rescued embryos, marked by DLG-1mCHERRY (Figure 4B), and in otherwise wild-
#> type embryos (Figure S2), a col-10gfpcdh-3 transgene under the control of
#> the wild-type cdh-3 3‚Ä≤ UTR (WT, Figure 4C) is downregulated. Importantly,
#> a similar transgene but with a 4-bp mutation in the seed region of the
#> predicted miR-52 binding site (Figure S3, MUT) does not show this effect
#> (Figure 4F). In contrast, both WT and MUT transgenes are expressed in
#> mir-51 family mutant embryos (Figure 4, I and L). A second transgene with
#> an unrelated 3‚Ä≤ UTR (myo-2mcherryunc-54) is not regulated in a miR-52-
#> dependent manner (Figure 4, B, E, H, and K). Taken together, these data
#> show that miR-52 directly regulates the CDH-3 3‚Ä≤ UTR in vivo.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2795, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2795, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2795, 25] got `{"The result showed that,
#> co-transfecting with the pre-miRNAs expression constructs, the MT1 (co-
#> transfecting with the construct expressing miR-19b), MT2 and MT4 mutation
#> constructs resulted in a significantly increase in luciferase activity
#> comparing to that of the wild-type construct (Fig. 4), suggesting that the
#> miRNAs, miR-19b, miR-302b* and miR-323-3p, could repress gene expression in
#> HEK-293 cells."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2796, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2796, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2796, 25] got `{"The result showed that,
#> co-transfecting with the pre-miRNAs expression constructs, the MT1 (co-
#> transfecting with the construct expressing miR-19b), MT2 and MT4 mutation
#> constructs resulted in a significantly increase in luciferase activity
#> comparing to that of the wild-type construct (Fig. 4), suggesting that the
#> miRNAs, miR-19b, miR-302b* and miR-323-3p, could repress gene expression in
#> HEK-293 cells."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2797, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2797, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2797, 25] got `{"The result showed that,
#> co-transfecting with the pre-miRNAs expression constructs, the MT1 (co-
#> transfecting with the construct expressing miR-19b), MT2 and MT4 mutation
#> constructs resulted in a significantly increase in luciferase activity
#> comparing to that of the wild-type construct (Fig. 4), suggesting that the
#> miRNAs, miR-19b, miR-302b* and miR-323-3p, could repress gene expression in
#> HEK-293 cells."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2798, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2798, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2798, 25] got `{To do this, Luc
#> constructs containing the 3‚Ä≤ UTR of the three mRNAs or the corresponding
#> antisense fragments were generated. In all cases Luc expression was down-
#> regulated by pre-miR transfection, while the Luc-antisense constructs were
#> unaffected (Fig. 2B‚áì ). Furthermore, we generated three Luc constructs
#> bearing the 3‚Ä≤UTR of the three mRNAs, each mutated at the putative target
#> site of the cognate miRNA (see Supplemental Fig. 3). Also, in this case,
#> the constructs bearing mutated UTRs were unaffected by miR transfection,
#> thus demonstrating that Sirt1, Smarca5, and Jarid1b are direct targets of
#> miRs 34a, 100, and 137, respectively (Fig. 2B‚áì ). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2799, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2799, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2799, 25] got `{To do this, Luc
#> constructs containing the 3‚Ä≤ UTR of the three mRNAs or the corresponding
#> antisense fragments were generated. In all cases Luc expression was down-
#> regulated by pre-miR transfection, while the Luc-antisense constructs were
#> unaffected (Fig. 2B‚áì ). Furthermore, we generated three Luc constructs
#> bearing the 3‚Ä≤UTR of the three mRNAs, each mutated at the putative target
#> site of the cognate miRNA (see Supplemental Fig. 3). Also, in this case,
#> the constructs bearing mutated UTRs were unaffected by miR transfection,
#> thus demonstrating that Sirt1, Smarca5, and Jarid1b are direct targets of
#> miRs 34a, 100, and 137, respectively (Fig. 2B‚áì ). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2802, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2802, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2802, 25] got `{Transient cotransfection
#> of miR-93 mimics and luciferase expression plasmids in HeLa cells resulted
#> in significant repression of the basal level of the vegfa transcript,
#> whereas transfection of cells with miR-690 mimics, a control microRNA that
#> was not predicted to target VEGF, did not have any effect on the expression
#> of luciferase (Fig. 5C). Importantly, suppression of the vegfa 3‚Ä≤-UTR by
#> miR-93 mimics was abrogated when cells were transfected with miR-93 mutant
#> (Fig. 5C), }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2803, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2803, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2803, 25] got `{We found that
#> overexpression of miR-137 suppressed over 501555152070f the R-luc activity
#> in primary neurons at 48 hours post-transfection (n = 7, p < 0.001)
#> (Figure 5C). On the other hand, transfected anti-miR-137 led to a 28
#> 158513688ncrease in R-luc activity compared with the anti-miR control
#> (anti-miR-Con, n = 3, p < 0.05) (Figure 5D). To further validate the
#> interaction between miR-137 and its target Mib1 3‚Ä≤-UTR, we mutated the
#> seed sequence of miR-137 located within the Mib1-3‚Ä≤-UTR reporter (Figure
#> 5,B lower panel). This mutation substantially alleviated the miR-137-
#> mediated suppression of luciferase activity, suggesting that the action of
#> miR-137 is specific to the miR-137 seed region within the Mib1-3‚Ä≤-UTR (n
#> = 5, p < 0.001) (Figure 5E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2804, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2804, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2804, 25] got `{Relative to the virgin
#> luciferase reporter, annexation of the N-ras 3‚Ä≤-UTR resulted in an ~5-
#> fold reduction in the luciferase activity (Fig. 5D). Deletion and point
#> mutation analyses showed that the proximal miR-214 recognition site had
#> a stronger role in attenuating the expression, whereas mutating both
#> sequences severely curtailed the transcriptional repression activity of N-
#> ras 3‚Ä≤-UTR (Fig. 5, C and D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2805, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2805, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2805, 25] got `{Cells transfected with
#> premiR-214 expressed significantly more miR-214 when compared with cells
#> transfected with control plasmid. Pre-miR214 activity was then examined
#> based on luciferase activity. Expression of pre-miR-214 significantly
#> decreased the level of luciferase activity in cells transfected with MMP-
#> LUC-3'-PTEN (Fig. 5B). A reduction in luciferase activity was not observed
#> in cells transfected with or MMP-LUC-MUT-3'-PTEN (Fig. 5B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2810, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2810, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2810, 25] got `{These experiments
#> demonstrated that miR-802 can regulate luciferase activity in a
#> concentration-dependent manner (maximal inhibition 10 nM), with a
#> significant decrease in r-luc activity as low as 2 nM miR-802. In contrast,
#> transfection with control nontargeting miRNA (i.e., scramble) had no effect
#> on luciferase activity.The mutant construct, psiCHECK/hAT1R/mut-802, was
#> transfected into CHO cells with increasing concentrations of miR-802 or
#> control nontargeting miRNA, and luciferase activity was compared with that
#> of the nonaltered construct (Fig. 4C). miR-802 could no longer diminish r-
#> luc activity in the altered construct, even at a concentration of 25 nM.
#> Transfection of control nontargeting miRNA (i.e., scramble) with either
#> construct had no effect on luciferase activity.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2813, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2813, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2813, 25] got `{However, no such effect
#> was observed in cells expressing rhodopsin encoded by a mutant mRNA in
#> which the putative miR-708 seed binding site was replaced with a scrambled
#> sequence (Fig. 4 D and not depicted). Together, our results suggest that
#> miR-708 targets rhodopsin mRNA, resulting in its decreased expression in
#> mammalian cells.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2814, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2814, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2814, 25] got `{Using HCT-116 cells
#> cotransfected with pMIR-CC reporter constructs and the pre-miR miRNA
#> precursor of miR-379, we found that the pMIR-CC luminescent signal was
#> about 55 0x0p+0t of the control (P = 0.015, Figure 7C). There was no
#> significant difference between the signal from the cells cotransfected with
#> the pMIR-TT reporter constructs and those cotransfected with the pre-miR
#> miRNA precursor of miR-379 (P = 0.86, see Figure 7C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2815, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2815, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2815, 25] got `{ we cloned the two
#> predicted binding sites in PODXL 3‚Ä≤-UTR and linked them to firefly
#> luciferase vectors. When these luciferase vectors were co-transfected
#> with miR-199a-5p mimics in NT2 cells, luciferase activity of the vector
#> carrying the conserved binding site was significantly suppressed. However,
#> miR-199a-5p did not suppress the vector carrying a poorly conserved binding
#> site. To show that the suppression of luciferase activity is due to binding
#> of the miRNA to the seed sequence, we generated the mutant constructs by
#> mutating the seed sequence. As expected, miR-199a-5p had little effect
#> on the mutant constructs (Figure 5e). These data show that miR-199a-5p
#> regulates PODXL through a conserved binding site in its 3‚Ä≤-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2816, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2816, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2816, 25] got `{"To assess whether the
#> regulation of Smad3 is direct, we fused the 3‚Ä≤UTR region of Smad3 to a
#> luciferase reporter to validate the effects of miR-23b mimics on wild type
#> and mutant plasmids (Fig. 3C). Mutations in seed complementary sites fully
#> rescued repression of Smad3 (Fig. 3D)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2818, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2818, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2818, 25] got `{We found that ectopic
#> expression of miR-3960 significantly repressed luciferase activity of the
#> wild-type Hoxa2 CDS construct (Fig. 4B). Mutation of three nucleotides
#> within the putative target site in the Hoxa2 CDS (MUT-pGL3-Hoxa2) abolished
#> the repression (Fig. 4B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2819, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2819, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2819, 25] got `{Transient co-
#> transfection of miR-29c mimics with luciferase expression plasmids resulted
#> in a significant repression of luciferase reporter gene in podocytes,
#> whereas transfection of cells with miRNA control mimics (negative control)
#> did not have any effect on the expression of luciferase (Fig. 3C). However,
#> mutations within the seed sequence binding site of Spry1 abrogated the
#> effect of miR-29c mimics (Fig. 3C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2820, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2820, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2820, 25] got `{For Tgfbr2, luciferase
#> assay also showed ~50 229954616ecrease of GL activity while miR-93 mutant
#> did not have such effect (Supplementary Figure S18a and b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2821, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2821, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2821, 25] got `{For Tgfbr2, luciferase
#> assay also showed ~50 229954616ecrease of GL activity while miR-93 mutant
#> did not have such effect (Supplementary Figure S18a and b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2822, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2822, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2822, 25] got `{we constructed a
#> luciferase reporter with p21 3‚Ä≤UTR sequence inserted downstream of the
#> firefly luciferase coding sequence. We observed consistent ~40repression
#> of luciferase activity following transfection of miR-93 and miR-106b
#> mimics into co-transfected Hela cells, a repression lost when mutations
#> were introduced into the seed region of conserved p21 3‚Ä≤UTR target sites
#> (Supplementary Figure S17a and b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2823, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2823, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2823, 25] got `{we constructed a
#> luciferase reporter with p21 3‚Ä≤UTR sequence inserted downstream of the
#> firefly luciferase coding sequence. We observed consistent ~40repression
#> of luciferase activity following transfection of miR-93 and miR-106b
#> mimics into co-transfected Hela cells, a repression lost when mutations
#> were introduced into the seed region of conserved p21 3‚Ä≤UTR target sites
#> (Supplementary Figure S17a and b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2824, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2824, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2824, 25] got `{we conducted a series
#> of luciferase reporter assays by co-transfection of miR-1258 (wild type/
#> mutant) and luciferase constructs containing HPSE 3‚Ä≤-UTR (wild type/
#> mutant). Luciferase activity was decreased by miR-1258 approximately
#> 708ompared to scrambled control, and neither a miR-1258 mutant or an
#> alternate microRNA (miR-100) decreased activity in the Luc-HPSE 3‚Ä≤-
#> UTR constructs (Fig. 1B). Moreover, co-transduction of miR-1258 with a
#> luciferase construct containing the 5‚Ä≤-CCU-3‚Ä≤ deletion mutant (Luc-HPSE
#> 3‚Ä≤-UTR-del) failed to decrease luciferase activity (Fig. 1C).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2825, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2825, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2825, 25] got `{To test if mir-363 is
#> capable of regulating Hand2 and Tbx3 expression through binding to the
#> predicted sites, we inserted the Hand2 or Tbx3 3‚Ä≤ UTR sequence downstream
#> of luciferase and measured the level of luciferase activity in the presence
#> or absence of mir-363 transfection in HeLa cells. We found that addition
#> of mir-363 led to a statistically significant downregulation of luciferase
#> activity with either Hand2 or Tbx3 3‚Ä≤ UTR (Fig. 8C). Furthermore, this
#> downregulation is abolished by mutating the sequence of the predicted site
#> in either of the 3‚Ä≤ UTRs. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2826, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2826, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2826, 25] got `{To test if mir-363 is
#> capable of regulating Hand2 and Tbx3 expression through binding to the
#> predicted sites, we inserted the Hand2 or Tbx3 3‚Ä≤ UTR sequence downstream
#> of luciferase and measured the level of luciferase activity in the presence
#> or absence of mir-363 transfection in HeLa cells. We found that addition
#> of mir-363 led to a statistically significant downregulation of luciferase
#> activity with either Hand2 or Tbx3 3‚Ä≤ UTR (Fig. 8C). Furthermore, this
#> downregulation is abolished by mutating the sequence of the predicted site
#> in either of the 3‚Ä≤ UTRs. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2827, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2827, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2827, 25] got `{We cloned the entire
#> 3‚Ä≤-UTR sequences for both mouse and chick FoxP1 into a luciferase
#> construct. While control miRNAs (miR-17 and miR-128) had no effect on
#> luciferase activity, miR-9-1 and miR-9-2, but not miR-9-Mut, significantly
#> reduced luciferase activity of the constructs containing the 3‚Ä≤-UTR for
#> FoxP1, suggesting that miR-9 directly targets FoxP1}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2828, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2828, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2828, 25] got `{We cloned the entire
#> 3‚Ä≤-UTR sequences for both mouse and chick FoxP1 into a luciferase
#> construct. While control miRNAs (miR-17 and miR-128) had no effect on
#> luciferase activity, miR-9-1 and miR-9-2, but not miR-9-Mut, significantly
#> reduced luciferase activity of the constructs containing the 3‚Ä≤-UTR for
#> FoxP1, suggesting that miR-9 directly targets FoxP1}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2829, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2829, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2829, 25] got `{co-transfection of the
#> luciferase reporter and miR-34a oligos into three PCa cell types produced
#> lower luciferase activity than cells co-transfected with the NC oligos
#> but mutation of the seed sequence in either site, especially the distal
#> site, partially abrogated the suppressive effect of miR-34a (Fig. 4d;
#> Supplementary Fig. 11f,g). These results suggest that miR-34a regulates
#> CD44 expression via two binding sites located in the 3‚Äô-UTR of the CD44
#> gene.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2830, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2830, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2830, 25] got `{co-transfection of the
#> luciferase reporter and miR-34a oligos into three PCa cell types produced
#> lower luciferase activity than cells co-transfected with the NC oligos
#> but mutation of the seed sequence in either site, especially the distal
#> site, partially abrogated the suppressive effect of miR-34a (Fig. 4d;
#> Supplementary Fig. 11f,g). These results suggest that miR-34a regulates
#> CD44 expression via two binding sites located in the 3‚Äô-UTR of the CD44
#> gene.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2831, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2831, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2831, 25] got `{The overexpression of
#> mir-200c and mir-141 in PC-3 cells decreased luciferase activity from the
#> JAG1 3‚Ä≤UTR reporter by 25but expression of luciferase was unaltered in
#> the mutant sensor construct (Figure 4D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2832, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2832, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2832, 25] got `{The overexpression of
#> mir-200c and mir-141 in PC-3 cells decreased luciferase activity from the
#> JAG1 3‚Ä≤UTR reporter by 25but expression of luciferase was unaltered in
#> the mutant sensor construct (Figure 4D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2836, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2836, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2836, 25] got `{For a subset of target
#> genes including MET, GMNN, CCNE2, SIRT1 and HDAC1, we confirmed direct
#> interaction of miR-449 with the target gene 3' UTR using luciferase assay
#> (figure ‚Äã(figure3d3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2837, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2837, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2837, 25] got `{For a subset of target
#> genes including MET, GMNN, CCNE2, SIRT1 and HDAC1, we confirmed direct
#> interaction of miR-449 with the target gene 3' UTR using luciferase assay
#> (figure ‚Äã(figure3d3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2838, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2838, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2838, 25] got `{For a subset of target
#> genes including MET, GMNN, CCNE2, SIRT1 and HDAC1, we confirmed direct
#> interaction of miR-449 with the target gene 3' UTR using luciferase assay
#> (figure ‚Äã(figure3d3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2839, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2839, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2839, 25] got `{For a subset of target
#> genes including MET, GMNN, CCNE2, SIRT1 and HDAC1, we confirmed direct
#> interaction of miR-449 with the target gene 3' UTR using luciferase assay
#> (figure ‚Äã(figure3d3d).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2840, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2840, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2840, 25] got `{We found that
#> overexpression of miR-137 suppressed over 501555152070f the R-luc activity
#> in primary neurons at 48 hours post-transfection (n = 7, p < 0.001)
#> (Figure 5C). On the other hand, transfected anti-miR-137 led to a 28
#> 158513688ncrease in R-luc activity compared with the anti-miR control
#> (anti-miR-Con, n = 3, p < 0.05) (Figure 5D). To further validate the
#> interaction between miR-137 and its target Mib1 3‚Ä≤-UTR, we mutated the
#> seed sequence of miR-137 located within the Mib1-3‚Ä≤-UTR reporter (Figure
#> 5,B lower panel). This mutation substantially alleviated the miR-137-
#> mediated suppression of luciferase activity, suggesting that the action of
#> miR-137 is specific to the miR-137 seed region within the Mib1-3‚Ä≤-UTR (n
#> = 5, p < 0.001) (Figure 5E).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2841, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2841, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2841, 25] got `{Relative to the virgin
#> luciferase reporter, annexation of the N-ras 3‚Ä≤-UTR resulted in an ~5-
#> fold reduction in the luciferase activity (Fig. 5D). Deletion and point
#> mutation analyses showed that the proximal miR-214 recognition site had
#> a stronger role in attenuating the expression, whereas mutating both
#> sequences severely curtailed the transcriptional repression activity of N-
#> ras 3‚Ä≤-UTR (Fig. 5, C and D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2842, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2842, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2842, 25] got `{Relative to the virgin
#> luciferase reporter, annexation of the N-ras 3‚Ä≤-UTR resulted in an ~5-
#> fold reduction in the luciferase activity (Fig. 5D). Deletion and point
#> mutation analyses showed that the proximal miR-214 recognition site had
#> a stronger role in attenuating the expression, whereas mutating both
#> sequences severely curtailed the transcriptional repression activity of N-
#> ras 3‚Ä≤-UTR (Fig. 5, C and D). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2843, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2843, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2843, 25] got `{Interestingly, brain
#> cancer cells transfected with the hsa-miR-381 mimics, consistently had
#> decreased luciferase activity relative to cells transfected with the
#> chimeric plasmid without hsa-miR-381 (Student's t test, p < 0.01; Fig. 4B).
#> However, when these chimeric plasmids were transfected with or without hsa-
#> miR-381 in other (non-brain) cell lines, no significant differences were
#> observed, indicating that hsa-miR-381 specifically targets LRRC4 in brain
#> cancer cells. Co-application of the chimeric plasmid and the hsa-miR-381
#> antagomir eliminated the effect (Student's t test, p < 0.01; Fig. 4B). The
#> luciferase's reporter vector containing the mutated 3‚Ä≤ UTR of LRRC4 was
#> not responsive to the hsa-miR-381 mimics, }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2844, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2844, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2844, 25] got `{"The
#> luciferase activityof cells transfected with miR-375 precursor was
#> significantlydecreased compared with the negative control (P< 0.01) (Figure
#> 4C and 4D). Moreover, mutation of the putative miR-375-binding sites
#> clearly abrogated therepression of luciferase activity caused by miR-375
#> overexpression(Figure 4C and 4D). These data suggest thatmiR-375 may
#> inhibit JAK2 protein expression through3‚Ä≤-UTR at the posttranscriptional
#> level."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2845, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2845, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2845, 25] got `{"The
#> luciferase activityof cells transfected with miR-375 precursor was
#> significantlydecreased compared with the negative control (P< 0.01) (Figure
#> 4C and 4D). Moreover, mutation of the putative miR-375-binding sites
#> clearly abrogated therepression of luciferase activity caused by miR-375
#> overexpression(Figure 4C and 4D). These data suggest thatmiR-375 may
#> inhibit JAK2 protein expression through3‚Ä≤-UTR at the posttranscriptional
#> level."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2846, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2846, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2846, 25] got `{"The relative
#> luciferase activityof the reporter containing wild-type E2F3 30-UTR was
#> significantlysuppressed when miR-125b was cotransfected. In contrast,the
#> luciferase activity of the reporter containing themutant miR-125b-binding
#> site was unaffected, indicating thatmiR-125b may suppress gene expression
#> through miR-125bbindingsequences at the 30-UTR of E2F3 gene (Fig. 5c)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2847, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2847, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2847, 25] got `{"Overexpressionof
#> miR-448 resulted in a reduction of luciferaseactivity (Fig. 4B and
#> Supplemental Fig. 3A). To furtherconfirm this specificity, we mutated
#> the candidate miR-448 target sites (Fig. 4A), which resulted in the loss
#> ofmiR-448-mediated repression (Fig. 4B)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2848, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2848, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2848, 25] got `{"We tested if miR-27b
#> is able to regulate Mef2c by generatingluciferase reporter constructs with
#> wild-type and miR-27 ¬¥seed¬¥ sequence mutated Mef2c3¬¥UTRs. As illustrated
#> in Figure 6A, miR-27b significantly decreased luciferase activity inthe
#> context of the wild-type Mef2c 3¬¥UTR, while mutation of miR-27b target
#> sites (onepredicted by TargetScan, one non-canonical seed sequence;
#> Supplementary Figure 5)returned luciferase levels to that of the control
#> oligonucleotide."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2849, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2849, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2849, 25] got `{"As shown in Figure
#> 2B, cotransfectionof pMIR-Bin3-3‚Ä≤ UTR with the mousemiR-184 mimic
#> down-regulates luciferase activity by57 0x0p+0nd co-transfection of
#> pMIR-Bin3-3‚Ä≤ UTR-mutwith the mouse miR-184 mimic has no effect on
#> theluciferase activity."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2854, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2854, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2854, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2855, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2855, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2855, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2856, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2856, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2856, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2857, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2857, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2857, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2858, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2858, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2858, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2859, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2859, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2859, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2860, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2860, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2860, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2861, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2861, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2861, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2862, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2862, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2862, 25] got `{"The 3'-UTR segments
#> of each target were synthesizedand subcloned downstream of the Renilla
#> luciferasein the psiCHECK-2 dual luciferase reporter vector(Fig. 3A), and
#> reporter assays were performed as indicated.Surprisingly, as shown in Fig.
#> 3B, 11 reporterswere significantly repressed by miR-122 to differentdegrees
#> (30% reduction), including the twoknown targets. MSN (moesin) and serum
#> response factor(SRF) were not significant in this group. Thesedata indicate
#> that most candidate genes could bedirectly repressed by miR-122. To further
#> confirm thishypothesis, we performed mutational analyses on eachpredicted
#> site. As expected, all mutant sites lost theirresponse to miR-122 (Fig.
#> 3C), indicating the specificityof the repression."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2865, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2865, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2865, 25] got `{ The LNA-let-7 inhibitor
#> (1, 5, or 25 pmol) or scrambled control (25 pmol) was co-transfected
#> into the HEK239 cells together with the psiCHECK/MOR1UTR or the psiCHECK/
#> MOR1UTRmut. The LNA-let-7 inhibitor increased the reporter gene activity in
#> a dose-dependant manner. Co-transfection with 25 pmol LNA-let-7 inhibitor
#> completely restored the luciferase repression by psiCHECK/MOR1UTR. In
#> contrast, the LNA-let-7 inhibitor did not change the luciferase signal when
#> co-transfected with the psiCHECK/MOR1UTRmut that lacks the let-7 binding
#> sequence (Fig. 1C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2866, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2866, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2866, 25] got `{A significant decrease
#> in luciferase activity was observed in the construct bearing an intact
#> miR-21 binding site when compared with the control (Fig. 8B; P < 0.05).
#> The decrease in luciferase activity was lost on mutation of the putative
#> binding site for miR-21 by site-directed mutagenesis (Fig. 8C; P = not
#> significant). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2867, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2867, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2867, 25] got `{To verify whether
#> the Ybx1 3‚Ä≤-UTR is a direct target of miR-216a, Luc reporter vectors
#> containing the Ybx1 3‚Ä≤-UTR were constructed (Fig. 2E). miR-216a mimic
#> significantly inhibited Luc activity of Ybx1 3‚Ä≤-UTR vector by almost
#> 70relative to a negative control mimic (NC Mimic) but not in the two
#> control constructs, namely control without 3‚Ä≤-UTR (first pair of bars)
#> or that with Ybx1 3‚Ä≤-UTR that has base substitutions in the miR-216a site
#> (third pair of bars) (Fig. 2F). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2868, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2868, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2868, 25] got `{"Our results showed
#> that pcDNA-3.1-miR-107 produced a 60229954616ecrease in relative luciferase
#> activity compared with pcDNA3.1-transfected cells, when the full-length
#> wild-type 3 -UTR of DICER1was present (Fig. 3C). However, the relative
#> luciferase activity didnot drop as sharply in UTRs that contained mutant
#> binding sitesas in those that contained wild-type binding sites, which
#> indicatesthat this reduction was sequence-specific (Fig. 3C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2869, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2869, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2869, 25] got `{"In the dual-luciferase
#> assay, the relative luciferaseactivity of the reporter that contained
#> the RB1 3#-UTR wasmarkedly decreased compared with that seen with the
#> parentplasmid containing the mutant sequence or the NC mimicgroup and the
#> 16HBE-T blank group (Fig. 7E)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2870, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2870, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2870, 25] got `{"We cloned
#> the3‚Ä≤ UTR of MMP-9 downstream of the firefly luciferase gene
#> and foundthat the normalized luciferase activity was substantially
#> reduced uponcotransfectionwith either miR-212 or miR-132 or with both
#> microRNAstogether (‚ÄòMMP-9‚Äô in Supplementary Fig. 8). However, this
#> decrease inluciferase activity was abolished when the binding sites of
#> miR-212 andmiR-132 on the 3‚Ä≤ UTR of MMP-9 were mutated in the luciferase
#> construct(‚ÄòMMP-9-mut.‚Äô in Supplementary Fig. 8). These results
#> indicatethat MMP-9 is a direct target of both miR-212 and miR-132."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2871, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2871, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2871, 25] got `{"We cloned
#> the3‚Ä≤ UTR of MMP-9 downstream of the firefly luciferase gene
#> and foundthat the normalized luciferase activity was substantially
#> reduced uponcotransfectionwith either miR-212 or miR-132 or with both
#> microRNAstogether (‚ÄòMMP-9‚Äô in Supplementary Fig. 8). However, this
#> decrease inluciferase activity was abolished when the binding sites of
#> miR-212 andmiR-132 on the 3‚Ä≤ UTR of MMP-9 were mutated in the luciferase
#> construct(‚ÄòMMP-9-mut.‚Äô in Supplementary Fig. 8). These results
#> indicatethat MMP-9 is a direct target of both miR-212 and miR-132."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2876, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2876, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2876, 25] got `{"we generatedmiRNA
#> expression reporters, where firefly luciferase was placed
#> underpost‚Äëtranslational control of the native 3Õ¥ UTR of Dyrk1a or a
#> Dyrk1a3Õ¥UTR harbouring a mutated miR‚Äë199b seed region. Co‚Äëtransfection
#> ofsynthetic miR‚Äë199b decreased Dyrk1a 3Õ¥UTR reporter activity (Fig.
#> 2i),whereas no sensitivity was observed for co‚Äëexpression of a control
#> micro‚ÄëRNA (Fig. 2i) or a scrambled precursor microRNA (Supplementary
#> Information, Fig. S2c, d). In contrast, a pMiR‚ÄëREPORT‚Äë3Õ¥UTR Dyrk1awith
#> a mutated seed region showed no sensitivity to miR‚Äë199b expression(Fig.
#> 2i)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2879, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2879, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2879, 25] got `{"To confirm whether
#> mkp-1 is a direct target of miR-101, wegenerated luciferase reporter
#> constructs by cloning either the wildtypeor a mutated portion of the 39 UTR
#> of mkp-1 into the 39 UTRof a pGL-3M-Luc vector. The mutated 39 UTR of mkp-1
#> had threebases changed, from GUACUGUA to GGACGGGU, at the putativemiR-101
#> binding sites (Fig. 2D). We transfected these vectorswith miR-101 mimics
#> into 293 cells and analyzed the lysates48 h later. Transfection with
#> miR-101 mimics markedly inhibitedthe luciferase activity for the wild-
#> type 39 UTR of mkp-1 butshowed no repression effect for the mutated 39
#> UTR of mkp-1when compared with that for the control dsRNA (Fig. 2E),
#> suggestingthat miR-101 may repress MKP-1 expression by bindingto the 39 UTR
#> of mkp-1 in a direct and sequence-specific manner."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2880, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2880, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2880, 25] got `{"The relative luciferase
#> activity was diminishedin cells co-transfected with miR-126-pSuper and
#> VEGFAor PIK3R2-30 UTR-PGL3, and others remained unchanged(Fig. 4a). In
#> addition, co-transfection of ‚Äò‚Äòseed sequence‚Äô‚Äôbased mutation of
#> miR-126 binding site of pGL3-VEGFA-30 UTR(mut) restored the luciferase
#> activity (Fig. 4b)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2881, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2881, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2881, 25] got `{"The relative luciferase
#> activity was diminishedin cells co-transfected with miR-126-pSuper and
#> VEGFAor PIK3R2-30 UTR-PGL3, and others remained unchanged(Fig. 4a). In
#> addition, co-transfection of ‚Äò‚Äòseed sequence‚Äô‚Äôbased mutation of
#> miR-126 binding site of pGL3-VEGFA-30 UTR(mut) restored the luciferase
#> activity (Fig. 4b)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2883, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2883, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2883, 25] got `{In fact, the expression
#> of a luciferase reporter gene containing the DDX6 3‚Ä≤UTR was decreased
#> by miR-130a and -130b (Figure 3B, left), but a DDX6 3‚Ä≤UTR mutant at the
#> miR-130a- and -130b-binding site (Figure 3A) showed no change in luciferase
#> activity (Figure 3B, right). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2884, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2884, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2884, 25] got `{The wild type of mouse
#> Big-h3 mRNA 3'UTR carries a putative miR-21 binding site while the 429-431
#> mutated mouse Big-h3 3' UTR failed to bind miR-21 (Figure ‚Äã(Figure4.A).
#> 4.A). To validate the miRNA-target interactions, the wild type and the
#> 429-431 mutated Big-h3 complementary sites were cloned into the 3‚Ä≤UTR
#> of the firefly luciferase gene and co-transfected with miR-21 mimics or
#> negative control RNA (NC) in NIH3T3 cells. As shown in Figure ‚ÄãFigure4B,
#> 4B, miR-21 significantly reduced the luciferase activity of the wild type
#> Big-h3 3'UTR with respect to the negative control. The miR-21 mimics at
#> a final concentration of 50 nM and 100 nM both reduced the luciferase
#> activity, but there were no significant difference between the two groups
#> (Data not shown). Therefore, miRNA at a final concentration of 50 nM was
#> transfected into cells in the following experiment. However, miR-21 has no
#> effect on the luciferase activity of the 429-431 mu [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2885, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2885, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2885, 25] got `{The luciferase reporter
#> assay indicated that the activity of the reporter containing the 3‚Ä≤-
#> UTR of the RB1 gene was decreased following treatment with miR-192 mimics,
#> whereas the reporters containing the 3‚Ä≤-UTRs of the other genes were
#> not obviously altered (Figure 3A). We performed site-directed mutagenesis
#> of the reporter containing the 3‚Ä≤-UTR of the RB1 gene as described in
#> Figure 3B and the luciferase reporter assay was performed with the mutated
#> construct. The results demonstrate that the inhibitory effect of miR-192
#> mimics was abolished in the mutant reporter (Figure 3B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2886, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2886, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2886, 25] got `{To show a direct
#> interaction between miR-622 and the 3‚ÄôUTR of ING1, we cloned the 3‚ÄôUTR
#> region that is predicted to interact with miR-622 into a luciferase
#> reporter vector. We then assessed luciferase activity by co-transfection
#> the luciferase reporter vector bearing the 3‚ÄôUTR of ING1 with the miR-622
#> precursor or the miR-622 inhibitor or with control plasmids. Luciferase
#> activity was markedly diminished in the cells transfected with the miR-622
#> precursor and wild-type 3‚ÄôUTR reporter plasmid, compared with the cells
#> transfected with the miR-622 precursor and mutant 3‚ÄôUTR reporter plasmids
#> (Figure ‚Äã(Figure4C,4C, P < 0.05). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2887, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2887, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2887, 25] got `{Furthermore, luciferase
#> reporter assays were performed to validate specificity of the miR-196a
#> regulation of NOBOX through the predicted miR-196a recognition sequence in
#> the 3' UTR of NOBOX. NOBOX 3' UTR sequence was inserted downstream of the
#> firefly luciferase coding region. Mutations in the predicted MRE in the 3'
#> UTR of the NOBOX for miR-196a were created such that interaction between
#> miR-196a and NOBOX is compromised (Figure ‚Äã(Figure4A).4A). Ectopic
#> expression of miR-196a by transfection of miR-196a duplex into the HeLa
#> cells suppressed activity of a chimeric luciferase construct containing the
#> miR-196a MRE of NOBOX at its 3' end (Figure ‚Äã(Figure4B).4B). Luciferase
#> activity was restored when a four-base mismatch mutation was introduced
#> into the seed region of the miRNA-196a recognition sequence in the NOBOX 3'
#> UTR (Figure ‚Äã(Figure4B).4B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2888, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2888, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2888, 25] got `{ To determine whether
#> miR-148a could directly regulate p27, p27 mRNA 3'UTR encompassing the
#> predicted binding site with or without mutation that would disrupt miRNA
#> interaction (underlined in Fig. ‚ÄãFig.3A),3A), were inserted to the
#> downstream of luciferase open reading frame in pGL3-CM reporter vector.
#> When introduced into SGC-7901 cells, the wild type p27 3'UTR reporter
#> showed a 39reduction in luciferase activity in the miR-148a-transfected
#> cells compared with that in scrambled-miRNA-transfected cells (Fig.
#> ‚Äã(Fig.3B,3B, p<0.01). Mutation of miR-148a binding site abrogated the
#> repression of luciferase activity caused by miR-148a overexpression (Fig.
#> ‚Äã(Fig.3B).3B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2903, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2903, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2903, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2904, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2904, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2904, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2905, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2905, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2905, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2906, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2906, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2906, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2907, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2907, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2907, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2908, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2908, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2908, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2909, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2909, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2909, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2910, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2910, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2910, 25] got `{A one-tailed Student's
#> t test identified five miRNAs which significantly reduced expression of
#> firefly luciferase by targeting the mouse Mct1 3‚Ä≤ UTR (Fig. 3A). Four
#> of these also significantly targeted the human MCT1 3‚Ä≤ UTR (Fig. 3B).
#> miR-124 exerted the largest effect, decreasing luciferase expression by at
#> least 50 229954616n assays of both mouse and human sequences (P < 0.00001).
#> miR-29a reduced expression by ‚â•33(P < 0.01), and miR-29b reduced
#> expression by ‚â•27(P < 0.01) in both cases. A smaller effect was produced
#> by miR-29c which reduced expression by ‚â•7(P < 0.05). Transfection with
#> miR-7 produced a small but nonsignificant decrease in luciferase activity
#> for both human and mouse Mct1 sequences. Thus, 4 out of the 10 miRNAs
#> tested significantly target both human and mouse Mct1 3‚Ä≤ UTRs: miR-124
#> and the three isoforms of miR-29. Of these, miR-29a, miR-29b, and miR-124
#> were capable of reducing expression [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2911, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2911, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2911, 25] got `{ To detect whether the
#> regulation of INHBB was direct, we fused the 3‚Ä≤-UTR region of INHBB to
#> a luciferase system. As shown in Figure 3C,D, miR-34a remarkably repressed
#> the expression of luciferase containing an original miR-34a binding site
#> (INHBB-UTR) but not a mutant binding site (INHBB-Mu-UTR). And mutations in
#> seed complementary sites of the 3‚Ä≤-UTR region of INHBB could restore the
#> luciferase expression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2912, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2912, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2912, 25] got `{The results showed that
#> compared with the negative control, the luciferase activity of miR-29a
#> and miR-29b groups decreased by approximately 70 0x0p+0nd 60(Fig. 5C).
#> Furthermore, the decrease of luciferase activity was rescued by introducing
#> mutations at the seed site in pGl3-Col2a1M (Fig. 5C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2913, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2913, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2913, 25] got `{The results showed that
#> compared with the negative control, the luciferase activity of miR-29a
#> and miR-29b groups decreased by approximately 70 0x0p+0nd 60(Fig. 5C).
#> Furthermore, the decrease of luciferase activity was rescued by introducing
#> mutations at the seed site in pGl3-Col2a1M (Fig. 5C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2915, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2915, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2915, 25] got `{To test whether miR-1
#> is capable of directly repressing Cdc42 via this site, the Cdc42 3‚Ä≤-UTR
#> was inserted into the 3‚Ä≤-UTR of a luciferase reporter, downstream of the
#> coding region. Transfection of the Cdc42 3‚Ä≤-UTR luciferase reporter with
#> miR-1 mimic into HL-1 cells results in a decrease in luciferase activity,
#> whereas cotransfection with miR-1 inhibitor increases luciferase activity
#> (Fig. 5 G). A gradient of miR-1 was used to confirm the luciferase activity
#> was dose responsive (Fig. S4 A). Mutations of the miR-1 binding site in the
#> Cdc42 3‚Ä≤-UTR abolished miR-1 responsiveness (Fig. 5 G), suggesting that
#> miR-1 represses Cdc42 by physically binding to its 3‚Ä≤-UTR.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2916, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2916, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2916, 25] got `{Function of predicted
#> miRNA responsive elements (MREs) was tested by luciferase assays on
#> constructs containing either the full-length 3‚Ä≤UTR or the 3‚Ä≤-end of
#> SV2A 3‚Ä≤UTR. Overexpression of a miR-485 mimic (miR-M; a small chemically
#> modified dsRNA designed to mimic the endogenous miRNA) significantly
#> reduced luciferase activity of both constructs (n = 6; P < 0.001) (Fig.
#> 2A), and this was reversed when both MREs were mutated within the 5‚Ä≤-seed
#> region (Fig. S2B)}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2918, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2918, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2918, 25] got `{We generated sensors
#> containing chicken Pax3 3‚Ä≤-UTR fragments downstream of firefly
#> luciferase. Pax3 target sites were tested independently (TS1 or TS2) and
#> in a sensor containing both sites (TS1 + TS2). Dual-luciferase assays
#> showed that miR-1 and miR-206 directly target the Pax3 3‚Ä≤-UTR through
#> both predicted target sites (Fig. 2B). TS1 was strongly down-regulated by
#> miR-206, less so by miR-1, whereas TS2 was equally well regulated by both
#> miR-1 and miR-206. Sensors containing both sites also were strongly down-
#> regulated by both miRNAs, with miR-1 benefiting more from the presence of
#> two sites. An unrelated miRNA not predicted to target Pax3, miR-140, had no
#> effect on Pax3 sensors (Fig. 2B). Finally, mutant sensors containing point
#> mutations within putative target sites (TS1m and TS2m) demonstrated that
#> the sites were required for miRNA-mediated repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2919, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2919, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2919, 25] got `{We generated sensors
#> containing chicken Pax3 3‚Ä≤-UTR fragments downstream of firefly
#> luciferase. Pax3 target sites were tested independently (TS1 or TS2) and
#> in a sensor containing both sites (TS1 + TS2). Dual-luciferase assays
#> showed that miR-1 and miR-206 directly target the Pax3 3‚Ä≤-UTR through
#> both predicted target sites (Fig. 2B). TS1 was strongly down-regulated by
#> miR-206, less so by miR-1, whereas TS2 was equally well regulated by both
#> miR-1 and miR-206. Sensors containing both sites also were strongly down-
#> regulated by both miRNAs, with miR-1 benefiting more from the presence of
#> two sites. An unrelated miRNA not predicted to target Pax3, miR-140, had no
#> effect on Pax3 sensors (Fig. 2B). Finally, mutant sensors containing point
#> mutations within putative target sites (TS1m and TS2m) demonstrated that
#> the sites were required for miRNA-mediated repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2920, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2920, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2920, 25] got `{We generated sensors
#> containing chicken Pax3 3‚Ä≤-UTR fragments downstream of firefly
#> luciferase. Pax3 target sites were tested independently (TS1 or TS2) and
#> in a sensor containing both sites (TS1 + TS2). Dual-luciferase assays
#> showed that miR-1 and miR-206 directly target the Pax3 3‚Ä≤-UTR through
#> both predicted target sites (Fig. 2B). TS1 was strongly down-regulated by
#> miR-206, less so by miR-1, whereas TS2 was equally well regulated by both
#> miR-1 and miR-206. Sensors containing both sites also were strongly down-
#> regulated by both miRNAs, with miR-1 benefiting more from the presence of
#> two sites. An unrelated miRNA not predicted to target Pax3, miR-140, had no
#> effect on Pax3 sensors (Fig. 2B). Finally, mutant sensors containing point
#> mutations within putative target sites (TS1m and TS2m) demonstrated that
#> the sites were required for miRNA-mediated repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2921, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2921, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2921, 25] got `{We generated sensors
#> containing chicken Pax3 3‚Ä≤-UTR fragments downstream of firefly
#> luciferase. Pax3 target sites were tested independently (TS1 or TS2) and
#> in a sensor containing both sites (TS1 + TS2). Dual-luciferase assays
#> showed that miR-1 and miR-206 directly target the Pax3 3‚Ä≤-UTR through
#> both predicted target sites (Fig. 2B). TS1 was strongly down-regulated by
#> miR-206, less so by miR-1, whereas TS2 was equally well regulated by both
#> miR-1 and miR-206. Sensors containing both sites also were strongly down-
#> regulated by both miRNAs, with miR-1 benefiting more from the presence of
#> two sites. An unrelated miRNA not predicted to target Pax3, miR-140, had no
#> effect on Pax3 sensors (Fig. 2B). Finally, mutant sensors containing point
#> mutations within putative target sites (TS1m and TS2m) demonstrated that
#> the sites were required for miRNA-mediated repression.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2922, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2922, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2922, 25] got `{The luciferase activity
#> in COS7 cells was significantly reduced (by 34 to 57) when the reporter
#> was cotransfected with increasing amount of plasmids expressing wild-type
#> miR-146a. Such reduction is specific since a control plasmid expressing
#> seed region-mutated miR-146a (Ctrl) has little effect on reporter activity.
#> Moreover, wild-type miR-146a did not change the activity of a luciferase
#> reporter when the binding site for miR-146a in 3‚Ä≤UTR of Notch1 was
#> mutated (Fig. 5B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2924, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2924, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2924, 25] got `{Mutation assays were
#> performed as indicated (Fig. 2E and F). In contrast to the negative
#> control, the luciferase activity of the wild-type group decreased
#> significantly (P < 0.01) in the presence of a miR-15a mimic, whereas the
#> mutagenised groups restored luciferase activity to varying degrees. }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2925, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2925, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2925, 25] got `{"To test the effect
#> of miR-19b on the NeuroD1 expression, a fragment of NeuroD1 3‚Ä≤ UTR
#> containing the three putative target sites was cloned into the downstream
#> of the firefly luciferase stop codon of pGL3 control expression vector.
#> After the recombinant vector was co-transfected with synthetic miR-19b
#> into 3T3 cells, the luciferase activity was significantly inhibited than
#> that co-transfected with the control miRNA (Fig. 2C).Then we mutated the
#> targeting sites of NeuroD1 3‚Ä≤ UTR in the pGL3-control vector (Fig. 2B).
#> Mutational analysis showed that the first and second site in the fragment
#> were important in mediating the inhibition of miR-19b (Fig. 2C). When the
#> first site was mutated, luciferase activity was less efficiently repressed
#> by miR-19b than that in the wild-type construct. This result indicates that
#> the first site is functional. In addition, the mutation of the second site
#> also modified miR-19b-induced repression of lucifera [... truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2927, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2927, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2927, 25] got `{"As shown in Figure 3C,
#> using luciferaseassay, we validated cdc25A and CCNE1 as direct target genes
#> ofmiR-503. Significant inhibition of the luciferase activity wasobserved
#> in cells transfected with the constructs bearing an intactmiR-503 binding
#> site when compared with pLUC. Mutation ofcdc25A target sequence prevented
#> downregulation of luciferaseactivity by miR-503. For CCNE1, mutation of
#> each conservedtarget sequence had only a partial effect, and mutation of
#> bothsequences fully rescued CCNE1 repression (Figure 3C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2928, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2928, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2928, 25] got `{"As shown in Figure 3C,
#> using luciferaseassay, we validated cdc25A and CCNE1 as direct target genes
#> ofmiR-503. Significant inhibition of the luciferase activity wasobserved
#> in cells transfected with the constructs bearing an intactmiR-503 binding
#> site when compared with pLUC. Mutation ofcdc25A target sequence prevented
#> downregulation of luciferaseactivity by miR-503. For CCNE1, mutation of
#> each conservedtarget sequence had only a partial effect, and mutation of
#> bothsequences fully rescued CCNE1 repression (Figure 3C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2929, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2929, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2929, 25] got `{"As shown in Figure 3C,
#> using luciferaseassay, we validated cdc25A and CCNE1 as direct target genes
#> ofmiR-503. Significant inhibition of the luciferase activity wasobserved
#> in cells transfected with the constructs bearing an intactmiR-503 binding
#> site when compared with pLUC. Mutation ofcdc25A target sequence prevented
#> downregulation of luciferaseactivity by miR-503. For CCNE1, mutation of
#> each conservedtarget sequence had only a partial effect, and mutation of
#> bothsequences fully rescued CCNE1 repression (Figure 3C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2934, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2934, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2934, 25] got `{"Both xhairy1 30UTR
#> (xHairy1-WT)and mHes1 30UTR were significantly repressed by syntheticmiR-9
#> precursors, whereas this effect was absent when a mutantreporter lacking
#> the seed-complementary sequence (xHairy1_Mut) was used."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2935, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2935, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2935, 25] got `{As shown in Fig. 7B,
#> the transfection of TNF-Œ± 3'UTR-wt together with miR-19a AS, but not with
#> miR-19a SC, led to an increase in luciferase activity in EC9706 cells,
#> due to the inhibition of the endogenous miR-19a. In contrast, miR-19a
#> AS did not increase the luciferase activity of TNF-Œ± 3'UTR-mut, thus
#> demonstrating that the deletion of the miR-19a binding site in the TNF-
#> Œ± 3'UTR abolished the inhibitory effect of miR-19a in regulating its
#> expression (Fig. 6B).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2936, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2936, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2936, 25] got `{"In the presence of
#> miR-33mimic, the wild type, but not the mutated, reporteractivity was
#> significantly lowered as compared to thecontrol reporter activity (Fig.
#> 4B). Further, miR-33mimic repressed the reporter activity in a dose-
#> dependentmanner (Fig. 4C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2945, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2945, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2945, 25] got `{"To demonstratedirect
#> regulation by miR-125b, luciferase reporter containingwild-type Stat3 3 UTR
#> sequences or their mutant-derivateswith deletion of the putative miR-125b-
#> binding sites weretransfected into NIH3T3 cells stably over-expressing
#> miR-125b(NIH3T3/miR-125b; Figure 4B and supplemental Figure 3A).As shown
#> in Figure 4C, miR-125b represses luciferase activityby approximately 40
#> 229954616epending on the presence of miR-125bbinding in the Stat3 3 UTR.
#> Finally,"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2946, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2946, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2946, 25] got `{"To demonstratedirect
#> regulation by miR-125b, luciferase reporter containingwild-type Stat3 3 UTR
#> sequences or their mutant-derivateswith deletion of the putative miR-125b-
#> binding sites weretransfected into NIH3T3 cells stably over-expressing
#> miR-125b(NIH3T3/miR-125b; Figure 4B and supplemental Figure 3A).As shown
#> in Figure 4C, miR-125b represses luciferase activityby approximately 40
#> 229954616epending on the presence of miR-125bbinding in the Stat3 3 UTR.
#> Finally,"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2950, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2950, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2950, 25] got `{"The complete 3 UTRs of
#> mouse and human c-Fos mRNA wereinserted into reporter vectors downstream
#> of the Renilla luciferasegene. As controls we used vectors in which the
#> seed regions of the2 predicted miR155-binding sites within the c-Fos 3
#> UTRs weremutated. These constructs were transfected into 293T cells with
#> orwithout the corresponding human or mouse miR155 precursors.Cotransfection
#> of the nonmutated construct with the miR155precursors resulted in a
#> significant reduction in luciferase activity(Figure 3D). In contrast, no
#> reduction was observed when themutated constructs were cotransfected with
#> the miR155 precursors.These results confirmed that the predicted miR155-
#> binding sites inthe 3 UTR of c-Fos mRNAwere indeed targeted directly by
#> miR155."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2951, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2951, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2951, 25] got `{"The complete 3 UTRs of
#> mouse and human c-Fos mRNA wereinserted into reporter vectors downstream
#> of the Renilla luciferasegene. As controls we used vectors in which the
#> seed regions of the2 predicted miR155-binding sites within the c-Fos 3
#> UTRs weremutated. These constructs were transfected into 293T cells with
#> orwithout the corresponding human or mouse miR155 precursors.Cotransfection
#> of the nonmutated construct with the miR155precursors resulted in a
#> significant reduction in luciferase activity(Figure 3D). In contrast, no
#> reduction was observed when themutated constructs were cotransfected with
#> the miR155 precursors.These results confirmed that the predicted miR155-
#> binding sites inthe 3 UTR of c-Fos mRNAwere indeed targeted directly by
#> miR155."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2952, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2952, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2952, 25] got `{"The complete 3 UTRs of
#> mouse and human c-Fos mRNA wereinserted into reporter vectors downstream
#> of the Renilla luciferasegene. As controls we used vectors in which the
#> seed regions of the2 predicted miR155-binding sites within the c-Fos 3
#> UTRs weremutated. These constructs were transfected into 293T cells with
#> orwithout the corresponding human or mouse miR155 precursors.Cotransfection
#> of the nonmutated construct with the miR155precursors resulted in a
#> significant reduction in luciferase activity(Figure 3D). In contrast, no
#> reduction was observed when themutated constructs were cotransfected with
#> the miR155 precursors.These results confirmed that the predicted miR155-
#> binding sites inthe 3 UTR of c-Fos mRNAwere indeed targeted directly by
#> miR155."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2953, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2953, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2953, 25] got `{"The complete 3 UTRs of
#> mouse and human c-Fos mRNA wereinserted into reporter vectors downstream
#> of the Renilla luciferasegene. As controls we used vectors in which the
#> seed regions of the2 predicted miR155-binding sites within the c-Fos 3
#> UTRs weremutated. These constructs were transfected into 293T cells with
#> orwithout the corresponding human or mouse miR155 precursors.Cotransfection
#> of the nonmutated construct with the miR155precursors resulted in a
#> significant reduction in luciferase activity(Figure 3D). In contrast, no
#> reduction was observed when themutated constructs were cotransfected with
#> the miR155 precursors.These results confirmed that the predicted miR155-
#> binding sites inthe 3 UTR of c-Fos mRNAwere indeed targeted directly by
#> miR155."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2954, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2954, 23] got `{GFP-Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2954, 25] got `{"The expression level
#> of GFP in GFPRhoAmRNA-injected embryos was decreased when co-injected
#> withmiR-133b compared to those without added miR-133b (Fig. 4B).However,
#> GFP expression levels from either control GFP mRNA- orfrom GFP-mtRhoA mRNA-
#> injected embryos were not suppressed byexogenous miR-133b. Inhibition
#> of the GFP signal only in thepresence of the RhoA RE demonstrates the
#> sequence-specific targetingof RhoA mRNA by miR-133b."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2955, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2955, 23] got `{GFP-Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2955, 25] got `{"The expression level
#> of GFP in GFPRhoAmRNA-injected embryos was decreased when co-injected
#> withmiR-133b compared to those without added miR-133b (Fig. 4B).However,
#> GFP expression levels from either control GFP mRNA- orfrom GFP-mtRhoA mRNA-
#> injected embryos were not suppressed byexogenous miR-133b. Inhibition
#> of the GFP signal only in thepresence of the RhoA RE demonstrates the
#> sequence-specific targetingof RhoA mRNA by miR-133b."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2958, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2958, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2958, 25] got `{"To ensure the
#> specificity of this interaction,three mutants of the Fbxw7 mRNA in 30-
#> UTR(named Mut-1, Mut-2 or Mut-1√æMut-2) were constructedthat contained a 4-
#> nt change in seed region ofthe target sequence (Figure 6a). As we expected,
#> mutatedboth miR-27a-binding sites (Mut-1√æMut-2) at the 30-UTR of Fbxw7
#> mRNA completely abrogated the effectson inhibition of luciferase activity
#> (Figure 6b). Notably,each of the miR-27a-binding sites tested in the 30-
#> UTR ofFbxw7 mRNA appeared to be effective, as demonstratedby a decreased
#> in luciferase activity of 30 229954616n Mut-1 and40 120416n Mut-2. These
#> observations indicate that Fbxw7is also an important target of miR-27a."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2959, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2959, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2959, 25] got `{"To ensure the
#> specificity of this interaction,three mutants of the Fbxw7 mRNA in 30-
#> UTR(named Mut-1, Mut-2 or Mut-1√æMut-2) were constructedthat contained a 4-
#> nt change in seed region ofthe target sequence (Figure 6a). As we expected,
#> mutatedboth miR-27a-binding sites (Mut-1√æMut-2) at the 30-UTR of Fbxw7
#> mRNA completely abrogated the effectson inhibition of luciferase activity
#> (Figure 6b). Notably,each of the miR-27a-binding sites tested in the 30-
#> UTR ofFbxw7 mRNA appeared to be effective, as demonstratedby a decreased
#> in luciferase activity of 30 229954616n Mut-1 and40 119648n Mut-2. These
#> observations indicate that Fbxw7is also an important target of miR-27a."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2960, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2960, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2960, 25] got `{"Next, to further
#> confirm the specificity of the regulation of IL-63 UTR by miR-142-3p, we
#> first knocked-down endogenous miR-142-3p or miR-223 as a control with LNA-
#> knockdown probes. ThemiR-142-3p and miR-223 were efficiently knocked down
#> (supplementalFigure 3A-B). The suppression of miR-142-3p but notmiR-223
#> increased the ratio by 2-fold, P .01 (Figure 2F)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2961, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2961, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2961, 25] got `{"To further examine
#> whether miR-9 and miR-181b targetNRP1 directly, the luciferase reporter
#> containing the NRP1 30-UTR fragment with the miR-9 or miR-181b binding
#> sites wastransfected into EA.hy926 cells. When miR-9 or miR-181b
#> werecotransfected with the NRP1 reporter constructs, luciferaseactivity
#> was significantly suppressed compared withcotransfection with positive and
#> negative controls of pre-miRmiRNA precursors (Fig. 3A). However, when miR-9
#> or miR-181b were cotransfected with the deleted seed sequence of the30-
#> UTR, the luciferase activity suppression was completelyabolished. Taken
#> together, these results suggest that miR-9 andmiR-181b suppressed NRP1
#> through a specific 30-UTR bindingsite."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2962, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2962, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2962, 25] got `{"To further examine
#> whether miR-9 and miR-181b targetNRP1 directly, the luciferase reporter
#> containing the NRP1 30-UTR fragment with the miR-9 or miR-181b binding
#> sites wastransfected into EA.hy926 cells. When miR-9 or miR-181b
#> werecotransfected with the NRP1 reporter constructs, luciferaseactivity
#> was significantly suppressed compared withcotransfection with positive and
#> negative controls of pre-miRmiRNA precursors (Fig. 3A). However, when miR-9
#> or miR-181b were cotransfected with the deleted seed sequence of the30-
#> UTR, the luciferase activity suppression was completelyabolished. Taken
#> together, these results suggest that miR-9 andmiR-181b suppressed NRP1
#> through a specific 30-UTR bindingsite."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2965, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2965, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2965, 25] got `{"To test whether the BD
#> sequencecould mediate the miR-140‚ÄìDnpep interaction, a luciferasereporter
#> plasmid carrying the BD sequence was constructed.Cotransfection
#> with a miR-140 miRNA precursor reduced theluciferase activity of the
#> reporter construct with the BD but nota mutated BD sequence, suggesting
#> that miR-140 suppressesDnpep expression by binding to BD (Fig. 7C).
#> Furthermore,transfection of the miR-140 precursor into chondrogenicATDC5
#> cells reduced Dnpep expression (Fig. 7D)"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2966, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2966, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2966, 25] got `{"To test whether the BD
#> sequencecould mediate the miR-140‚ÄìDnpep interaction, a luciferasereporter
#> plasmid carrying the BD sequence was constructed.Cotransfection
#> with a miR-140 miRNA precursor reduced theluciferase activity of the
#> reporter construct with the BD but nota mutated BD sequence, suggesting
#> that miR-140 suppressesDnpep expression by binding to BD (Fig. 7C).
#> Furthermore,transfection of the miR-140 precursor into chondrogenicATDC5
#> cells reduced Dnpep expression (Fig. 7D)"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2967, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2967, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2967, 25] got `{"To test whether the BD
#> sequencecould mediate the miR-140‚ÄìDnpep interaction, a luciferasereporter
#> plasmid carrying the BD sequence was constructed.Cotransfection
#> with a miR-140 miRNA precursor reduced theluciferase activity of the
#> reporter construct with the BD but nota mutated BD sequence, suggesting
#> that miR-140 suppressesDnpep expression by binding to BD (Fig. 7C).
#> Furthermore,transfection of the miR-140 precursor into chondrogenicATDC5
#> cells reduced Dnpep expression (Fig. 7D)"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2969, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2969, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2969, 25] got `{"To determine whether
#> the altered expression of EPB41L3 in metastatic cells is, in part,
#> mediatedthrough its 3‚Äô UTR, we cloned the 3‚Äô UTRs of EPB41L3 downstream
#> of a luciferase gene as areporter, and assayed EPB41L3 expression in
#> NUGC-3 cells (low miR-223) and XGC-9811L cells(high miR-223). Transient
#> transfection of NUGC-3 cells, with a low endogenous miR-223 expression,with
#> the EPB41L3-3‚Äô-UTR-reporter construct and miR-223, led to a significant
#> decrease of reporteractivity as compared to the control (Fig.4B). However,
#> the activity of the reporter construct mutatedat the specific miR-223
#> target site at nt 89-95 was unaffected by a simultaneous transfection
#> withmiR-223 (Fig.4B)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2970, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2970, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2970, 25] got `{"Conversely,antagonism
#> of miR-296-5p by LNA transfection increasedluciferase activity ( Fig.
#> 3A ). As a control, modulation ofmiR-296 levels using the miR-296
#> expression vector or theLNA for miR-296-5p did not signifi cantly modify
#> luciferaseactivity when Huh-7 cells were transfected with pMIRempty vector
#> ( Fig. 3A ). Functional derepression of luciferaseactivity was observed
#> when critical residues of oneor both miR-296-5p binding sites within PUMA
#> 3 ‚Ä≤ UTR(BS1 and BS2) were mutated (pMIR- PUMA -BS1/BS2mut)( Figs. 1 and
#> 3B ). These results indicate that miR-296-5pfunctionally binds to both PUMA
#> 3 ‚Ä≤ UTR binding sites."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2971, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2971, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2971, 25] got `{"Conversely,antagonism
#> of miR-296-5p by LNA transfection increasedluciferase activity ( Fig.
#> 3A ). As a control, modulation ofmiR-296 levels using the miR-296
#> expression vector or theLNA for miR-296-5p did not signifi cantly modify
#> luciferaseactivity when Huh-7 cells were transfected with pMIRempty vector
#> ( Fig. 3A ). Functional derepression of luciferaseactivity was observed
#> when critical residues of oneor both miR-296-5p binding sites within PUMA
#> 3 ‚Ä≤ UTR(BS1 and BS2) were mutated (pMIR- PUMA -BS1/BS2mut)( Figs. 1 and
#> 3B ). These results indicate that miR-296-5pfunctionally binds to both PUMA
#> 3 ‚Ä≤ UTR binding sites."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2973, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2973, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2973, 25] got `{"Measurements of
#> luciferase activity inHEK 293 cells transfected with reporter plasmids
#> containing the39UTRs of mCav1or hCAV1 showed reduced expression of
#> theseconstructs in the presence of miR-103 (Fig. 4c). By mutating the
#> conservedseed, we could fully reverse the miR-103-induced decrease
#> inluciferase activity in both mCav1 and hCAV1 constructs (Fig. 4c)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2974, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2974, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2974, 25] got `{"Measurements of
#> luciferase activity inHEK 293 cells transfected with reporter plasmids
#> containing the39UTRs of mCav1or hCAV1 showed reduced expression of
#> theseconstructs in the presence of miR-103 (Fig. 4c). By mutating the
#> conservedseed, we could fully reverse the miR-103-induced decrease
#> inluciferase activity in both mCav1 and hCAV1 constructs (Fig. 4c)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2977, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2977, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2977, 25] got `{"To verify whether or
#> not ROCK2 and EZH2 are direct targets of miR-124, ROCK2 and EZH2 3‚Ä≤-
#> UTRs (figure 2A) and two mutants containing the miR-124 binding sites
#> were cloned downstream of the luciferase open reading frame. Thesereporter
#> constructs were used to cotransfect HCC LM9 and HepG2 cells. Increased
#> expression of miR-124 upon infection, significantly affected the luciferase
#> expression, measured by the luciferase activity. Conversely, when we
#> performedluciferase assays using a plasmid harbouring the 3‚Ä≤-UTR of ROCK2
#> and EZH2 mRNAs, in which the binding sites for miR-124 were inactivated by
#> site-directed mutant genesis, the luciferase activity of mutant reporters
#> were unaffected by thesimultaneous infection of miR-124 (figure 2B and
#> supplementary figure S1)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2978, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2978, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2978, 25] got `{"To verify whether or
#> not ROCK2 and EZH2 are direct targets of miR-124, ROCK2 and EZH2 3‚Ä≤-
#> UTRs (figure 2A) and two mutants containing the miR-124 binding sites
#> were cloned downstream of the luciferase open reading frame. Thesereporter
#> constructs were used to cotransfect HCC LM9 and HepG2 cells. Increased
#> expression of miR-124 upon infection, significantly affected the luciferase
#> expression, measured by the luciferase activity. Conversely, when we
#> performedluciferase assays using a plasmid harbouring the 3‚Ä≤-UTR of ROCK2
#> and EZH2 mRNAs, in which the binding sites for miR-124 were inactivated by
#> site-directed mutant genesis, the luciferase activity of mutant reporters
#> were unaffected by thesimultaneous infection of miR-124 (figure 2B and
#> supplementary figure S1)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2979, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2979, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2979, 25] got `{"However, co-
#> transfection with miR-200b or miR-15bmimics significantly reduced
#> the luciferase activity inCAL27-res cells (P¬º0.01 or Po0.001,
#> respectively,Figure 4a). However, when the miRNA targetingsequence was
#> mutated in the reporter plasmids, transfectionwith mimics of miR-200b or
#> miR-15b did notinfluence the relative luciferase activity (Figure 4a),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2980, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2980, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [2980, 25] got `{"However, co-
#> transfection with miR-200b or miR-15bmimics significantly reduced
#> the luciferase activity inCAL27-res cells (P¬º0.01 or Po0.001,
#> respectively,Figure 4a). However, when the miRNA targetingsequence was
#> mutated in the reporter plasmids, transfectionwith mimics of miR-200b or
#> miR-15b did notinfluence the relative luciferase activity (Figure 4a),"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2981, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2981, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2981, 25] got `{"To confirm that
#> Trp53inp1 is a direct target gene of miR-125b,the wild-type 30UTR of
#> Trp53inp1 or the mutated 30UTR wascloned to downstream of the Renilla
#> luciferase open readingframe (Figure 3a). We performed luciferase
#> assays and foundthat miR-125b directly represses the expression of the
#> reportergene with the Trp53inp1-30UTR but not that with mutated30UTR of
#> Trp53inp1 (Figure 3a)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2982, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2982, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2982, 25] got `{"Each construct
#> wasthen cotransfected with pre-miR-296-5p or a randomlygenerated negative
#> control Pre-miR into 293A or HeLacells. In addition, in HeLa cells,
#> each construct wascotransfected with anti-miR-296-5p. Cotransfection
#> of thepGL3-IKBKE-39UTR construct containing the potentialtarget site
#> and pre-miR-296-5p into either 293A or HeLacells resulted in decreased
#> luciferase production of thereporter construct compared with the randomly
#> generatednegative control (highly significant in 293A cells, P < 0.01)(Fig.
#> 3D,E)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2984, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2984, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2984, 25] got `{"To test whether or
#> not the regulation of miR-208 on p21is via a direct or indirect mechanism,
#> we constructedluciferase reporters with entire wild-type p21 30UTR(pGL3-
#> p21‚Äì30 UTR-wild-type) or a mutant p21 30UTRUTR (pGL3- p21‚Äì30 UTR-
#> mutant-type), which wereboth confirmed by sequencing and then co-
#> transfectedinto HEK293 cells with miR-208 mimics or mimicscontrol. We found
#> that neither the mimics control northe mutant p21 30UTR had any effect
#> on the luciferaseactivity in transfected HEK293 cells (Fig. 6a and b).
#> Incontrast, miR-208 mimics decreased luciferase activitytransfected with
#> pGL3-p21‚Äì30 UTR-wild-type (Fig. 6b)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2985, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2985, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2985, 25] got `{"We then transfected
#> cultured DCs witheach reporter construct, as well as let-7i mimic or
#> inhibitor. Luciferaseactivity was assessed at 24 h after transfection.
#> As shownin Fig. 5, the translational level of the luciferase reporter
#> wassignificantly decreased by let-7i mimic, but markedly increased bylet-7i
#> inhibitor. No changes in luciferase were observed in cellstransfected
#> with the mutant SOCS1 39-UTR construct whencombined with let-7i mimic or
#> inhibitor."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2986, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2986, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2986, 25] got `{"Figure 1 (Part B)
#> shows miR-133a inhibition of Col1A1 30-UTRluciferasereporter construct
#> signal. Cotransfection of miR-133a with the luciferase reporter gene
#> linked to the wild-type30-UTR of Col1A1 resulted in a significant decrease
#> of luciferaseactivity ( P<0.01). In contrast, no effect was observed
#> whenmiR-133a was cotransfected with a construct containingmutated 30-UTR
#> seed sequences."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2987, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2987, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2987, 25] got `{"Cotransfection
#> of miR-29b with theluciferase reporter gene linked to the wild-
#> type 30-UTR ofCol1A1 resulted in a significant decrease of luciferase
#> activity( P<0.01). In contrast, no effect was observed when miR-29bwas
#> cotransfected with a construct containing mutated 30-UTRseed sequences."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2988, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2988, 25] got `{"We amplified3 UTR
#> regions surrounding these miR-23 sites and placedthem each individually
#> downstream of an eGFP codingsequence for use in a GFP silencing assay.
#> We only observedstrong silencing of the GFP signal with miR-23 mimics
#> whenthe Has2, icat, and tmem2 3 UTR sequences were present(Figure 6B
#> through G, Online Figure V, and Online Table I).Silencing of these GFP-3
#> UTR mRNAs was miR-23‚Äìdependent,because no silencing was observed after
#> coinjectingmutated miR-23 mimics (Figure 6H through J) or after mutating2
#> nucleotides within the seed sequence of miR-23 target sites(Online Figure
#> V). Together, these data reveal that miR-23targets several transcripts
#> expressed in the embryonic heart."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2989, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2989, 23] got `{GFP silencing assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2989, 25] got `{"We amplified3 UTR
#> regions surrounding these miR-23 sites and placedthem each individually
#> downstream of an eGFP codingsequence for use in a GFP silencing assay.
#> We only observedstrong silencing of the GFP signal with miR-23 mimics
#> whenthe Has2, icat, and tmem2 3 UTR sequences were present(Figure 6B
#> through G, Online Figure V, and Online Table I).Silencing of these GFP-3
#> UTR mRNAs was miR-23‚Äìdependent,because no silencing was observed after
#> coinjectingmutated miR-23 mimics (Figure 6H through J) or after mutating2
#> nucleotides within the seed sequence of miR-23 target sites(Online Figure
#> V). Together, these data reveal that miR-23targets several transcripts
#> expressed in the embryonic heart."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2990, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2990, 23] got `{GFP silencing assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2990, 25] got `{"We amplified3 UTR
#> regions surrounding these miR-23 sites and placedthem each individually
#> downstream of an eGFP codingsequence for use in a GFP silencing assay.
#> We only observedstrong silencing of the GFP signal with miR-23 mimics
#> whenthe Has2, icat, and tmem2 3 UTR sequences were present(Figure 6B
#> through G, Online Figure V, and Online Table I).Silencing of these GFP-3
#> UTR mRNAs was miR-23‚Äìdependent,because no silencing was observed after
#> coinjectingmutated miR-23 mimics (Figure 6H through J) or after mutating2
#> nucleotides within the seed sequence of miR-23 target sites(Online Figure
#> V). Together, these data reveal that miR-23targets several transcripts
#> expressed in the embryonic heart."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2991, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2991, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2991, 25] got `{"We next conducted 3
#> UTR luciferase reporter assays todetermine whether miR-195 could directly
#> target Chek1 forrepression. A plasmid consisting of the Chek1 3 UTR
#> linkedto a constitutively active luciferase reporter was transfectedinto
#> COS cells along with increasing amounts of miR-195mimic. The Chek1 3
#> UTR luciferase reporter displayed adose-dependent repression in activity
#> by miR-195 (Figure4C). Mutation of the miR-195 target site abolished
#> repressionby miR-195, which demonstrates that this effect was dependenton
#> binding of miR-195 to its target site within the 3 UTRof Chek1 (Figure
#> 4C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2992, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2992, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2992, 25] got `{Firstly, we constructed
#> a reporter vector containing a consensus miR-145-binding site within the
#> 3‚Ä≤-UTR (pMIR-PT, Table 1) as a positive control. After we co-transfected
#> this reporter plasmid into HEK293 cells with pre-miR-145 or its control
#> pre-miR, we found that luciferase expression significantly decreased in the
#> HEK293 cells transfected with pre-miR-145 (Figure 2B).Co-transfection of
#> pre-miR-145 with wild-type pMIR-MRE resulted in a suppression of luciferase
#> gene expression, but co-transfection of pre-miR-145 and mutant pMIR-MUT did
#> not }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2995, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2995, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2995, 25] got `{To demonstrate that IRS1
#> is a direct target of miR-144, we constructed independent reporter vectors
#> that contained the different combinations of binding sites of miR-144
#> at the 3‚Ä≤UTR of IRS1 (Table S12) downstream of a firefly luciferase
#> reporter gene. These constructs were then co-transfected with anti- or
#> pre-miR-144 into HeLa cells. Cells transfected with pre-miR-144 exhibited
#> a significant reduction in the luciferase activity which was reduced
#> further when both miR-144 binding sites are present (Fig. 10). Likewise,
#> transfection with anti miR-144 showed an increasing pattern of luciferase
#> activity from constructs where only one binding site is present to that
#> where both binding sites are included (Fig. 10). Site-directed mutagenesis
#> of the miR-144 binding sites abolished interactions between miR-144 and
#> IRS1 accordingly. These findings indicate IRS1 forms a direct target of
#> miR-144.}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2997, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2997, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2997, 25] got `{The luciferase reporter
#> pGL3-Sp1-UTR, which harboured miR-140 binding sites, was repressed by the
#> co-transfection of pEGFP-Pri-miR-140 compared to the control in 293T cells
#> (Fig. 5D). Endogenous Sp1 protein expression was also suppressed by the
#> overexpression of miR-140, while its mRNA levels remained unchanged (Fig.
#> 5E and F). This suppression could be released by mutations in miR-140
#> binding sites in the Sp1 3‚Ä≤ UTR domain (Fig. 5G). In addition}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2998, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2998, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2998, 25] got `{The luciferase reporter
#> pGL3-Sp1-UTR, which harboured miR-140 binding sites, was repressed by the
#> co-transfection of pEGFP-Pri-miR-140 compared to the control in 293T cells
#> (Fig. 5D). Endogenous Sp1 protein expression was also suppressed by the
#> overexpression of miR-140, while its mRNA levels remained unchanged (Fig.
#> 5E and F). This suppression could be released by mutations in miR-140
#> binding sites in the Sp1 3‚Ä≤ UTR domain (Fig. 5G). In addition}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2999, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2999, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [2999, 25] got `{The three programs all
#> predicted that the binding sequence in 3‚Ä≤UTR of Osx was a very good match
#> for the miR-637 seed. To verify this prediction, the target sequence (nt
#> 387‚Äì713) of Osx 3‚Ä≤UTR (Wt) or the site-mutated sequence (Mu; the base
#> that is underlined in Figure 5A) was cloned into the luciferase reporter
#> vector pMIR (Figure 5A). Cos-7 cells were then cotransfected with WT
#> vector and miRNA mimics, and the results showed a significant decrease
#> in luciferase activity in miR-637‚Äìtransfected cells compared with NC
#> (Figure 5B; p <0.01). The activity of the Mu vector was unaffected by a
#> simultaneous transfection with miR-637 (Figure 5B). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3000, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3000, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3000, 25] got `{To further validate
#> this computational finding that miR-124a may negatively regulate JAG1, we
#> generated a luciferase construct harboring the 3‚Ä≤-UTR fragment of JAG1
#> containing a broadly conserved binding site of miR-124a (Luc-JAG1, Fig. 5D)
#> and a mutant luciferase construct with deletion of the binding site (Luc-
#> JAG1-mu, Fig. 5D). Luciferase assay showed that miR-124a significantly
#> repressed the luciferase activity in the 3T3 cell line transiently
#> transfected with Luc-JAG1, compared with cells transfected with Luc-JAG1-
#> mu (Fig. 5E), which is consistent with previous findings that JAG1 is a
#> putative target of miR-124a [14].}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3005, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3005, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3005, 25] got `{Short luciferase targets
#> corresponding to the strongest predicted miR-877 3‚Ä≤-UTR target sites for
#> each of these genes where generated and expressed alongside either mirt-
#> miR-877 or the pre-miR-877 control in HEK-293 cells. Normalization to non-
#> specific control constructs demonstrated that six of these targets were
#> silenced in response to mirt-miR-877 and pre-miR-877 despite highly similar
#> seed sequences across all targets (Figure 5A). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3039, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3039, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3039, 25] got `{"Dual-luciferase
#> reporter analysis showedthat coexpression of miR-29b significantly
#> inhibited theactivity of firefly luciferase that carried wildtype but
#> notmutant 30-UTR of MMP-2 (Fig. 3A,B), indicating thatmiR-29b may suppress
#> gene expression through itsbinding sequence at 30-UTR of MMP-2."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3040, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3040, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3040, 25] got `{"Weinvestigated
#> whether the 30-UTR of ZEB2 and BMI1 are functionaltargets of miR-708
#> in renal cancer. Transient transfectionof human A498 cancer cells with
#> the respective 30-UTR plasmidsalong with different concentrations of
#> miR-708 precursorled to a significant decrease in promoter activity when
#> comparedwith the control vector (Fig. 5B and C) suggesting thatmiR-708
#> directly represses these genes. The luciferase activityof the reporter
#> vectors containing a mutated 30-UTR of the respective genes was unaffected
#> by miR-708."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3041, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3041, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3041, 25] got `{"Weinvestigated
#> whether the 30-UTR of ZEB2 and BMI1 are functionaltargets of miR-708
#> in renal cancer. Transient transfectionof human A498 cancer cells with
#> the respective 30-UTR plasmidsalong with different concentrations of
#> miR-708 precursorled to a significant decrease in promoter activity when
#> comparedwith the control vector (Fig. 5B and C) suggesting thatmiR-708
#> directly represses these genes. The luciferase activityof the reporter
#> vectors containing a mutated 30-UTR of the respective genes was unaffected
#> by miR-708."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3045, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3045, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3045, 25] got `{"To identify the
#> miR-365 target region in the HDAC4mRNA, we mutated 3 nucleotides from
#> the putativeseed region in the HDAC4 3 -UTR (Supplemental Fig.S2C). While
#> transfection of miR-365 mimic suppressedthe luciferase activity of the
#> wild-type HDAC4 3 -UTRreporter, this suppression was abolished in the
#> mutatedHDAC4 3 -UTR reporter (Fig. 5E)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3046, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3046, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3046, 25] got `{"The CAMTA1 30-UTRwas
#> fused to firefly luciferase and co-transfected togetherwith inhibitors
#> against miR-9/9* (Figure 4B, panels 1 and 2),miR-106b (panel 3) or
#> miR-17-5p (panel 3) into primaryglioblastoma cells. In all cases, firefly
#> expression waselevated upon miRNA inhibition. Increased firefly activitywas
#> not observed, when reporters with mutated miR-9 ormiR-9* binding sites were
#> transfected."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3047, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3047, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3047, 25] got `{"The CAMTA1 30-UTRwas
#> fused to firefly luciferase and co-transfected togetherwith inhibitors
#> against miR-9/9* (Figure 4B, panels 1 and 2),miR-106b (panel 3) or
#> miR-17-5p (panel 3) into primaryglioblastoma cells. In all cases, firefly
#> expression waselevated upon miRNA inhibition. Increased firefly activitywas
#> not observed, when reporters with mutated miR-9 ormiR-9* binding sites were
#> transfected."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3048, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3048, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3048, 25] got `{"HEK 293T cells
#> transfected with miR-124a expression plasmids produced significant amounts
#> ofmiR-124a (P < 0.001; Supplementary Fig. 8a,b). The luciferase activity
#> of the native Lhx2 3‚Ä≤-UTR plasmid was significantly reduced by all
#> of the pre-miR-124a expression plasmids (P < 0.01; Fig. 5b). However,
#> luciferase activity of the mutated Lhx2 3‚Ä≤-UTR plasmid was not attenuated
#> by miR-124a (Fig. 5b), and the luciferase mRNA levels of both native and
#> mutated Lhx2 3‚Ä≤-UTR plasmids were not significantly reduced(P < 0.004;
#> Supplementary Fig. 8c,d)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3056, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3056, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3056, 25] got `{"To assess the
#> effects ofmiR-758 on the 3 UTR of human Abca1, we used luciferasereporter
#> constructs. miR-758 markedly repressed the activityof the Abca1 3 UTR
#> reporter construct (Figure 2C). Specificsite-directed mutations in site
#> 2, which is widely conservedamong several species, abolishes the miR-758
#> repression ofAbca1 3 -UTR activity, suggesting that this site is the
#> mostimportant in the posttranscriptional repression of Abca1 bymiR-758
#> (Figure 2D)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3057, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3057, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3057, 25] got `{"To assess the
#> effects ofmiR-758 on the 3 UTR of human Abca1, we used luciferasereporter
#> constructs. miR-758 markedly repressed the activityof the Abca1 3 UTR
#> reporter construct (Figure 2C). Specificsite-directed mutations in site
#> 2, which is widely conservedamong several species, abolishes the miR-758
#> repression ofAbca1 3 -UTR activity, suggesting that this site is the
#> mostimportant in the posttranscriptional repression of Abca1 bymiR-758
#> (Figure 2D)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3066, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3066, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3066, 25] got `{"Toassess miRNA binding
#> to the 3 UTR, we constructed luciferasereporters with the full-length pten
#> 3 UTR. The reporter was testedin NIH3T3 cell lines stably overexpressing
#> miR-19b, miR-19a, ormiR-17.We observed significant suppression of
#> luciferase productionby miR-19b, but not miR-17 or miR-19a (Figure 5B).
#> Inaddition, site-directed mutagenesis of the miR-19‚Äìbinding motifswithin
#> the 3 UTR of pten26 completely abolished this suppression(Figure 5B)"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3067, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3067, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3067, 25] got `{"Toassess miRNA binding
#> to the 3 UTR, we constructed luciferasereporters with the full-length pten
#> 3 UTR. The reporter was testedin NIH3T3 cell lines stably overexpressing
#> miR-19b, miR-19a, ormiR-17.We observed significant suppression of
#> luciferase productionby miR-19b, but not miR-17 or miR-19a (Figure 5B).
#> Inaddition, site-directed mutagenesis of the miR-19‚Äìbinding motifswithin
#> the 3 UTR of pten26 completely abolished this suppression(Figure 5B)"}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3071, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3071, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3071, 25] got `{"Luciferase activity
#> was measured after 24h of transfection (Figure 2B). Our data demonstrated
#> that relativeluciferase unit was decreased (.70) in wild-type 3# UTR
#> transfectedPC cells that were cotransfected with miR-150 mimic as
#> comparedwith that cotransfected with miR-NC. Furthermore, cellstransfected
#> with MUT 3# UTR were resistant to the suppressor activityof miR-150 (Figure
#> 2B). Thus, our data strongly suggest that miR-150 negatively regulates the
#> expression of MUC4 by directly targetingthe 3# UTR of MUC4 transcript."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3072, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3072, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3072, 25] got `{"pISO-TIMP3-
#> Luc plasmid harboring 3 -UTR of TIMP3 (12).Luciferase expression was
#> reduced significantly ( 50 0.000000ig.1D) when transfected with miR-221,
#> -222, or -181b whencompared with the negative control miRs (Fig. 1E).
#> Conversely,deletion or mutation of the miR seed sequencesblocked the
#> inhibitory effects of all three miRs, and luciferaseactivity was completely
#> recovered."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3073, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3073, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3073, 25] got `{"pISO-TIMP3-
#> Luc plasmid harboring 3 -UTR of TIMP3 (12).Luciferase expression was
#> reduced significantly ( 50 0.000000ig.1D) when transfected with miR-221,
#> -222, or -181b whencompared with the negative control miRs (Fig. 1E).
#> Conversely,deletion or mutation of the miR seed sequencesblocked the
#> inhibitory effects of all three miRs, and luciferaseactivity was completely
#> recovered."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3074, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3074, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3074, 25] got `{"pISO-TIMP3-
#> Luc plasmid harboring 3 -UTR of TIMP3 (12).Luciferase expression was
#> reduced significantly ( 50 0.000000ig.1D) when transfected with miR-221,
#> -222, or -181b whencompared with the negative control miRs (Fig. 1E).
#> Conversely,deletion or mutation of the miR seed sequencesblocked the
#> inhibitory effects of all three miRs, and luciferaseactivity was completely
#> recovered."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3075, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3075, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3075, 25] got `{"pISO-TIMP3-
#> Luc plasmid harboring 3 -UTR of TIMP3 (12).Luciferase expression was
#> reduced significantly ( 50 0.000000ig.1D) when transfected with miR-221,
#> -222, or -181b whencompared with the negative control miRs (Fig. 1E).
#> Conversely,deletion or mutation of the miR seed sequencesblocked the
#> inhibitory effects of all three miRs, and luciferaseactivity was completely
#> recovered."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3078, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3078, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3078, 25] got `{"Suppression by pre-
#> miR 206 was 50 0.000000or bothreporters harboring the first two miR-206
#> sites (1412‚Äì1889)and all three miR-206 sites (1412‚Äì2766) (p < 0.01)
#> (Fig. 3c).These 3¬¢UTR reporter assays suggested that the first twotarget
#> sites are required for regulation by miR-206 to occur.We next set out
#> to determine which of the first two miR-206 target sites are functional.
#> The two miR-206 seedsequences were individually mutated in the context
#> of the1412‚Äì1889 vector (MUT 1 and MUT 2). Neither of thesemutations
#> in isolation abrogated the repressive effect of miR-206 (Fig. 3d). We
#> thus created a construct that had bothtarget sites mutated (MUT 1&2) and
#> found that thiscompletely attenuated the repressive effects of miR-206(p
#> > 0.01) (Fig. 3e). Thus, the first two miR-206 sites arerequired for
#> regulation by miR-206. We noticed that the thirdmiR-206 target site also
#> had supplementary base-pairing withmiR-206, suggesting that this si [...
#> truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3079, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3079, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3079, 25] got `{"Suppression by pre-
#> miR 206 was 50 0.000000or bothreporters harboring the first two miR-206
#> sites (1412‚Äì1889)and all three miR-206 sites (1412‚Äì2766) (p < 0.01)
#> (Fig. 3c).These 3¬¢UTR reporter assays suggested that the first twotarget
#> sites are required for regulation by miR-206 to occur.We next set out
#> to determine which of the first two miR-206 target sites are functional.
#> The two miR-206 seedsequences were individually mutated in the context
#> of the1412‚Äì1889 vector (MUT 1 and MUT 2). Neither of thesemutations
#> in isolation abrogated the repressive effect of miR-206 (Fig. 3d). We
#> thus created a construct that had bothtarget sites mutated (MUT 1&2) and
#> found that thiscompletely attenuated the repressive effects of miR-206(p
#> > 0.01) (Fig. 3e). Thus, the first two miR-206 sites arerequired for
#> regulation by miR-206. We noticed that the thirdmiR-206 target site also
#> had supplementary base-pairing withmiR-206, suggesting that this si [...
#> truncated]
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3080, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3080, 23] got `{GFP-Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3080, 25] got `{"In contrast, injection
#> of miR-26b strongly repressed GFPexpression from the wild-type reporter,
#> but not fromreporters containing the antisense or point-mutated39 UTRs
#> (Fig. 1B,C; Supplemental Fig. S2)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3081, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3081, 23] got `{Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3081, 25] got `{"To further investigate
#> the interaction between miR-143 and the target site of miR-143 in the
#> coding region of PTN, we generated a PTN mutant with 2 bp mutations in
#> seed region of miR-143 binding site (PTN site-m) (Fig. 3A). The mutation
#> eliminated the repressive effect of miR-143 on PTN protein expression
#> (Figs. 4B and C). These results indicate that miR-143 may directly target
#> the coding region of PTN."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3083, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3083, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3083, 25] got `{we constructed a
#> plasmid with a luciferase transcript and the 3‚Ä≤ UTR of NT-3. MiR21
#> but not a scrambled microRNA suppressed luciferase activity (Fig. 3, CTL
#> mean 1 ¬± 0.04 SEM; miR21 mean 0.4 ¬± 0.05 SEM; scrambled miR mean 1.4 ¬
#> ± 0.3 SEM; Kruskal‚ÄìWallis Dunn's Multiple comparison P *** < 0.001). To
#> confirm direct suppression by miR21 on translation of the NT-3 3‚Ä≤ UTR
#> construct, we mutated the putative miR21-binding site in the NT-3 3‚Ä≤ UTR.
#> Suppression of luciferase activity by miR21 was lost with co-transfection
#> of the mutated NT-3 3‚Ä≤ UTR (Fig. 3, }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3084, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3084, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3084, 25] got `{The luciferase
#> activity of the ‚ÄòPerfect‚Äô A-clone was lower than the ‚ÄòScr‚Äô B-clone
#> (p<0.0001)(Fig. 6B). The B-construct had increased activity compared with
#> pGL4.13, which could be due to destruction of a negative regulatory signal
#> by the cloned insertion. Mutation of the miR-21 target site of Srebf1
#> led to an increased luciferase activity (Fig. 6B, ‚ÄòC‚Äô vs. ‚ÄòD‚Äô,
#> p<0.0001). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3085, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3085, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3085, 25] got `{" As expected, the
#> luciferase activity of wild-type 3‚Ä≤-UTR (pMIR-luc-sirt1-3‚Ä≤-UTR) was
#> dramatically inhibited by the introduction of miR-199a, but not by negative
#> control, while mutant of the binding site completely abolished the ability
#> of miR-199a to inhibit luciferase expression (Fig. 4C). These results
#> demonstrated that sirt1 is a potential target of miR-199a."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3088, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3088, 23] got `{GFP-Western blot}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3088, 25] got `{When tested using the
#> pEGFP-C3 and pGL3 dual luciferase reporter vectors containing a complete
#> wild-type IŒ∫BŒ± 3‚Ä≤-UTR, miR-30e* robustly inhibited the expression of
#> GFP, but not the GFP‚ÄìŒ≥-tubulin control, in glioma as well as 293FT cells
#> (Figure ‚Äã(Figure4C).4C). }`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3091, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3091, 25] got `{"We alsomisexpressed
#> our Macho-1 UTR sensor specifically in PNS tissueusing a gelsolin promoter,
#> to assay regulation by endogenous miR-124. Again, Macho-1 expression was
#> almost completely abolished(93.9 229954616ownregulation, PÔÄΩ2.9 10‚Äì37)
#> (Fig. 5C). To determine ifthis effect was mediated specifically by
#> miR-124, we repeated theassay using Macho-1 mutant 3 UTRs with scrambled
#> miR-124 seedsites (Fig. 5A). Mutating the seed sites restored target
#> expressionlevels to ~75211220f that of control embryos expressing a
#> neutral3 UTR reporter (Fig. 5C,D), showing that Macho-1 downregulationis
#> predominately regulated by miR-124."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3093, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3093, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3093, 25] got `{"The reporter
#> plasmids were cotransfectedwith miR-622 mimic or miR-622 inhibitor.
#> The wild-typereporter wt-K-Ras plasmids cotransfected with miR-622
#> mimic exhibitedinhibited luciferase activity compared with the vector
#> controlgroup or the NC mimic group, whereas plasmids cotransfected
#> withmiR-622 inhibitor exhibited increased luciferase activity comparedwith
#> the vector control group or NC inhibitor group. In contrast, theluciferase
#> activity was not affected by mutant type mt-K-Ras plasmidcotransfection
#> with miR-622 mimic and miR-622 inhibitor, potentiallybecause miR-622 was
#> unable to recognize the complete mutantbinding sites of K-Ras mRNA, thereby
#> disrupting the interactionbetween miR-622 and K-Ras (Figure 4F). These data
#> indicate thatK-Ras is targeted directly by miR-622."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3094, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3094, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3094, 25] got `{"The reporter
#> plasmids were cotransfectedwith miR-622 mimic or miR-622 inhibitor.
#> The wild-typereporter wt-K-Ras plasmids cotransfected with miR-622
#> mimic exhibitedinhibited luciferase activity compared with the vector
#> controlgroup or the NC mimic group, whereas plasmids cotransfected
#> withmiR-622 inhibitor exhibited increased luciferase activity comparedwith
#> the vector control group or NC inhibitor group. In contrast, theluciferase
#> activity was not affected by mutant type mt-K-Ras plasmidcotransfection
#> with miR-622 mimic and miR-622 inhibitor, potentiallybecause miR-622 was
#> unable to recognize the complete mutantbinding sites of K-Ras mRNA, thereby
#> disrupting the interactionbetween miR-622 and K-Ras (Figure 4F). These data
#> indicate thatK-Ras is targeted directly by miR-622."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3095, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3095, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3095, 25] got `{"The reporter
#> plasmids were cotransfectedwith miR-622 mimic or miR-622 inhibitor.
#> The wild-typereporter wt-K-Ras plasmids cotransfected with miR-622
#> mimic exhibitedinhibited luciferase activity compared with the vector
#> controlgroup or the NC mimic group, whereas plasmids cotransfected
#> withmiR-622 inhibitor exhibited increased luciferase activity comparedwith
#> the vector control group or NC inhibitor group. In contrast, theluciferase
#> activity was not affected by mutant type mt-K-Ras plasmidcotransfection
#> with miR-622 mimic and miR-622 inhibitor, potentiallybecause miR-622 was
#> unable to recognize the complete mutantbinding sites of K-Ras mRNA, thereby
#> disrupting the interactionbetween miR-622 and K-Ras (Figure 4F). These data
#> indicate thatK-Ras is targeted directly by miR-622."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3097, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3097, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3097, 25] got `{"Twenty-four and
#> 48 hours later,luciferase activity in BEAS-2B cells cotransfected with
#> pGL3‚Äì4E-BP1 vector and miR-125b was decreased by 808omparedwith control
#> miRNA (Figure 3C; see Figure E2). When themiR-125b binding site was
#> mutated in the 4E-BP1 39-UTR,luciferase activity was no longer inhibited by
#> miR-125b mimic(Figure 3C; see Figure E2)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3103, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3103, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types
#> = col_types, : Expecting numeric in [3103, 25] got `{"The vectorwas
#> cotransfected with miR-210 or control intoHEK293T cells, and the relative
#> luciferase activity wasdetermined. The results showed that when comparedto
#> the control, the relative luciferase activity was significantlydecreased
#> by miR-210, whereas the luciferaseactivity was not altered by the vector
#> containing themutant 30-UTR (Fig. 4C)."}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3104, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3104, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3104, 25] got `{MiR-469 (Fig. 4)
#> significantly decreased luciferase activity in the plasmid containing full-
#> length coding region (103/423 nt) along with 172 bp 3' non-coding region
#> (423/594 nt) of Prm2 (103/594 nt) (psiCHECK-2/Prm2). Similar inhibition was
#> noted in the construct of 3' deletion from nt 386 (103/386 nt) (psiCHECK-2/
#> Prm2-a) when compared to the negative control group with scrambled RNA.
#> However, miR-469 did not have any effect on the plasmid containing isolated
#> fragment from 365-594 nt (psiCHECK-2/Prm2-b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3105, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3105, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3105, 25] got `{MiR-469 (Fig. 4)
#> significantly decreased luciferase activity in the plasmid containing full-
#> length coding region (103/423 nt) along with 172 bp 3' non-coding region
#> (423/594 nt) of Prm2 (103/594 nt) (psiCHECK-2/Prm2). Similar inhibition was
#> noted in the construct of 3' deletion from nt 386 (103/386 nt) (psiCHECK-2/
#> Prm2-a) when compared to the negative control group with scrambled RNA.
#> However, miR-469 did not have any effect on the plasmid containing isolated
#> fragment from 365-594 nt (psiCHECK-2/Prm2-b).}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3106, 15] got `{yes}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3106, 23] got `{Luciferase activity
#> assay}`
#> Warning in xls_cols(path, sheet, col_names = col_names, col_types =
#> col_types, : Expecting numeric in [3106, 25] got `{MRE was then proposed
#> to be localized in the coding region rather at 3‚Äô-UTR. mRNA-fold program
#> confirmed the formation of duplex structure of TP2 mRNA (nt 352-383) with
#> perfect match at nt 376-383 to the 5‚Äô seed region of miR-469 (Fig 6B).
#> Significant loss of luciferase activity was observed in the construct
#> containing the MRE sequence alone (psiCHECK-2/TP2-MRE). Mutation of the
#> proposed MRE site in the psiCHECK-2 vector containing either coding region
#> of TP2 (psiCHECK-2/TP2-CD-X) or the isolated MRE element (psiCHECK-2/ TP2-
#> MRE-X) completely recovered the luciferase activity in the presence of
#> miR-469.}`
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

## List of URLs obtained from the DepMap Figshare page
## (https://figshare.com/authors/Broad_DepMap/5514062) on the
## 15 August 2024
depmapURLs <-
    c("https://figshare.com/articles/dataset/DepMap_24Q2_Public/25880521",
      "https://figshare.com/articles/dataset/DepMap_23Q4_Public/24667905",
      "https://figshare.com/articles/dataset/DepMap_23Q2_Public/22765112",
      "https://figshare.com/articles/dataset/DepMap_22Q4_Public/21637199",
      "https://figshare.com/articles/dataset/DepMap_22Q2_Public/19700056",
      "https://figshare.com/articles/dataset/DepMap_22Q1_Public/19139906",
      "https://figshare.com/articles/dataset/DepMap_21Q4_Public/16924132",
      "https://figshare.com/articles/dataset/DepMap_21Q2_Public/14541774",
      "https://figshare.com/articles/dataset/DepMap_21Q3_Public/15160110",
      "https://figshare.com/articles/dataset/public_21q1/13681534",
      "https://figshare.com/articles/dataset/DepMap_20Q4_Public/13237076",
      "https://figshare.com/articles/dataset/public_20q3/12931238",
      "https://figshare.com/articles/dataset/DepMap_20Q2_Public/12280541",
      "https://figshare.com/articles/dataset/DepMap_20Q1_Public/11791698",
      "https://figshare.com/articles/dataset/DepMap_19Q4_Public/11384241",
      "https://figshare.com/articles/dataset/DepMap_19Q3_Public/9201770",
      "https://figshare.com/articles/dataset/DepMap_19Q2_Public/8061398",
      "https://figshare.com/articles/dataset/DepMap_GeCKO_19Q1/7668407",
      "https://figshare.com/articles/dataset/DepMap_Achilles_19Q1_Public/7655150",
      "https://figshare.com/articles/dataset/DepMap_Achilles_18Q4_public/7270880",
      "https://figshare.com/articles/dataset/DepMap_Achilles_18Q3_public/6931364",
      "https://figshare.com/articles/dataset/Project_SCORE_processed_with_CERES/9116732",
      "https://figshare.com/articles/dataset/Project_Score_Chronos/14461980",
      "https://figshare.com/articles/dataset/DEMETER_2_Combined_RNAi/9170975",
      "https://figshare.com/articles/dataset/Repurposing_Public_23Q2/23600310",
      "https://figshare.com/articles/dataset/PRISM_Repurposing_19Q3_Primary_Screen/9393293",
      "https://figshare.com/articles/dataset/PRISM_Repurposing_20Q2_Dataset/20564034")

dmsets <- tibble(url = depmapURLs) |>
    mutate(dataset_id = as.integer(sub("^.+/", "", url))) |>
    mutate(data = DepMapDataset(dataset_id )) |>
    mutate(title = sapply(data, dmTitle)) |>
    mutate(n_files = sapply(data, dmNumFiles)) |>
    select(title, dataset_id, n_files, url, data)

dmfiles <- DepMapFiles(dmsets$data)
## or dmfiles <- DepMapFiles(DepMapDataset(depmap$dataset_id))

extdata <- "~/repos/OS/depmap/inst/extdata"
saveRDS(dmsets, file = file.path(extdata, "dmsets.rds"))
saveRDS(dmfiles, file = file.path(extdata, "dmfiles.rds"))

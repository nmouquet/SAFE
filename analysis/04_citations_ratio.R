
library("faircitations")

refs <- RefManageR::ReadBib(here::here("data","savedrecs.bib"))
doi_list <- unlist(refs$"doi")
names(doi_list) <- NULL
cleaned_doi <- gsub("https://doi.org/", "", doi_list)
cleaned_doi <- gsub("doi:", "", cleaned_doi)
fp_article_fairness <- fairpub::fp_compute_ratio(cleaned_doi)

list_of_dois <- cleaned_doi
lapply(list_of_dois, fairpub::fp_article_fairness) |>
  do.call(rbind.data.frame)

fairpub::fp_article_fairness(cleaned_doi[1])


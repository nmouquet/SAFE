library("faircitations")

refs <- RefManageR::ReadBib(here::here("data","safe_lib.txt"))
doi_list <- unlist(refs$"doi")
names(doi_list) <- NULL
cleaned_doi <- gsub("https://doi.org/", "", doi_list)
cleaned_doi <- gsub("doi:", "", cleaned_doi)
faircitations::citation_ratio(cleaned_doi)


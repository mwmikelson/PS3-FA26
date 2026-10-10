# ---------------------------------------------------------------------------
# clean-clayton-data.R
# Combines the ten country files from the replication data for Clayton,
# O'Brien & Piscopo (APSR) into one file, clayton-clean.csv.
#
# Fetches datafiles directly from Harvard Dataverse (DOI 10.7910/DVN/D67GRI)
# so no local data downloads or public GitHub file uploads are needed.
#
# Output columns:
#   treat       'all_male' / 'balanced' / 'quota'
#   issue       'harassment' (treatments 1-3) / 'animals' (treatments 4-6)
#   country     country name
#   procedural  procedural legitimacy (SDs; already built by the authors)
#   substantive substantive legitimacy (SDs; already built by the authors)
#   female      1 = respondent is a woman, 0 = man, NA = other/no answer
# ---------------------------------------------------------------------------

library(estimatr)
library(jsonlite)  # Needed to query Dataverse API metadata

# Set your desired output location for the final clean CSV
output_file <- "clayton-clean.csv"

# ---- Step 0: Query Dataverse API for file IDs --------------------------------
dataset_doi <- "doi:10.7910/DVN/D67GRI"
api_url <- paste0("https://dataverse.harvard.edu/api/datasets/:persistentId/?persistentId=", dataset_doi)

cat("Fetching dataset metadata from Harvard Dataverse...\n")
dv_meta <- jsonlite::fromJSON(api_url)
files_info <- dv_meta$data$latestVersion$files$dataFile

# ---- Step 1: Read the ten country files directly via Dataverse API -----------
files <- c("MexAgg.csv", "PeruAgg.csv", "UKAgg.csv", "SpainAgg.csv", "PortAgg.csv",
           "USAgg.csv", "BrazilAgg.csv", "ArgAgg.csv", "NZAgg.csv", "NorAusFranceAgg.csv")

new.names <- c("row", "treat", "substantive", "procedural", "gender", "ideology", "country")

pieces <- lapply(files, function(f) {
   cat("Downloading", f, "from Dataverse...\n")
   
   # Match filename to its Dataverse internal file ID
   file_id <- files_info$id[files_info$filename == f]
   if (length(file_id) == 0) {
      stop(paste("File", f, "not found in Dataverse repository."))
   }
   
   # Direct access URL to stream original file format
   download_url <- paste0("https://dataverse.harvard.edu/api/access/datafile/", file_id, "?format=original")
   
   d <- read.csv(download_url, stringsAsFactors = FALSE)
   stopifnot(ncol(d) == 7)
   names(d) <- new.names
   d$treat <- as.character(d$treat)
   d
})

merged <- do.call(rbind, pieces)

# ---- Step 2: treatment number (1-6) ------------------------------------------
# Portugal, Spain, and the UK store treatment as 'treat1' ... 'treat6'; the rest use 1-6.
merged$treat.number <- as.numeric(gsub("treat", "", merged$treat))
stopifnot(all(merged$treat.number %in% 1:6))

# 1 = all-male council, 2 = gender-balanced council, 3 = gender-balanced council
# elected under the quota rule. 4-6 are the same three councils for animal mistreatment.
merged$issue <- ifelse(merged$treat.number <= 3, "harassment", "animals")
merged$treat <- c("all_male", "balanced", "quota")[(merged$treat.number - 1) %% 3 + 1]

# ---- Step 3: country names ----------------------------------------------------
merged$country[merged$country == "USA"] <- "United States"
merged$country[merged$country == "UK"]  <- "United Kingdom"
merged$country[merged$country == "NZ"]  <- "New Zealand"

# ---- Step 4: respondent gender (1 = woman) ------------------------------------
women <- c("Female", "Feminino", "Mujer", "Woman")
men   <- c("Male", "Masculino", "Hombre", "Man")
merged$female <- ifelse(merged$gender %in% women, 1, ifelse(merged$gender %in% men, 0, NA))

# ---- Step 5: keep the columns we need, drop missing outcomes -------------------
clean <- merged[, c("treat", "issue", "country", "procedural", "substantive", "female")]
clean$procedural  <- as.numeric(clean$procedural)
clean$substantive <- as.numeric(clean$substantive)
clean <- clean[!is.na(clean$procedural) & !is.na(clean$substantive), ]

# ---- Step 6: checks -------------------------------------------------------------
cat("\n--- Data Verification ---\n")
cat("Rows:", nrow(clean), "\n")                    # expect 13,859
print(table(clean$treat, clean$issue))             # harassment 8,689 / animals 5,170
print(table(clean$country))                        # 12 countries

# Compare with the paper (pooled across countries; should be very close):
h <- subset(clean, issue == "harassment")
print(difference_in_means(procedural ~ treat, h, condition1 = "all_male", condition2 = "balanced"))
print(difference_in_means(procedural ~ treat, h, condition1 = "all_male", condition2 = "quota"))
print(table(h$country))

# Save output locally
write.csv(clean, output_file, row.names = FALSE)
cat("\nSuccessfully wrote clean data to:", output_file, "\n")


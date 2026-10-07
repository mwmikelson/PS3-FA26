# make_flights_data.R
# ---------------------------------------------------------------------------
# INSTRUCTOR-ONLY. Builds the data folder for the lubridate notebook
# (exercise-3-lubridate.ipynb). Students never run this.
#
# Source: Bureau of Transportation Statistics (BTS), "Reporting Carrier On-Time
# Performance" (domestic flights flown by US airlines that report to BTS).
# The script downloads one zipped file per month (2019-2023 = 60 files, each
# roughly 20-30 MB zipped), keeps EVERY flight that goes TO or FROM OAK or SFO
# (no sampling), and writes one Stata (.dta) file per airport per year:
#
#   ps3_flights/ps3_flights_OAK_2019.dta ... ps3_flights/ps3_flights_SFO_2023.dta
#
# (10 files). Put the ps3_flights folder next to the notebook. The first cell
# of the notebook combines the files back into one table.
#
# Expect it to take a while the first time (mostly download time). Each month
# is cached in RAW_DIR, so if it stops partway, just run it again.
#
# Run it from the folder where you want ps3_flights/ to land:
#   Rscript make_flights_data.R        (or source() it in RStudio)
# ---------------------------------------------------------------------------

library(tidyverse)
library(lubridate)
library(haven)

options(timeout = 3600)   # these are big files; R's default 60 seconds is too short

AIRPORTS <- c("OAK", "SFO")
YEARS    <- 2019:2023
RAW_DIR  <- "bts_cache"
OUT_DIR  <- "ps3_flights"

# One zip per month. If BTS ever changes this address, the files are listed at
# https://www.transtats.bts.gov/PREZIP/
bts_url <- function(year, month) {
  sprintf("https://transtats.bts.gov/PREZIP/On_Time_Reporting_Carrier_On_Time_Performance_1987_present_%d_%d.zip",
          year, month)
}

# The BTS columns we need
KEEP <- c("FlightDate", "IATA_CODE_Reporting_Airline", "Origin", "Dest",
          "CRSDepTime", "DepDelay", "ArrDelay", "Cancelled", "Distance")

# Read one month's CSV, keep OAK/SFO flights, and reshape. (No sampling.)
process_csv <- function(csv_path) {
  read_csv(csv_path,
           col_select = all_of(KEEP),
           col_types = cols(.default = col_character()),
           progress = FALSE) %>%
    filter(Origin %in% AIRPORTS | Dest %in% AIRPORTS) %>%
    mutate(
      date      = as_date(parse_date_time(FlightDate, orders = c("ymd", "mdy", "mdy HMS"))),
      clock     = as.integer(CRSDepTime) %% 2400,                 # scheduled departure as hhmm
      clock_txt = if_else(is.na(clock), NA_character_,
                          sprintf("%02d:%02d", clock %/% 100, clock %% 100)),
      # Deliberately stored as plain TEXT (month/day/year) so students must convert it
      flight_date     = paste0(month(date), "/", day(date), "/", year(date)),
      sched_departure = paste(flight_date, clock_txt),
      carrier   = IATA_CODE_Reporting_Airline,
      origin    = Origin,
      dest      = Dest,
      airport   = if_else(Origin %in% AIRPORTS, Origin, Dest),
      direction = if_else(Origin %in% AIRPORTS, "departing", "arriving"),
      # whole numbers stored as integers (keeps the .dta files from being larger than they need to be)
      dep_delay = as.integer(round(as.numeric(DepDelay))),
      arr_delay = as.integer(round(as.numeric(ArrDelay))),
      cancelled = as.integer(as.numeric(Cancelled)),
      distance  = as.integer(round(as.numeric(Distance)))
    ) %>%
    arrange(date, clock) %>%
    select(flight_date, sched_departure, carrier, origin, dest, airport,
           direction, dep_delay, arr_delay, cancelled, distance)
}

# Download (if needed), process, and cache one month.
get_month <- function(year, month) {
  dir.create(RAW_DIR, showWarnings = FALSE)
  cache_file <- file.path(RAW_DIR, sprintf("processed_%d_%02d.rds", year, month))
  if (file.exists(cache_file)) return(readRDS(cache_file))

  message("Downloading ", year, "-", sprintf("%02d", month), " ...")
  zip_file <- tempfile(fileext = ".zip")
  download.file(bts_url(year, month), zip_file, mode = "wb", quiet = TRUE)

  csv_name <- grep("\\.csv$", unzip(zip_file, list = TRUE)$Name, value = TRUE)[1]
  exdir <- tempfile()
  unzip(zip_file, files = csv_name, exdir = exdir)

  result <- process_csv(file.path(exdir, csv_name))

  unlink(c(zip_file, exdir), recursive = TRUE)   # the raw month is big; keep only the result
  saveRDS(result, cache_file)
  result
}

months <- expand_grid(year = YEARS, month = 1:12)
flights <- map2_dfr(months$year, months$month, get_month)

# One .dta file per airport per year
dir.create(OUT_DIR, showWarnings = FALSE)
flights <- flights %>% mutate(.year = year(mdy(flight_date)))

for (a in AIRPORTS) {
  for (y in YEARS) {
    piece <- flights %>%
      filter(airport == a, .year == y) %>%
      select(-.year)
    write_dta(piece, file.path(OUT_DIR, sprintf("ps3_flights_%s_%d.dta", a, y)))
  }
}

# ---------------------------------------------------------------------------
# Sanity checks to look over before handing the folder to students
# ---------------------------------------------------------------------------
files <- list.files(OUT_DIR, pattern = "\\.dta$", full.names = TRUE)
check <- map_dfr(files, read_dta)

message("\nWrote ", length(files), " files to ", OUT_DIR, "/ (", nrow(check), " flights in all)")
print(check %>% count(airport, year = year(mdy(flight_date))))
print(check %>% count(airport, direction))
print(check %>% summarize(cancelled_share = mean(cancelled, na.rm = TRUE)))
print(head(check))

# Size check: the same data as one CSV vs. as the .dta files
tmp_csv <- tempfile(fileext = ".csv")
write_csv(check, tmp_csv)
mb <- function(x) round(x / 1024^2, 1)
message("\nSize check (MB):  all .dta files = ", mb(sum(file.size(files))),
        "   |   same data as one CSV = ", mb(file.size(tmp_csv)),
        "   |   largest single .dta file = ", mb(max(file.size(files))))
unlink(tmp_csv)

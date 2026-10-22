# Builds moneyball_batters.csv (2001-2003 MLB hitters, with 2002 Oakland A's focus)
# Source: Sean Lahman's Baseball Database, via the `Lahman` R package.
#   install.packages("Lahman")   # only needed once
# Run this file once; it writes moneyball_batters.csv to your working directory.

library(Lahman)

# ---- 1. Hitting stats for 2001-2003 (one row per player per team per season) ----
bat <- subset(Batting, yearID %in% 2001:2003)
for (v in c("HBP", "SF", "SH")) bat[[v]][is.na(bat[[v]])] <- 0   # blanks mean zero

# ---- 2. Drop pitchers (NL pitchers bat, AL pitchers don't; they'd drag down the NL average) ----
app <- subset(Appearances, yearID %in% 2001:2003, select = c(playerID, yearID, teamID, G_all, G_p))
bat <- merge(bat, app, by = c("playerID", "yearID", "teamID"))
bat <- subset(bat, G_p < 0.5 * G_all & AB > 0)

# ---- 3. Rate stats ----
bat$pa  <- bat$AB + bat$BB + bat$HBP + bat$SF + bat$SH
bat$obp <- (bat$H + bat$BB + bat$HBP) / (bat$AB + bat$BB + bat$HBP + bat$SF)
bat$slg <- (bat$H + bat$X2B + 2 * bat$X3B + 3 * bat$HR) / bat$AB
bat$ops <- bat$obp + bat$slg

# ---- 4. Salaries (not listed for some bench players; those stay NA) ----
sal <- subset(Salaries, yearID %in% 2001:2003, select = c(playerID, yearID, teamID, salary))
bat <- merge(bat, sal, by = c("playerID", "yearID", "teamID"), all.x = TRUE)
bat$salary_millions <- bat$salary / 1e6

# ---- 5. Salary groups, defined within each season among players with a listed salary ----
bat$salary_group <- "unknown"
for (y in 2001:2003) {
  in.year <- bat$yearID == y & !is.na(bat$salary)
  q <- quantile(bat$salary[in.year], c(0.50, 0.75))
  bat$salary_group[in.year & bat$salary <= q[1]] <- "low"      # bottom 50%
  bat$salary_group[in.year & bat$salary >  q[1] & bat$salary < q[2]] <- "middle"
  bat$salary_group[in.year & bat$salary >= q[2]] <- "high"     # top 25%
}

# ---- 6. Names, team indicator, final columns ----
ppl <- People[, c("playerID", "nameFirst", "nameLast")]
bat <- merge(bat, ppl, by = "playerID")
bat$player  <- paste(bat$nameFirst, bat$nameLast)
bat$oakland <- as.numeric(bat$teamID == "OAK")

out <- bat[, c("player", "yearID", "teamID", "oakland", "pa", "AB", "obp", "slg", "ops",
               "salary_millions", "salary_group")]
names(out) <- c("player", "year", "team", "oakland", "pa", "ab", "obp", "slg", "ops",
                "salary_millions", "salary_group")
out <- out[order(out$year, out$team, out$player), ]
write.csv(out, "moneyball_batters.csv", row.names = FALSE)

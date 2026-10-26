# Screenshot checklist for the PS 3 final exam study guide

Run `final_study_guide.ipynb` (or `final_study_guide_figures.R`), then save each image into a folder named `reference-images` next to `final_study_guide.tex`, using the exact file names below. The LaTeX file loads them from there.

Placeholder images with these names are included in the zip so the LaTeX file compiles right away. **Replace each placeholder with your own screenshot.** The two plots are saved by the code automatically.

| Figure | File name | What to screenshot | Used by questions |
|---|---|---|---|
| Figure 1 | `final-fig01-social-balance.png` | Code cell and output: the two-way table of mailer condition by sex | 7, 8 |
| Figure 2 | `final-fig02-resume-table.png` | Code cell and output: the two-way table of race by callback | 11 |
| Figure 3 | `final-fig03-resume-dim.png` | Code cell and `difference_in_means()` output for the resume experiment | 12, 13, 18, 19, 20, 21 |
| Figure 4 | `final-fig04-hawthorne-vs-civic.png` | Code cell and `difference_in_means()` output, Hawthorne vs. Civic Duty | 22, 23, 24 |
| Figure 5 | `final-fig05-neighbors-vs-control.png` | Code cell and `difference_in_means()` output, Neighbors vs. Control | 25, 33 |
| Figure 6 | `final-fig06-hte-voted-2004.png` | Code cell and output for voters who voted in the 2004 primary | 28, 29 |
| Figure 7 | `final-fig07-hte-did-not-vote-2004.png` | Code cell and output for voters who did not vote in the 2004 primary | 29 |
| Figure 8 | `final-fig08-sex-difference-2004.png` | Code cell and `difference_in_means()` output, men vs. women, 2004 primary turnout | 42, 43 |
| Figure 9 | `final-fig09-spending-scatter.png` | (automatic) scatterplot of expendA and voteA with line of best fit | 45, 46 |
| Figure 10 | `final-fig10-lm-bivariate.png` | Code cell and `summary(lm())` output for the bivariate regression (include the Coefficients block) | 48, 49, 50, 51, 54 |
| Figure 11 | `final-fig11-lm-multivariate.png` | Code cell and `summary(lm())` output for the multivariate regression (include the Coefficients block) | 53, 54, 55, 56 |
| Figure 12 | `final-fig12-lm-experiment.png` | Code cell and `summary(lm())` output for the social pressure experiment (include the Coefficients block) | 58, 59, 60, 61 |
| Figure 13 | `final-fig13-table-observational.png` | Code cell and the whole stargazer table with three columns (the table is wide: make sure no column is cut off) | 62, 63, 64, 65, 66, 67 |
| Figure 14 | `final-fig14-table-experimental.png` | Code cell and the whole stargazer table with two columns (the table is wide) | 68, 69, 70, 71 |
| Figure 15 | `final-fig15-rdd-plot.png` | (automatic) scatterplot of margin and vote with a line on each side of 0 | 77 |
| Figure 16 | `final-fig16-rdd-dim.png` | Code cell and `difference_in_means()` output for close Senate races | 79, 82 |
| Figure 17 | `final-fig17-did-means.png` | Code cell and output: average full-time employees before and after, by state | 85, 86 |
| Figure 18 | `final-fig18-did-dim.png` | Code cell and `difference_in_means()` output for the change in full-time employees | 90 |

## Tips

- Include the code line in each screenshot (that is what students are used to seeing in the notebooks), then the output beneath it.
- Use the same zoom level for every screenshot so the text sizes match.
- Each figure in the LaTeX file has alternative text (for screen readers) that describes the numbers in the output. If you change any code or data, update the `alt=` text for that figure in `final_study_guide.tex` to match.
- Data sources (all real): Gerber, Green, and Larimer (2008) social pressure experiment, Bertrand and Mullainathan (2004) resume audit study, and Card and Krueger (1994) minimum wage study, from Imai's *Quantitative Social Science* repository on GitHub; the 1988 House elections data (`vote1`) from the `wooldridge` R package; and Lee (2008) Senate elections data from the `rdrobust` R package.
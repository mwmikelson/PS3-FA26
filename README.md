# PS3-FA26

## Setup
1. Add exercise to GitHub in .ipynb file
2. Open the exercise Google Chrome
3. Click `nbgitpuller` extension ([Install here](https://chromewebstore.google.com/detail/nbgitpuller-link-generato/hpdbdpklpmppnoibabdkkhnfhkkehgnc))
4. Set JupyterHub URL to (https://datahub.berkeley.edu)
5. Open in Classic notebook (depends on how you want it to work)
6. Copy link to canvas to set it up

## Weekly topics

| **Week #** | **Lecture #** | **R Code** | **Topics** | **Other?** |
| --- | --- | --- | --- | --- |
| **Week 1** | | | | |
| **Week 2** | Lecture 1 | Arithmetic, `mean()` | Dataset structure | Jupyter basics, `<-`, `read.csv()`, `head()`, `$` |
| **Week 2** | Lecture 2 | `subset()` | Subsetting, means within subgroups | Florida police stops data |
| **Week 3** | Lecture 1 | One-way and two-way tables | Variable types | Theory → hypothesis → test |
| **Week 3** | Lecture 2 | — | Correlation ≠ causation, Reverse causation, Omitted variable bias | Happiness/polity data |
| **Week 4** | Lecture 1 | — | Potential outcomes framework, ATE | Kalla & Broockman (donors), wellness data |
| **Week 4** | Lecture 2 | `subset()` with `&` | Omitted Variable & Selection Bias | Treatment offered vs. participated |
| **Week 5** | Lecture 1 | — | Randomized experiments & bias | Social pressure/turnout experiment |
| **Week 5** | Lecture 2 | `difference_in_means()` | Baselines, multiple treatment conditions | Hawthorne effect |
| **Week 6** | Lecture 1 | `sd()`, `replicate()` | Standard error, t-statistic, Bias & noise | Shuffle simulation, SE formula |
| **Week 6** | Lecture 2 | `rbinom()`, `replicate()` | P-values, Null & Alternative Hypotheses, Statistical significance | Coin-flip example |
| **Week 7** | Lecture 1 | — | P-values in experiments, Statistical significance | Shuffle test for p-value |
| **Week 7** | Lecture 2 | `$conf.low`, `$conf.high` | Confidence intervals | Using CIs for decisions |
| **Week 8** | Lecture 1 | `subset()` + `difference_in_means()` | Heterogeneous treatment effects, p-hacking | Utah precinct chairs data |
| **Week 8** | Lecture 2 | `weighted.mean()` | Generalizability, Meta-analysis | Precision weighting |
| **Week 9** | Lecture 1 | `weighted.mean()`, `sample_n()` | Describing populations, Random sampling, Sampling bias, Survey weights | *Literary Digest* vs. Gallup, CES data |
| **Week 9** | Lecture 2 | `difference_in_means(..., weight =)` | Descriptive hypotheses (non-causal) | Noise comes from sampling |
| **Week 10** | Lecture 1 | `qplot()`, `geom_smooth(method = 'lm')` | Scatterplots, Line of best fit | "Look at your data" |
| **Week 10** | Lecture 2 | `lm()`, `summary()`, `cor()` | Bivariate regression, Slope & intercept, Extrapolation, Correlation | Legislators' perceptions data |
| **Week 11** | Lecture 1 | `lm()` with multiple predictors | Multivariate regression, Controlling for variables, Omitted variable bias | Campaign spending data, residuals |
| **Week 11** | Lecture 2 | `lm()` with treatment + controls | Regression for experiments, Baseline category, Controls reduce noise | German bystander experiment |
| **Week 12** | Lecture 1 | — | Reading regression tables (experiments) | Ashraf et al. condoms study |
| **Week 12** | Lecture 2 | — | Reading regression tables (observational), Fixed effects | Peterson newspaper study |
| **Week 13** | Lecture 1 | — | Natural experiments, Instrumental variables, Exclusion restriction | VC firms/daughters, KIPP lottery |
| **Week 13** | Lecture 2 | — | Regression discontinuity, Sorting, Validity checks | Austria unemployment, CSR votes |
| **Week 14** | Lecture 1 | — | Difference-in-differences, Parallel trends, Placebo tests | Ladd & Lenz, People's Action, Dube et al. |
| **Week 14** | Lecture 2 | — | Theory, Rational choice, Prisoner's dilemma, Collective action problems | Willer (status solution) |

## What is covered in each advanced exercise

**Exercise 1**
- Formatting data with dplyr (and tidyverse?)

**Exercise 2**
- Making graphs with ggplot

**Exercise 3**
- Working with dates with lubridate

**Exercise 4**
- Working with strings

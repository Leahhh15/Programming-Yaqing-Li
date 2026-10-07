# Introduction to Business Programming — Coursework Portfolio

A programming portfolio from an introductory course covering **R and Python**, progressing from basic programming and data manipulation to complete analytical workflows involving data integration, missing-value handling, outlier detection, visualization, and feature engineering.

## Background

This course was my **first formal exposure to programming**. I started with no prior coding experience and learned R during the first half of the course before transitioning to Python.

Rather than treating the two languages as separate assignments, the coursework gradually developed a common analytical workflow:

**data ingestion → inspection → cleaning → transformation → integration → feature engineering → aggregation → visualization**

The repository therefore reflects both **programming skill development** and the ability to transfer analytical logic across languages.

---

## Quick Overview

| Track | Files | Focus |
|-------|-------|-------|
| R (Weeks 1–4) | [`r/task01.R`](./r/task01.R) – [`r/task04.R`](./r/task04.R) | Data structures, data manipulation, joins, missing values, outliers |
| Midterm (R) | [`midterm/midterm.R`](./midterm/midterm.R) | End-to-end data integration, reshaping, feature engineering |
| Python (Weeks 5–6) | [`python/task05.ipynb`](./python/task05.ipynb), [`python/task06.ipynb`](./python/task06.ipynb) | pandas fundamentals and visualization |
| Final (Python) | [`final/final.ipynb`](./final/final.ipynb) | End-to-end analytical pipeline and feature engineering |

---

## Featured Projects

### 1. Texas Housing Market Analysis — Python

**File:** [`final/final.ipynb`](./final/final.ipynb)

An end-to-end analysis of Texas housing data from 2000–2015, integrated with monthly CPI data.

The project combines data cleaning, multi-source integration, derived variables, aggregation, outlier detection, and rule-based feature engineering in a single Python workflow.

**Pipeline:**

1. Data ingestion and inspection using `head()`, `info()`, and `describe()`
2. Semantic column renaming
3. Removal of invalid negative values
4. Missing-value imputation
5. CPI integration using `pd.merge()` on `(year, month)`
6. Inflation-adjusted variables such as `sales_total_adj` and `price_med_adj`
7. Median aggregation by `(year, month)`
8. IQR-based outlier detection using `np.percentile()`
9. Multi-condition classification using `np.select()`
10. Visualization with histograms and boxplots

**Tech:** Python, pandas, NumPy, matplotlib, seaborn

---

### 2. Texas Housing Market Analysis — R

**File:** [`midterm/midterm.R`](./midterm/midterm.R)

An R implementation of the same Texas housing analysis, demonstrating that the underlying analytical workflow can be reproduced across programming languages.

**Highlights:**
- Integrated two data sources using `left_join()` on the composite key `(year, month)`
- Reshaped data in both directions using `pivot_wider()` and `pivot_longer()`
- Created **32 year-over-year growth-rate variables** using `mutate()`
- Ranked and visualized results using `reorder()` and `ggplot2`

**Tech:** R, dplyr, tidyr, ggplot2

---

### 3. Titanic Exploratory Data Analysis

**Files:** [`python/task05.ipynb`](./python/task05.ipynb) · [`python/task06.ipynb`](./python/task06.ipynb)

A two-week exploratory analysis using the Kaggle Titanic dataset.

The project focuses on learning how to inspect a dataset, handle missing values, perform grouped analysis, and translate findings into visualizations.

**Pipeline:**

**inspection → missing-value handling → grouped aggregation → visualization**

**Highlights:**
- Identified `Cabin` as highly incomplete and removed it from the analysis
- Imputed missing `Age` values
- Performed multi-key aggregation using `groupby(['Pclass', 'Sex'])`
- Compared age distributions by survival status using stacked histograms
- Compared fare distributions across passenger classes using horizontal boxplots

**Tech:** Python, pandas, matplotlib

---

## Full Assignment Index

### R Track

| File | Topics | Key Functions |
|------|--------|---------------|
| [`r/task01.R`](./r/task01.R) | Data frames, indexing, CSV I/O | `data.frame()`, `read.csv()`, `str()`, `$`, `[[ ]]` |
| [`r/task02.R`](./r/task02.R) | Descriptive statistics, string operations, filtering, visualization | `max()`, `min()`, `median()`, `mean()`, `gsub()`, `ggplot2` |
| [`r/task03.R`](./r/task03.R) | Type conversion, file I/O, feature engineering, data manipulation | `as.data.frame()`, `write.table()`, `rename()`, `filter()`, `select()`, `arrange()`, `%>%` |
| [`r/task04.R`](./r/task04.R) | Joins, aggregation, missing-value handling, outlier detection | `left_join()`, `inner_join()`, `full_join()`, `bind_rows()`, `group_by()`, `summarise()`, `is.na()` |
| [`midterm/midterm.R`](./midterm/midterm.R) | Data integration, reshaping, feature engineering, visualization | `left_join()`, `pivot_wider()`, `pivot_longer()`, `mutate()`, `ggplot2` |

### Python Track

| File | Topics | Key Functions |
|------|--------|---------------|
| [`python/task05.ipynb`](./python/task05.ipynb) | pandas fundamentals, missing values, grouped analysis | `read_csv()`, `head()`, `info()`, `describe()`, `sort_values()`, `value_counts()`, `isnull().sum()`, `fillna()`, `groupby()` |
| [`python/task06.ipynb`](./python/task06.ipynb) | Data visualization | `plt.hist(stacked=True)`, `plt.boxplot(vert=False)` |
| [`final/final.ipynb`](./final/final.ipynb) | End-to-end data pipeline and feature engineering | `pd.merge()`, `np.where()`, `np.select()`, `np.percentile()`, seaborn |

---

## 🛠 Skills Demonstrated

### Programming & Data Manipulation
- Python and R programming fundamentals
- Data structures and indexing
- File I/O and dataset inspection
- Filtering, sorting, grouping, and aggregation
- Multi-source data integration
- Long/wide data reshaping

### Data Cleaning
- Missing-value identification and imputation
- Invalid-value detection
- Outlier identification using boxplot rules and IQR
- Type conversion and data transformation

### Feature Engineering
- Derived variables
- Inflation-adjusted measures
- Year-over-year growth rates
- Conditional transformations
- Multi-condition categorical classification

### Visualization & Analysis
- Exploratory data analysis
- Grouped statistical summaries
- Histograms
- Boxplots
- Ranked bar charts

### Cross-Language Transfer

A key aspect of the coursework is implementing similar analytical logic in both **R and Python**. The Texas housing project demonstrates how the same concepts—data integration, reshaping, feature engineering, aggregation, and visualization—can be expressed using different programming ecosystems.

---

## Notes

- Coursework was completed **individually** and published after course completion.
- **R** was used for Weeks 1–4 and the midterm; **Python** was used for Weeks 5–6 and the final.
- Original assignment prompts were provided in Korean.
- Code includes explanatory comments as required by the course.
- Assignments follow the methods and scope prescribed by the course.

# Introduction to Business Programming — Coursework Portfolio

A complete record of an introductory programming course covering **R** 
(weeks 1–4 + midterm exam) and **Python** (weeks 5–6 + final exam), 
progressing from basic data structures to end-to-end analytical pipelines.

## Background

This course was my **first formal exposure to programming**. Before it, 
I had no coding experience. Over one semester, I went from writing my 
first `data.frame()` in R to completing full analytical pipelines — 
including dual-source data integration, missing-value imputation, 
outlier detection, and multi-condition feature engineering — in both 
R and Python.

The repository is organized to show **skill progression** rather than just 
a list of assignments: each week builds on the previous one, and the 
midterm/final projects apply everything learned to a real dataset.

---

## Quick Overview

| Track | Files | Focus |
|-------|-------|-------|
| R (Weeks 1–4) | [`r/task01.R`](./r/task01.R) – [`r/task04.R`](./r/task04.R) | Data frames, dplyr pipelines, joins, missing values, outliers |
| Midterm (R) | [`midterm/midterm.R`](./midterm/midterm.R) | Full pipeline on Texas housing data + CPI integration |
| Python (Weeks 5–6) | [`python/task05.ipynb`](./python/task05.ipynb), [`python/task06.ipynb`](./python/task06.ipynb) | pandas fundamentals, matplotlib visualization |
| Final (Python) | [`final/final.ipynb`](./final/final.ipynb) | Same dataset in Python, with advanced feature engineering |

---

## Featured Projects

### 1. Texas Housing Market Analysis — Python (Final Exam)
**File:** [`final/final.ipynb`](./final/final.ipynb)

End-to-end analysis of Texas housing data (2000–2015) integrated with CPI 
inflation data. Demonstrates advanced pandas/numpy feature engineering and 
multi-condition classification.

**Pipeline:**
1. Ingestion & inspection (`head`, `info`, `describe`)
2. Semantic column renaming
3. Outlier removal (negative values)
4. Missing-value imputation
5. CPI integration via `pd.merge()` on `(year, month)`
6. Inflation-adjusted derived variables (`sales_total_adj`, `price_med_adj`)
7. Median aggregation by `(year, month)`
8. IQR-based outlier detection with `np.percentile`
9. Multi-condition feature engineering: `np.select()` → 4-category `market_hotness`
10. Overlaid histograms with graded alpha; seaborn boxplot

**Tech:** pandas, numpy, matplotlib, seaborn

---

### 2. Texas Housing Market Analysis — R (Midterm Exam)
**File:** [`midterm/midterm.R`](./midterm/midterm.R)

R reimplementation of the same dataset, demonstrating cross-language 
transferability of analytical thinking.

**Highlights:**
- Dual-source `left_join()` on composite key `(year, month)`
- `pivot_wider()` / `pivot_longer()` bidirectional reshaping
- 32 YoY growth-rate columns via `mutate()`
- Ranked bar chart with `reorder()`

**Tech:** base R, dplyr, tidyr, ggplot2

---

### 3. Titanic Exploratory Data Analysis
**Files:** [`python/task05.ipynb`](./python/task05.ipynb) · [`python/task06.ipynb`](./python/task06.ipynb)

Two-week EDA on the Kaggle Titanic dataset.

**Pipeline:** inspection → missing-value handling → group-by aggregation → visualization

**Highlights:**
- Dropped `Cabin` (78% missing), imputed `Age` with mean
- Multi-key `groupby(['Pclass', 'Sex'])` aggregation
- Stacked histogram (age × survival), horizontal boxplot (fare × class)

**Tech:** pandas, matplotlib

---

## Full Assignment Index

### R Track
| File | Topics | Key Functions |
|------|--------|---------------|
| [`r/task01.R`](./r/task01.R) | Data frame creation, indexing, CSV I/O | `data.frame()`, `read.csv()`, `str()`, `$`, `[[ ]]` |
| [`r/task02.R`](./r/task02.R) | Descriptive stats, string ops, filtering, boxplot | `max/min/median/mean()`, `gsub()`, `ggplot2` |
| [`r/task03.R`](./r/task03.R) | Built-in datasets, type conversion, file I/O, feature engineering, dplyr pipeline | `as.data.frame()`, `write.table()`, `rename()`, `filter()`, `select()`, `arrange()`, `%>%` |
| [`r/task04.R`](./r/task04.R) | Joins, group-wise aggregation, missing-value imputation, outlier detection | `left/inner/full_join()`, `bind_rows()`, `group_by()`, `summarise()`, `is.na()`, `boxplot()` |
| [`midterm/midterm.R`](./midterm/midterm.R) | Full pipeline: merge, reshape, feature engineering, visualization | `left_join()`, `pivot_wider()`, `pivot_longer()`, `mutate()`, `ggplot2` |

### Python Track
| File | Topics | Key Functions |
|------|--------|---------------|
| [`python/task05.ipynb`](./python/task05.ipynb) | pandas fundamentals, missing values, group-by | `read_csv()`, `head/info/describe()`, `sort_values()`, `value_counts()`, `isnull().sum()`, `fillna()`, `groupby()` |
| [`python/task06.ipynb`](./python/task06.ipynb) | matplotlib visualization | `plt.hist(stacked=True)`, `plt.boxplot(vert=False)` |
| [`final/final.ipynb`](./final/final.ipynb) | Full pipeline with advanced feature engineering | `pd.merge()`, `np.where()`, `np.select()`, `np.percentile()`, `seaborn` |

---

## 🛠 Skills Demonstrated

**Languages**
- R (base R, dplyr, tidyr, ggplot2)
- Python (pandas, numpy, matplotlib, seaborn)

**Core competencies**
- Data inspection & profiling (`str`, `summary`, `info`, `describe`)
- Missing-value imputation (mean, zero-fill, conditional)
- Outlier detection (boxplot whiskers, IQR with `np.percentile`)
- Multi-source data integration (composite-key joins)
- Long/wide reshaping (`pivot_wider`, `pivot_longer`)
- Feature engineering (derived variables, binning, multi-condition classification)
- Group-wise aggregation (`group_by` / `groupby`)
- Cross-language implementation of the same analytical workflow

---

## Notes

- Coursework completed **individually**; posted after course conclusion.
- **Language distribution**: R covers weeks 1–4 and the midterm; Python 
  covers weeks 5–6 and the final exam.
- Original assignment prompts were in Korean.
- All code includes line-by-line explanatory comments as required by the course.
- Assignments follow the course's prescribed methods.

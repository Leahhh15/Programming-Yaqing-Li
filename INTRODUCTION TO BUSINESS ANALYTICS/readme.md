# Introduction to Business Analytics

Course portfolio for *Introduction to Business Analytics*, covering statistical
inference and applied classification on real-world business datasets using
Python and R.

## Projects

### Binary Classification of Automated Approval
End-to-end analysis of 100,000 fintech loan applications (22 variables),
identifying the rules behind an automated approval system.

- **Data wrangling**: constructed the `automatic_approved` target from
  `approved` + `manual_approved`; one-hot encoding for categorical features
- **Statistical inference**: Pearson correlation, Welch t-tests comparing
  approved vs. rejected applicant characteristics
- **Modeling**: decision tree classifier (max_depth=4, stratified split)
- **Key finding**: near-perfect accuracy and `credit_score` importance = 1.0
  reflect the *construction of the target*, not a deployable predictive model —
  the tree is recovering the existing approval rule rather than learning
  generalizable patterns

Fully reproducible: `fintech.csv` is included in this repository.

| File | Language | Key Concepts |
|------|----------|--------------|
| `Binary Classification of Automated Approval.ipynb` | Python | pandas, scipy, scikit-learn, rule reconstruction |
| `fintech.csv` | Data | 100,000 loan applications × 22 variables |

### Mobile Commerce Analytics
Statistical comparison of mobile vs. PC shopping behavior using three
consumer datasets (member, adoption, order records).

- **Hypothesis testing**: Welch t-tests for age and order price differences;
  chi-square tests for gender and certificate dependence
- **Data wrangling**: type conversion, dummy variable creation, subsetting
- **Key questions**: Do adopters differ in age / gender from non-adopters?
  Do mobile transactions differ in order price, confirmation rate, and
  reliance on seller certificates?

| File | Language | Key Concepts |
|------|----------|--------------|
| `Mobile Commerce.R` | R | `foreign`, `t.test`, `chisq.test`, `subset`, `ifelse` |

> **Note**: The `.dta` datasets used in this project
> (`OnlineMember.dta`, `MobileMember.dta`, `MobileOrder.dta`) are course
> materials provided under the instructor's terms and are **not included**
> in this repository. The code remains fully readable and cell outputs are
> preserved where applicable.

## Requirements

- **Python analytics**: pandas, numpy, matplotlib, scipy, scikit-learn, jupyter
- **R analytics**: R, `foreign`

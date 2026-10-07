# Introduction to Business Analytics

Course portfolio focused on **data analytics, statistical inference, and applied machine learning** using Python and R.

The projects apply data preprocessing, feature construction, statistical testing, and classification to real-world business and consumer datasets.

## Projects

### 1. Binary Classification of Automated Approval

**Python | 100,000 loan applications | 22 variables**

An end-to-end analysis of a fintech loan dataset, examining applicant characteristics and reconstructing the logic behind an automated approval process.

#### Analytical Workflow

* **Data wrangling**

  * Constructed the `automatic_approved` target from `approved` and `manual_approved`
  * Encoded categorical variables using one-hot encoding
  * Prepared structured features for statistical analysis and modeling

* **Statistical analysis**

  * Pearson correlation
  * Welch's independent-samples t-tests
  * Comparison of automated approvals and rejections

* **Machine learning**

  * Decision tree classification
  * Stratified train/test split
  * Controlled tree complexity with `max_depth=4`
  * Feature importance analysis

#### Key Finding

The model achieved near-perfect predictive performance, with `credit_score` accounting for all measured feature importance.

Rather than treating this as evidence of an exceptionally strong predictive model, the analysis examined the relationship between the target variable and the existing approval process. Because the target was constructed from the existing approval records, the decision tree was largely recovering an embedded approval rule rather than learning a genuinely generalizable predictive relationship.

This project demonstrates both **model implementation and critical evaluation of model performance and target construction**.

#### Files

| File                                                | Type            | Key Technologies                   |
| --------------------------------------------------- | --------------- | ---------------------------------- |
| `Binary Classification of Automated Approval.ipynb` | Python Notebook | pandas, NumPy, SciPy, scikit-learn |
| `fintech.csv`                                       | Dataset         | 100,000 × 22                       |

---

### 2. Mobile Commerce Analytics

**R | Consumer membership and transaction data**

A multi-question statistical analysis comparing mobile and non-mobile consumer behavior using membership and transaction records.

#### Analytical Workflow

The analysis covers five statistical questions involving demographic characteristics, transaction behavior, and seller-related attributes.

**1. Age comparison**

* Converted birth-year variables to numeric values
* Constructed age from birth year
* Compared mobile adopters and non-adopters using Welch's t-test

**2. Gender composition**

* Removed unknown gender records
* Constructed gender contingency tables
* Applied a chi-square test to evaluate differences in gender composition between groups

**3. Order price**

* Constructed a mobile-channel indicator using mall and access-route conditions
* Compared order prices between mobile and non-mobile transactions using Welch's t-test

**4. Confirmation rate**

* Constructed a binary confirmation-rate variable from ordered and confirmed quantities
* Compared confirmation rates between mobile and non-mobile transactions

**5. Seller characteristics**

* Examined `OkSeller`, `QuickSeller`, and `BigSeller`
* Constructed contingency tables
* Applied chi-square tests to evaluate associations with mobile-channel usage

#### Key Methods

* Data type conversion
* Feature construction with `ifelse()`
* Dataset filtering with `subset()`
* Frequency tables with `table()`
* Welch's t-test
* Chi-square test
* Group comparison
* Categorical-data analysis

#### Files

| File                | Type     | Key Technologies                                               |
| ------------------- | -------- | -------------------------------------------------------------- |
| `Mobile Commerce.R` | R Script | `foreign`, `t.test`, `chisq.test`, `subset`, `ifelse`, `table` |

> **Data note:** The `.dta` datasets used in this analysis are course materials provided under the instructor's terms and are not included in this repository. The analysis code remains available for review, with outputs preserved where applicable.

---

## Skills Demonstrated

### Data Analytics

* Data inspection and preprocessing
* Data type conversion
* Dataset filtering and subsetting
* Categorical variable handling
* Feature construction
* Contingency-table construction

### Statistical Analysis

* Descriptive statistics
* Pearson correlation
* Welch's t-test
* Chi-square test
* Group comparison
* Statistical interpretation

### Machine Learning

* Decision tree classification
* Train/test splitting
* Stratified sampling
* Feature importance
* Model interpretation

### Critical Model Evaluation

* Target-variable construction
* Recognition of embedded rules
* Interpretation of unusually high predictive performance
* Distinguishing model accuracy from genuine generalizability

---

## Tools

**Python**

`pandas` · `NumPy` · `SciPy` · `scikit-learn` · `Jupyter`

**R**

`R` · `foreign`

---

## Course Scope

The projects progress from **data preparation and statistical inference to applied machine learning and model interpretation**, providing a foundation for further work in data science, machine learning, and analytics.

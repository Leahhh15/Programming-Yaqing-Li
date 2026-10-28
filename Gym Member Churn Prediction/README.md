# Gym Member Churn Prediction

## Overview
This project predicts early-stage member churn for a subscription-based fitness center using 50,000 records of new members' first four weeks of behavioral data. By applying feature engineering, Bayesian hyperparameter optimization (Optuna), and explainable AI (SHAP), the pipeline not only identifies high-risk members but also translates model outputs into a cost-sensitive retention strategy.

## Dataset
*   **Source:** Synthetic dataset (Kaggle).
*   **Scale:** 50,000 rows, 24 features.
*   **Target:** `churned_by_february` (Binary: 1 = Churned, 0 = Retained).
*   **Class Balance:** 54.88% Retained / 45.12% Churned (No resampling required).

## Methodology
1.  **EDA & Insight:** Identified the "Week-1 Effect" (members attending 0-1 times in Week 1 churn at 65.4%, compared to 15.2% for high attenders). Discovered that `contract_type` is a strong structural signal, while demographic factors show near-zero variance.
2.  **Feature Engineering:** Built custom trajectory features using `numpy.polyfit` to calculate the attendance decay slope. Engineered a `commitment_score` by aggregating six binary engagement indicators.
3.  **Modeling & Tuning:** Evaluated Logistic Regression (baseline), Random Forest, and XGBoost. Applied Optuna (100 trials) to tune XGBoost, which automatically converged to a shallow tree structure (`max_depth=3`), indicating the underlying data signal is largely linear (Test AUC: 0.8208).
4.  **Interpretability (SHAP):** Used `TreeExplainer` to rank global feature importance. The engineered `total_visits_4w` dominated the model, while `distance_km` and `avg_weekly_classes` emerged as significant secondary drivers.
5.  **Cost-Sensitive Thresholding:** Standard 0.5 thresholds fail to account for asymmetric business costs. By setting False Negative cost (lost LTV) to \$150 and False Positive cost to \$20, optimized the decision threshold to 0.120. This raised Recall to 98.1% and reduced expected operational cost by **58.2%** (from \$216,710 to \$90,480).

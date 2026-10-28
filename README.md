# Programming, Analytics & AI Portfolio

A collection of coursework, research, and applied programming projects developed across **Python and R**, covering programming fundamentals, data analytics, statistical modeling, machine learning, deep learning, and computer vision.

The portfolio documents my progression from **programming fundamentals and data analysis to machine learning, neural networks, and independent computer vision research**.

---

## Portfolio Overview

| Area                 | Languages / Tools          | Focus                                                              |
| -------------------- | -------------------------- | ------------------------------------------------------------------ |
| Programming          | Python, R, NumPy           | Programming fundamentals, data structures, functions, file I/O     |
| Data Analytics       | Python, R, pandas, dplyr   | Data cleaning, transformation, visualization, exploratory analysis |
| Statistical Analysis | R, Python, scipy           | Hypothesis testing, correlation, statistical inference             |
| Machine Learning     | R, Python, scikit-learn, XGBoost | Classification, regression, model evaluation, Bayesian tuning |
| Explainable AI (XAI) | SHAP                       | Model interpretation, feature attribution, cost-sensitive strategy |
| Deep Learning        | Python, NumPy, PyTorch     | Neural networks, backpropagation, optimization, CNNs               |
| Computer Vision      | PyTorch, torchvision, YOLO | Image classification, object detection, transfer learning          |
| Research             | Python, PyTorch            | Model design, ablation studies, lightweight deep learning          |

---

# Research & Independent Projects

## RRI-YOLO: A Lightweight Object Detection Model for UAV Small Objects Based on YOLOv10

**Research project:** Lightweight object detection for small objects in UAV imagery.

This project investigates a lightweight object detection architecture based on **YOLOv10**, with an emphasis on improving small-object detection while maintaining computational efficiency.

### Key Components

* YOLOv10-based object detection
* Lightweight architecture design
* RepViT backbone
* SPPF + PSA feature processing
* YOLOv10 detection head
* Small-object detection in UAV imagery
* Ablation studies
* Model evaluation and comparison
* PyTorch-based implementation

### Research Focus

The project explores the trade-off between **detection performance and model efficiency**, with particular attention to deployment-oriented object detection for UAV imagery.

The source code, training configuration, model components, and experimental implementation are included in this repository.

**Manuscript:**
*RRI-YOLO: A Lightweight Object Detection Model for UAV Small Objects Based on YOLOv10*

**Status:** Under review at IEEE Access.

**Code Availability:** The source code is currently not publicly available due to the ongoing peer-review process.
---

# Applied Machine Learning Projects

## Gym Member Churn Prediction: Leveraging Behavioral Trajectories and Explainable Machine Learning

**Project focus:** End-to-end machine learning pipeline for predicting early-stage member churn and optimizing retention strategies.

This project uses 50,000 records of new members' first four weeks of behavioral data to build a robust classification model. It emphasizes advanced feature engineering, Bayesian hyperparameter optimization, and translating model interpretability into business value.

### Key Components

* **Exploratory Data Analysis:** Identified the "Week-1 Effect" (churn drops from 65.4% to 15.2% across attendance quartiles) and evaluated structural vs. demographic signals.
* **Feature Engineering:** Built custom trajectory features (e.g., using `numpy.polyfit` to calculate attendance decay slopes) and composite engagement scores.
* **Modeling & Tuning:** Compared Logistic Regression, Random Forest, and XGBoost. Applied Optuna (100 trials) which automatically converged XGBoost to a shallow structure (`max_depth=3`), matching the baseline linear model (Test AUC: 0.8208).
* **Interpretability:** Used SHAP `TreeExplainer` to identify global drivers and individual risk profiles. 
* **Business Impact:** Implemented cost-sensitive threshold optimization (FN=$150, FP=$20). Adjusted the decision threshold to 0.120, raising Recall to 98.1% and reducing expected operational costs by 58.2% ($216,710 to $90,480).
* **Tech Stack:** Python, scikit-learn, XGBoost, Optuna, SHAP, pandas.

*(Refer to the `gym-churn-prediction` repository for the full code and visualizations.)*

---

# Coursework Portfolio

## 1. Understanding and Using AI

**Focus:** Neural networks, deep learning fundamentals, and computer vision using Python.

This repository progresses from implementing neural-network components manually to applying modern deep learning architectures.

### Highlights

* Implemented neural network components from scratch using NumPy
* Implemented forward propagation and backpropagation manually
* Studied multiple optimization algorithms
* Investigated weight initialization and Batch Normalization
* Applied MLPs to real datasets
* Trained a CNN for CIFAR-100 classification
* Fine-tuned a pretrained ResNet18 for image classification

### Topics

* Perceptron
* Forward propagation
* Loss functions
* Numerical differentiation
* Backpropagation
* Affine / ReLU / Softmax layers
* SGD
* Momentum
* AdaGrad
* Adam
* RMSprop
* Weight initialization
* Batch Normalization
* CNNs
* Transfer learning

### Applied Projects

| Project             | Topic                                          |
| ------------------- | ---------------------------------------------- |
| Iris Classification | MLP, multiclass classification                 |
| Wine Classification | MLP, feature scaling, mini-batch training      |
| CIFAR-100           | CNN, image classification, data augmentation   |
| ResNet18            | Transfer learning, binary image classification |

---

## 2. Machine Learning for Business Analytics

**Focus:** Classical machine learning and model evaluation using R.

This repository covers a broad range of supervised learning methods, from probabilistic models to ensemble methods and neural networks.

### Models

* Naïve Bayes
* k-Nearest Neighbors
* Decision Trees
* Random Forest
* Neural Networks

### Applications

* Titanic classification
* Flight-delay prediction
* Iris classification
* Auto-MPG regression
* eBay auction analysis
* Bank marketing prediction
* Boston housing regression

### Skills

* Data preprocessing
* Missing-value imputation
* Classification
* Regression
* Feature preparation
* Confusion matrices
* ROC/AUC
* Lift charts
* RMSE
* Reproducible modeling with `set.seed()`

---

## 3. Introduction to Business Analytics

**Focus:** Statistical inference, data analysis, and applied machine learning using business datasets.

This repository moves beyond programming fundamentals toward using code to investigate analytical questions and build predictive models.

### Featured Projects

#### Binary Classification of Automated Approval

End-to-end analysis of **100,000 fintech loan applications**.

**Key methods:**

* Data wrangling
* One-hot encoding
* Pearson correlation
* Welch's t-tests
* Decision tree classification
* Model interpretation

A key analytical finding was that the model's near-perfect predictive performance reflected the construction of the target variable rather than genuine generalizable predictive power.

#### Mobile Commerce Analytics

Statistical comparison of mobile and PC shopping behavior.

**Key methods:**

* Welch's t-tests
* Chi-square tests
* Data transformation
* Subsetting
* Feature construction
* Customer behavior comparison

---

## 4. Introduction to Business Programming

**Focus:** Programming fundamentals and analytical workflows in R and Python.

This repository documents my first formal programming coursework, progressing from basic programming concepts to complete analytical pipelines.

### Highlights

* R and Python fundamentals
* Data frames and data manipulation
* Missing-value handling
* Outlier detection
* Data integration
* Feature engineering
* Statistical summarization
* Visualization
* Cross-language implementation

### Featured Projects

#### Texas Housing Market Analysis

An end-to-end analysis integrating housing data with CPI information.

**Techniques:**

* Multi-source data integration
* Composite-key joins
* Missing-value handling
* Outlier detection
* Feature engineering
* Inflation-adjusted variables
* Aggregation
* Visualization

#### Titanic Exploratory Data Analysis

A structured exploratory analysis involving:

* Missing-value handling
* Group-by aggregation
* Data summarization
* Histograms
* Boxplots

---

# Technical Progression

The projects in this portfolio represent a progression from foundational programming to independent AI research:

```text
Programming Fundamentals
        ↓
Data Wrangling & Visualization
        ↓
Statistical Analysis
        ↓
Classical Machine Learning & Explainable AI
        ↓
Neural Networks from Scratch
        ↓
Deep Learning & Transfer Learning
        ↓
Computer Vision
        ↓
Independent Object Detection Research

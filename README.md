# 🧹 Data Cleaning — Tech Layoffs Dataset (SQL & MySQL)

## 📌 Project Overview

This project focuses on cleaning and preprocessing a real-world dataset of global tech company layoffs sourced from Kaggle. The goal was to transform raw, inconsistent data into a reliable, analysis-ready format using structured SQL techniques.

---

## 📂 Dataset

- **Source:** [Kaggle — Tech Layoffs Dataset](https://www.kaggle.com/)
- **Domain:** Global technology industry layoffs
- **Fields include:** Company, Location, Industry, Total Laid Off, Percentage Laid Off, Date, Stage, Country, Funds Raised (Millions)

---

## 🎯 Objectives

1. Remove duplicate records
2. Standardize inconsistent text and categorical fields
3. Handle null and blank values
4. Remove rows with no actionable data
5. Correct data types for accurate querying

---

## 🛠️ Tools Used

- **MySQL** — data cleaning and transformation
- **SQL Concepts** — CTEs, Window Functions, Self Joins, ALTER/UPDATE/DELETE

---

## 🔍 Cleaning Steps

### 1. Remove Duplicates
- Created a staging table (`layoff_staging`) to preserve the original data
- Used `ROW_NUMBER()` with `PARTITION BY` across all key columns to flag exact duplicates
- Deleted flagged duplicate rows from a second staging table (`layoff_staging2`)

### 2. Standardize the Data
- Trimmed leading/trailing whitespace from `company` names using `TRIM()`
- Consolidated inconsistent industry labels (e.g., `Crypto`, `Crypto Currency` → `Crypto`)
- Removed trailing punctuation from `country` values (e.g., `United States.` → `United States`)
- Converted `date` column from text format (`MM/DD/YYYY`) to proper SQL `DATE` type using `STR_TO_DATE()`

### 3. Handle Null and Blank Values
- Converted empty strings in `industry` to `NULL` for consistent null handling
- Used a **self-join** on the `company` column to impute missing `industry` values from other records of the same company (e.g., populated missing industry for Airbnb from a matching row)
- Retained rows where only one of `total_laid_off` or `percentage_laid_off` was null, as partial data still holds value

### 4. Remove Unnecessary Rows and Columns
- Deleted records where both `total_laid_off` and `percentage_laid_off` were null — these had no analytical value
- Dropped the helper `row_num` column after deduplication was complete

---

## 💡 Key Techniques

| Technique | Purpose |
|---|---|
| `ROW_NUMBER()` with `PARTITION BY` | Identify and remove exact duplicate rows |
| CTE (`WITH ... AS`) | Isolate duplicates before deletion |
| Self Join | Impute missing industry values from sibling records |
| `STR_TO_DATE()` + `ALTER COLUMN` | Fix incorrect data types |
| `TRIM()` / `LIKE` / `UPDATE` | Standardize inconsistent text fields |

---

## 📈 Outcome

The cleaned dataset is free of duplicates, has consistent categorical values, correct data types, and minimal nulls — making it ready for reliable exploratory data analysis or visualization.

---

## 📁 Files

| File | Description |
|---|---|
| `data_cleaning.sql` | Full SQL script with all cleaning steps |

---

## 🚀 How to Run

1. Import the raw dataset into MySQL as a table named `layoffs`
2. Run `data_cleaning.sql` sequentially
3. Query `layoff_staging2` for the final cleaned dataset

---

## 👤 Author

**Lucky Sinha**  
[GitHub](https://github.com/) • [LinkedIn](https://linkedin.com/)

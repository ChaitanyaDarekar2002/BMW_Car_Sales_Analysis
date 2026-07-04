# BMW Sales Data Analysis Project

## Project Overview

This project analyzes BMW sales data using **Python, SQL Server, and Power BI** to discover business insights, identify sales trends, and create an interactive dashboard for decision-making.

The workflow follows a complete data analytics process:

Raw Data → Python → SQL → Power BI Dashboard

---

## Objectives

* Clean and preprocess raw sales data
* Perform exploratory data analysis (EDA)
* Identify sales trends and patterns
* Analyze revenue and sales performance
* Create SQL queries for business insights
* Build an interactive Power BI dashboard

---

## Tools and Technologies

* Python
* Pandas
* Matplotlib
* SQL Server
* Power BI
* Jupyter Notebook

---

## Project Workflow

### Step 1: Data Collection

* Import BMW sales dataset (.csv)
* Understand dataset structure
* Identify columns and business requirements

### Step 2: Data Cleaning Using Python

Tasks performed:

* Removed duplicate records
* Handled missing values
* Converted data types
* Renamed columns
* Formatted date columns

Libraries used:

```python
import pandas as pd
import matplotlib.pyplot as plt
```

---

### Step 3: Exploratory Data Analysis (EDA)

Business questions analyzed:

* What is total revenue?
* Which BMW model has highest sales?
* Which region generates most revenue?
* What are monthly sales trends?
* What is average sales performance?

---

### Step 4: Data Visualization

Charts created:

1. Line Chart – Sales Trend
2. Bar Chart – Top Selling Models
3. Pie Chart – Region Sales Distribution
4. Donut Chart – Revenue Share
5. Histogram – Revenue Distribution
6. Scatter Plot – Units Sold vs Revenue
7. Box Plot – Outlier Detection
8. Area Chart – Monthly Sales
9. Horizontal Bar Chart – Model Revenue
10. Correlation Heatmap

---

### Step 5: SQL Analysis

Created SQL queries for:

* Total Revenue
* Top Selling Models
* Region-wise Revenue
* Monthly Sales Analysis
* Average Revenue
* Sales Performance Metrics

Views were created for Power BI integration.

Example:

```sql
CREATE VIEW vw_TopModels AS

SELECT Model,
SUM(Revenue) AS TotalRevenue
FROM BMW_Data
GROUP BY Model
```

---

### Step 6: Power BI Dashboard

Dashboard contains:

* KPI Cards
* Sales Trend Analysis
* Top Models Visualization
* Revenue Distribution
* Regional Analysis
* Interactive Filters
* Detailed Report Tables

---

## Key Insights

* Identified highest-performing BMW models
* Detected revenue trends over time
* Compared regional sales performance
* Found patterns in customer purchasing behavior

---

## Project Structure

```text
BMW-Sales-Analysis/

│
├── BMW_Sales_Data.csv
├── BMW_Clean_Data.csv
├── Data_Cleaning.ipynb
├── SQL_Queries.sql
├── PowerBI_Dashboard.pbix
├── Images
│     ├── Dashboard.png
│     └── Charts.png
│
└── README.md
```

---

## How to Run Project

1. Clone repository

```bash
git clone <repository-link>
```

2. Install required libraries

```bash
pip install pandas matplotlib
```

3. Run Jupyter Notebook

```bash
jupyter notebook
```

4. Execute SQL scripts in SQL Server

5. Connect SQL Server to Power BI

---

## Future Improvements

* Add machine learning sales prediction
* Deploy dashboard online
* Create automated data pipeline
* Add advanced KPIs

---

## Author

Data Analyst Portfolio Project

Created using Python, SQL, and Power BI

# 🚲 Bike Store Sales Analysis (2016–2017)

## Overview
Exploratory sales analysis of a multi-store bike retailer using SQL 
and Python, focusing on revenue trends, product category performance 
and growth drivers across three stores from 2016 to 2017.

## Tools & Technologies
- **Database:** PostgreSQL
- **Querying:** JupySQL (SQL in Jupyter Notebook)
- **Analysis:** Python (Pandas)
- **Visualisation:** Matplotlib, Seaborn

## Dataset
- **Source:** [Bike Store Relational Database](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database)
- **Scope:** 2016–2017 (2018 excluded due to incomplete data)
- **Tables used:** orders, order_items, stores, products, categories

## Key Findings
- Baldwin Bikes consistently generates 3–4x higher revenue than other stores
- Road Bikes launch accounted for 81.4% of Baldwin's 2017 growth
- Only Baldwin grew existing category revenue alongside Road Bikes
- Children Bicycles showed the strongest growth across all stores (66–78%)

## Files
| File | Description |
|------|-------------|
| [bike-store-analysis.html](./bike-store-analysis.html) | Clean report — findings and visualisations |
| [bike-store-analysis.ipynb](./bike-store-analysis.ipynb) | Full notebook — all SQL and Python code |
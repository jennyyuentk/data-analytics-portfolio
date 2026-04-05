# Bike Store Sales Analysis (2016–2017)

## Overview
Exploratory sales analysis of a multi-store bike retailer using SQL and Python, focusing on revenue trends, product performance, and growth drivers across three stores from 2016 to 2017.

## Business Questions
- Which store is the top performer and why?
- What drove Baldwin Bikes' 55.9% revenue growth in 2017?
- How does product category mix differ across stores?
- How do individual staff members contribute to store performance?

## Tools & Technologies
- **Database:** PostgreSQL
- **Querying:** JupySQL (SQL in Jupyter Notebook)
- **Analysis:** Python (pandas)
- **Visualization:** Matplotlib

## Dataset
- Source: [Bike Store Relational Database](https://www.kaggle.com/datasets/dillonmyrick/bike-store-sample-database?select=order_items.csv)
- Scope: 2016–2017 (2018 excluded due to incomplete data — only 292 orders vs ~660/year)
- Tables used: orders, order_items, stores, staffs, products, categories

## Key Findings
- **Baldwin Bikes dominates** — consistently 3–4x higher revenue than Rowlett and Santa Cruz
- **Road Bikes launch drove 81.4% of Baldwin's 2017 growth** — a new category that generated $724k in its first year
- **Baldwin captured 68% of chain-wide Road Bikes revenue** despite being one of three stores, suggesting a location or demand advantage
- **Organic growth accounted for 18.6%** of Baldwin's growth, confirming existing categories were already on a positive trajectory

## Analysis Structure
1. **Data Quality Check** — identified incomplete 2018 data, scoped analysis to 2016–2017
2. **Macro Trend** — 3-month moving average across all stores (2016–2017)
3. **Store Deep Dive** — Baldwin Bikes monthly sales breakdown
4. **Category Analysis** — 2016 vs 2017 comparison by product category
5. **Growth Attribution** — separated Road Bikes effect vs organic growth
6. **Staff Performance** — individual staff contribution and category breakdown

## Business Recommendations
- Investigate why Baldwin captures disproportionate Road Bikes demand compared to other stores
- Monitor Electric Bikes — growing in both volume and avg price, indicating an expanding premium segment

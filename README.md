# E-commerce Furniture Analysis Project

## Overview
This project analyzes an e-commerce furniture product dataset, exploring pricing, discounts, shipping options, and sales performance to identify trends in what drives furniture sales online.

## Dataset
- **File:** `e-commerce_furniture_analysis.csv`
- **Records:** 2,000 rows
- **Key Columns:** productTitle, originalPrice, price, sold, tagText (shipping info)

## Objectives
- Clean and explore furniture product pricing and sales data
- Identify best-selling and highest-revenue products
- Analyze the impact of discounts and shipping type on sales
- Explore price-range distributions and sales correlations

## Tools & Technologies
- Python (Pandas, Matplotlib, Seaborn)
- Jupyter Notebook
- SQL (MySQL)

## Project Structure
```
├── Ecommerce_Furniture_Analysis.ipynb     # EDA & visualizations
├── e-commerce_furniture_analysis.csv      # Raw dataset
├── ecommerce_furniture_sql_queries.sql    # 10 analytical SQL queries
└── README.md
```

## SQL Queries Included
1. Top 10 best-selling products
2. Products with the highest discount
3. Average price and average units sold overall
4. Free shipping vs paid shipping - sales comparison
5. Price range distribution (buckets)
6. Total revenue estimate (top 10 products)
7. Products with zero sales
8. Highest priced products
9. Average discount percentage across discounted products
10. Price under $100 vs sales performance comparison

## How to Run
1. Open `Ecommerce_Furniture_Analysis.ipynb` in Jupyter Notebook
2. Run all cells to reproduce the EDA and charts
3. Import `e-commerce_furniture_analysis.csv` into MySQL as table `ecommerce_clean`
4. Run queries from `ecommerce_furniture_sql_queries.sql`

## Author
Meghana Cheedella 

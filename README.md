# 📊 Sales Performance Analytics Dashboard

A complete end-to-end data analytics project analyzing 9,994+ sales records from a Superstore dataset. Built using Python, SQL (PostgreSQL), and Power BI.

---

## 🔧 Tools Used
| Tool | Purpose |
|------|---------|
| Python (Pandas) | Data cleaning & feature engineering |
| PostgreSQL (PgAdmin) | Data exploration & business queries |
| Power BI | Interactive dashboard |

---

## 📁 Project Structure
```
sales-analytics-dashboard/
├── data/
│   └── superstore_cleaned.csv       # Cleaned dataset
├── cleaning.ipynb                   # Python data cleaning notebook
├── queries.sql                      # SQL business queries
├── Sales_Analytics_Dashboard.pbix                   # Power BI dashboard
└── README.md
```

---

## 📌 Key Findings
- **West region** generated the highest sales ($725K) and profit ($108K)
- **Technology** was the top-performing category with $836K in sales
- **Consumer segment** contributed the highest revenue among all segments
- Sales **peaked in November & December**, indicating strong year-end demand
- **High discounts (40%+)** resulted in negative average profit (-$106)

---

## 📊 Dashboard Preview

> Power BI Dashboard with KPI cards, regional analysis, category breakdown, and monthly trends.

**KPIs:**
- Total Sales: $2.30M
- Total Profit: $286.40K
- Profit Margin: 120.24K

---

## 🗄️ SQL Queries Covered
1. Total Sales, Profit & Orders
2. Sales & Profit by Region
3. Sales & Profit by Category
4. Top 10 Products by Sales
5. Top 10 Loss-Making Products
6. Yearly Sales Trend
7. Monthly Sales Trend
8. Sales by Customer Segment
9. Top 10 Customers by Revenue
10. Shipping Mode Analysis
11. State-wise Sales (Top 10)
12. Discount Impact on Profit

---

## 🚀 How to Run

**Python Cleaning:**
```bash
pip install pandas numpy
jupyter notebook cleaning.ipynb
```

**SQL:**
- Import `superstore_cleaned.csv` into PostgreSQL
- Run queries from `queries.sql` in PgAdmin

**Power BI:**
- Open `dashboard.pbix` in Power BI Desktop
- Refresh data source if needed

---

## 📬 Contact
**Sayed Rashid Ali** — [LinkedIn](https://linkedin.com) | jishanronin09@gmail.com

# AI-Powered-Sales-Forecasting-System
# AI-Powered Sales Forecasting System

## 📌 Project Overview
This project focuses on analyzing historical sales data using SQL and preparing it for AI-based forecasting. The goal is to extract meaningful business insights and build a foundation for predictive modeling.

The system uses structured data stored in a relational database and applies SQL queries for data analysis, feature engineering, and trend identification.

---

## 🛠️ Tech Stack
- SQL (MySQL)
- Python (for future ML integration)
- Pandas, NumPy
- Power BI / Tableau (for visualization)

---

## 📂 Project Structure


AI-Sales-Forecasting/
│
├── sql/
│ ├── schema.sql
│ ├── data_generation.sql
│ ├── queries.sql
│
├── notebooks/
│ └── sales_forecasting.ipynb
│
├── dashboard/
│ └── powerbi_dashboard.pbix
│
└── README.md




---

## 🗄️ Database Design

### Tables:
- **customers** → Stores customer details  
- **products** → Stores product information  
- **orders** → Stores order transactions  
- **order_details** → Stores sales and quantity  

This structure ensures proper normalization and supports complex queries using joins.

---

## 🔗 Key SQL Operations

### 1. Data Generation
- Generated 1000+ records using stored procedures  
- Simulated real-world sales transactions  

### 2. Joins Used
- INNER JOIN → Combine orders, customers, and products  
- LEFT JOIN → Identify missing relationships  
- RIGHT JOIN → Product-level analysis  
- FULL JOIN (simulated) → Complete data coverage  

---

## 📊 Key Analysis Performed

### 🔹 Monthly Sales Trend
- Identified seasonal patterns in sales  

### 🔹 Top Performing Products
- Ranked products based on revenue  

### 🔹 Region-wise Sales Analysis
- Compared performance across regions  

### 🔹 High-Value Customers
- Identified customers contributing highest revenue  

---

## 🤖 AI Preparation (Feature Engineering)

Created dataset for machine learning:
- Total orders per customer  
- Total spending  
- Average order value  

This dataset can be used for:
- Sales forecasting  
- Customer segmentation  
- Revenue prediction  

---

## 📈 Future Enhancements

- Build machine learning model for sales forecasting  
- Deploy prediction system using Streamlit  
- Integrate real-time data pipeline  

---

## 💡 Key Learnings

- Importance of data cleaning and structured schema  
- Writing efficient SQL queries for large datasets  
- Using SQL as a foundation for AI models  

---

## 📢 Conclusion
This project demonstrates how SQL can be effectively used for data analysis and preparing datasets for AI applications. It highlights the importance of data processing before applying machine learning models.

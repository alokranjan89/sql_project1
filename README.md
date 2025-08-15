# 🛍 Retail Sales SQL Analysis Project

## 📌 Overview
This project is a **SQL-based analysis** of a retail sales dataset.  
The goals included:
- **Creating and structuring** the database.
- **Importing** CSV data into MySQL.
- **Cleaning the dataset** (removing NULL values).
- **Exploring** data to answer important business questions.

---

## 📂 Dataset Information

**Table Name:** `retail_sales`

| Column           | Data Type        | Description |
|------------------|------------------|-------------|
| transactions_id  | INT (Primary Key) | Unique transaction identifier |
| sale_date        | DATE              | Date of the sale |
| sale_time        | TIME              | Time of the sale |
| customer_id      | INT               | Unique customer identifier |
| gender           | VARCHAR(10)       | Gender of the customer |
| age              | INT               | Age of the customer |
| category         | VARCHAR(50)       | Product category |
| quantity         | INT               | Quantity sold |
| price_per_unit   | DECIMAL(10,2)     | Price per unit of product |
| cogs             | DECIMAL(10,2)     | Cost of goods sold |
| total_sale       | DECIMAL(10,2)     | Total sale value |

---

## ⚙️ Step-by-Step Process

### 1️⃣ Database & Table Creation
```sql
CREATE DATABASE sql_project1;
USE sql_project1;

CREATE TABLE retail_sales (
    transactions_id   INT PRIMARY KEY,
    sale_date         DATE,
    sale_time         TIME,
    customer_id       INT,
    gender            VARCHAR(10),
    age               INT,
    category          VARCHAR(50),
    quantity          INT,
    price_per_unit    DECIMAL(10,2),
    cogs              DECIMAL(10,2),
    total_sale        DECIMAL(10,2)
);



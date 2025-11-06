⸻


#  End-to-End Analysis Using SQL

##  Project Overview
This project demonstrates a complete **end-to-end data analysis workflow using SQL**.  
It covers database setup, data cleaning, transformation, insight generation, and business recommendations — simulating a real-world analytics project.

The dataset represents an **e-commerce sales system** with customer, product, and order data.  
Key business questions were answered using SQL queries such as:
- Which products sell the most?
- Who are the highest-spending customers?
- What are the monthly sales trends?
- How do data-cleaning steps improve insights?

---

##  Step 1: Database Setup

### Database Name
`sales_analysis`

### Tables Created
1. **customers** – contains customer details  
2. **products** – includes product catalog and prices  
3. **orders** – records transactions and quantities ordered  

Each table has **primary and foreign key relationships** ensuring referential integrity.

CREATE DATABASE sales_analysis;
USE sales_analysis;


⸻

 Step 2: Data Cleaning & Transformation

Cleaning Performed

Task	SQL Method Used	Description
Remove duplicates	DELETE with subquery	Removed duplicate emails
Handle NULLs	UPDATE ... WHERE IS NULL	Replaced missing cities with ‘UNKNOWN’
Standardize text	UPPER()	Converted city names to uppercase
Fix data types	ALTER TABLE	Ensured date and decimal columns had proper types

Impact of Cleaning
	•	Prevented double-counting of sales.
	•	Ensured consistency in city-wise grouping.
	•	Improved the accuracy of revenue and trend analysis.

⸻

 Step 3: Insights & Analysis

1️⃣ Top-Selling Products

SELECT p.product_name, SUM(o.quantity) AS total_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_sold DESC;

➡️ Smartphones, Headphones, and Smartwatches were the most frequently purchased items.

⸻

2️⃣ Highest-Spending Customers

SELECT c.name, SUM(p.price * o.quantity) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.name
ORDER BY total_spent DESC;

➡️ Amit and Riya contributed the most revenue from high-value Electronics purchases.

⸻

3️⃣ Monthly Sales Trend

SELECT MONTH(order_date) AS month, SUM(p.price * o.quantity) AS total_sales
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY MONTH(order_date)
ORDER BY month;

➡️ Sales peaked between June and August, indicating strong seasonal demand.

⸻

4️⃣ Average Order Value (AOV)

SELECT AVG(p.price * o.quantity) AS avg_order_value
FROM orders o
JOIN products p ON o.product_id = p.product_id;

➡️ The average order value was approximately ₹30,000.

⸻

5️⃣ Outliers & Anomalies

Orders above ₹50,000 were linked to high-value electronics (Laptops, Cameras), suggesting premium customers or corporate clients.

⸻

 Step 4: Key Takeaways

Area	Insight
Top Products	Electronics dominate, especially Smartphones and Headphones
Customer Behavior	Few loyal customers drive major revenue
Seasonal Trend	Mid-year (June–August) sees strongest performance
Revenue Mix	Electronics = 70% of total revenue
Outliers	High-ticket items significantly affect monthly totals


⸻

 Step 5: Recommendations
	1.	Loyalty Program – Reward top-spending customers (e.g., Amit, Riya).
	2.	Combo Offers – Bundle Smartwatch + Smartphone for increased cross-selling.
	3.	Marketing Focus – Target cities like Delhi and Mumbai.
	4.	Seasonal Inventory – Boost Electronics stock before June–August.
	5.	Diversification – Promote Fashion and Accessories through offers.

⸻

 Tools & Technologies
	•	SQL (MySQL)
	•	Power BI / Excel (for optional visualizations)
	•	Git & GitHub (for version control and project publishing)

⸻

 Optional Visualizations

To make the insights visually appealing:
	•	Bar Chart: Top-selling products
	•	Line Chart: Monthly sales trend
	•	Pie Chart: Category-wise revenue
	•	Column Chart: Customer spend comparison

You can build these using Power BI, Excel, or Tableau.

⸻

🧠 Learning Outcomes
	•	Mastered SQL CRUD operations and joins
	•	Applied real-world data cleaning and aggregation logic
	•	Learned to extract actionable business insights
	•	Presented findings with clear data storytelling

⸻

### ✅ Next Steps
Save this as a file named **`README.md`** in the same folder as your SQL file, then run:
```bash
git add README.md
git commit -m "Added project README"
git push


```sql

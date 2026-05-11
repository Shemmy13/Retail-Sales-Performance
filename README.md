# Retail-Sales-Performance
This project delivers a comprehensive Business Intelligence solution designed to help a retail organization optimize sales performance and understand customer purchasing patterns. By architecting a relational database from scratch and building an interactive Power BI dashboard, I transformed raw operational data into actionable, executive-level insights focused on regional performance, product profitability, and supply chain efficiency.

🛠️ Tech Stack
Database Management & Engineering: SQL Server (DDL, Procedural logic, Primary/Foreign Key relationships)

Data Modeling: Power BI (Star Schema, One-to-Many Relationships)

Analytics: DAX (Time Intelligence, Statistical Measures, Conditional Logic)

Visualization: Power BI Desktop

🏗️ Phase 1: Data Engineering & Architecture (SQL)
To simulate a real-world enterprise environment, I engineered a robust relational database using a Star Schema architecture. Rather than relying on static flat files, I utilized procedural SQL to dynamically generate and link transaction data.

Fact Table: Sales (Contains transaction metrics including quantity, sales amount, and applied discounts).

Dimension Tables: Customers, Products, Salespersons, and a dynamically generated DateTable for time-intelligence analysis.

🔗 Phase 2: Relational Data Modeling (Power BI)
After importing the SQL tables into Power BI, I established active One-to-Many (1:*) relationships between the central Sales fact table and all dimension tables. This Star Schema served as the "brain" of the project, allowing for seamless filtering and complex calculations across different business dimensions (e.g., analyzing a salesperson's performance against specific regional product sales) without losing data integrity.

🧪 Phase 3: Advanced Analytics & Business Logic (DAX)
Using Data Analysis Expressions (DAX), I developed a suite of high-impact KPIs to answer critical stakeholder questions:

Growth Tracking: Calculated Year-over-Year (YoY) Sales Growth, uncovering a critical -15.00% decline requiring immediate executive review.

Profitability Logic: Combined Total Profit ($34.97K) and Profit Margin (22.70%) to identify the "High Sales, Low Profit" paradox, pinpointing underperforming product lines driven by heavy discounting.

Segment Behavior: Utilized the DIVIDE function to calculate Average Order Value (AOV) error-free, revealing the true monetary value of Corporate vs. Consumer segments.

AOV = DIVIDE([Total Sales], [Total Orders], 0)

🚚 Phase 4: The Hidden Insight (Operational Deep-Dive)
While the primary dashboard focuses on financial KPIs, I developed a backend measure to audit supply chain efficiency and its potential impact on the -15% sales decline: On-Time Delivery Rate (%).

By writing DAX to measure the variance between the OrderDate and the ShipDate generated in my SQL model, I was able to investigate whether logistical delays were a contributing factor to the drop in repeat customer orders. This demonstrates the ability to link operational pipeline data directly to financial outcomes.

📊 Phase 5: Dashboard Highlights
The final Power BI dashboard was designed with a Corporate Executive aesthetic, prioritizing a high Data-Ink ratio and immediate clarity.

Regional Intelligence: Identified the North region as the primary revenue driver, while highlighting the East region as a key area for targeted marketing growth.

VIP Tracking: Integrated a dynamic Top 10 Customers matrix. By sorting revenue descending, high-value stakeholders like Pinnacle Inc ($11,671.45) are immediately visible.

Semantic Formatting: Applied a Muted Garnet (#991B1B) conditional format to the negative YoY Growth KPI. This intentional design choice signals underperformance to executives without cluttering the professional visual theme with bright, "alarming" colors.

# 1️⃣ Import pandas
import pandas as pd

# 2️⃣ Read the datasets
employees = pd.read_csv("data/employees.csv")
departments = pd.read_csv("data/departments.csv")
sales = pd.read_csv("data/sales.csv")

# 3️⃣ Display first 5 rows
print("EMPLOYEES DATA")
print(employees.head())

print("\nDEPARTMENTS DATA")
print(departments.head())

print("\nSALES DATA")
print(sales.head())

# 4️⃣ Check the size of each dataset

print("\n--- DATASET SIZE ---")

print("Employees:", employees.shape)
print("Departments:", departments.shape)
print("Sales:", sales.shape)


# 5️⃣ Check column names

print("\n--- EMPLOYEE COLUMNS ---")
print(employees.columns.tolist())

print("\n--- DEPARTMENT COLUMNS ---")
print(departments.columns.tolist())

print("\n--- SALES COLUMNS ---")
print(sales.columns.tolist())


# 6️⃣ Check missing values

print("\n--- MISSING VALUES ---")

print("Employees:")
print(employees.isnull().sum())

print("\nDepartments:")
print(departments.isnull().sum())

print("\nSales:")
print(sales.isnull().sum())

# 7️⃣ Basic Business Analysis

print("\n--- COMPANY PERFORMANCE ---")

# Total Sales
total_sales = sales["Sales"].sum()
print("Total Sales:", total_sales)

# Total Profit
total_profit = sales["Profit"].sum()
print("Total Profit:", total_profit)

# Average Sales
average_sales = sales["Sales"].mean()
print("Average Sales:", average_sales)

# Average Profit
average_profit = sales["Profit"].mean()
print("Average Profit:", average_profit)

# Total Orders
total_orders = sales["OrderID"].nunique()
print("Total Orders:", total_orders)

# Total Customers
total_customers = sales["CustomerName"].nunique()
print("Total Customers:", total_customers)

# Average Discount
average_discount = sales["Discount"].mean()
print("Average Discount:", average_discount)

# 8️⃣ Sales by Region

print("\n--- SALES BY REGION ---")

region_sales = sales.groupby("Region")["Sales"].sum().sort_values(ascending=False)

print(region_sales)


# 9️⃣ Sales by Category

print("\n--- SALES BY CATEGORY ---")

category_sales = sales.groupby("Category")["Sales"].sum().sort_values(ascending=False)

print(category_sales)


# 🔟 Profit by Category

print("\n--- PROFIT BY CATEGORY ---")

category_profit = sales.groupby("Category")["Profit"].sum().sort_values(ascending=False)

print(category_profit)


# 1️⃣1️⃣ Sales by Employee

print("\n--- SALES BY EMPLOYEE ---")

employee_sales = sales.groupby("EmployeeID")["Sales"].sum().sort_values(ascending=False)

print(employee_sales)


# 1️⃣2️⃣ Sales by Year

print("\n--- SALES BY YEAR ---")

sales["Date"] = pd.to_datetime(sales["Date"])

yearly_sales = sales.groupby(sales["Date"].dt.year)["Sales"].sum()

print(yearly_sales)

# 1️⃣ Import SQLite
import sqlite3

# 2️⃣ Create/connect to database
connection = sqlite3.connect("company_insights.db")

# 3️⃣ Save our DataFrames as SQL tables
employees.to_sql("employees", connection, if_exists="replace", index=False)
departments.to_sql("departments", connection, if_exists="replace", index=False)
sales.to_sql("sales", connection, if_exists="replace", index=False)

print("\n--- DATABASE CREATED SUCCESSFULLY ---")

# 4️⃣ Close connection
connection.close()


















































# Database Schema Documentation

## Entity-Relationship Description

### ENTITY: customers
**Purpose:** Stores customer information for FlexiMart.

**Attributes:**
- customer_id: Unique identifier for each customer (Primary Key)
- first_name: Customer's first name
- last_name: Customer's last name
- email: Customer's email address
- phone: Customer's contact number
- city: City where the customer resides
- registration_date: Date when the customer registered

**Relationships:**
- One customer can place many orders (1:M relationship with sales table)

---

### ENTITY: products
**Purpose:** Stores product details available for sale.

**Attributes:**
- product_id: Unique identifier for each product (Primary Key)
- product_name: Name of the product
- category: Product category
- price: Price of the product
- stock_quantity: Available stock quantity

**Relationships:**
- One product can appear in many sales transactions (1:M relationship with sales table)

---

### ENTITY: sales
**Purpose:** Stores transaction-level sales data.

**Attributes:**
- transaction_id: Unique identifier for each transaction (Primary Key)
- customer_id: References the customer who made the purchase (Foreign Key)
- product_id: References the product sold (Foreign Key)
- quantity: Number of units purchased
- unit_price: Price per unit at time of sale
- transaction_date: Date of transaction
- status: Status of the transaction (Completed/Pending)

**Relationships:**
- Many sales belong to one customer
- Many sales involve one product

## Normalization Explanation (Third Normal Form)

The database schema for FlexiMart is designed to follow Third Normal Form (3NF) to
ensure data integrity, reduce redundancy, and avoid data anomalies.

In the customers table, the primary key customer_id uniquely identifies each
customer. All other attributes such as first_name, last_name, email, phone,
city, and registration_date depend only on customer_id and not on any other
non-key attribute. There are no partial or transitive dependencies, ensuring
the table satisfies 3NF.

In the products table, product_id is the primary key and uniquely determines
product_name, category, price, and stock_quantity. Each attribute is fully
functionally dependent on product_id, and no attribute depends on another
non-key attribute. This prevents update anomalies, such as having to update
product prices in multiple places.

In the sales table, transaction_id serves as the primary key. Attributes such
as quantity, unit_price, transaction_date, and status depend solely on
transaction_id. Foreign keys customer_id and product_id reference the
customers and products tables, ensuring referential integrity without
duplicating customer or product information.

This design avoids update anomalies by storing customer and product details
only once. Insert anomalies are avoided because new customers or products can
be added independently of sales. Delete anomalies are prevented because
removing a sales record does not delete customer or product information.
Overall, the schema satisfies Third Normal Form by ensuring that every
non-key attribute depends only on the primary key and nothing else.

## Sample Data Representation

### customers table

| customer_id | first_name | last_name | email                  | city      |
|------------|------------|-----------|------------------------|-----------|
| C001       | Rahul      | Sharma    | rahul.sharma@gmail.com | Bangalore |
| C002       | Priya      | Patel     | priya.patel@yahoo.com  | Mumbai   |

---

### products table

| product_id | product_name        | category     | price   | stock_quantity |
|-----------|---------------------|--------------|---------|----------------|
| P001      | Samsung Galaxy S21  | Electronics  | 45999   | 150            |
| P004      | Levi's Jeans        | Fashion      | 2999    | 120            |

---

### sales table

| transaction_id | customer_id | product_id | quantity | unit_price | status    |
|---------------|------------|------------|----------|------------|-----------|
| T001          | C001       | P001       | 1        | 45999      | Completed |
| T002          | C002       | P004       | 2        | 2999       | Completed |


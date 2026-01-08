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

// ============================================
// Operation 1: Load Data
// Import the provided JSON file into collection 'products'
// ============================================

// Switch to database
use fleximart_nosql;

// Insert product catalog data
db.products.insertMany([
  // Data loaded from products_catalog.json
]);
// ============================================
// Operation 2: Basic Query
// Find all products in "Electronics" category
// with price less than 50000
// Return only name, price, and stock
// ============================================

db.products.find(
  { category: "Electronics", price: { $lt: 50000 } },
  { _id: 0, name: 1, price: 1, stock: 1 }
);
// ============================================
// Operation 3: Review Analysis
// Find products with average rating >= 4.0
// Uses aggregation on reviews array
// ============================================

db.products.aggregate([
  { $unwind: "$reviews" },
  {
    $group: {
      _id: "$name",
      avg_rating: { $avg: "$reviews.rating" }
    }
  },
  { $match: { avg_rating: { $gte: 4.0 } } }
]);
// ============================================
// Operation 4: Update Operation
// Add a new review to product "ELEC001"
// ============================================

db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: ISODate()
      }
    }
  }
);
// ============================================
// Operation 5: Complex Aggregation
// Calculate average price by category
// Return category, avg_price, product_count
// ============================================

db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  {
    $project: {
      _id: 0,
      category: "$_id",
      avg_price: 1,
      product_count: 1
    }
  },
  { $sort: { avg_price: -1 } }
]);

class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final String imageUrl;
  final int stockQuantity;
  final String sku;
  final bool isActive;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    required this.stockQuantity,
    required this.sku,
    this.isActive = true,
  });

  // Mock data for demonstration
  static List<Product> getMockProducts() {
    return [
      Product(
        id: '1',
        name: 'Espresso',
        description: 'Rich and bold espresso shot',
        price: 2.50,
        category: 'Coffee',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 100,
        sku: 'ESP001',
      ),
      Product(
        id: '2',
        name: 'Cappuccino',
        description: 'Creamy cappuccino with foam art',
        price: 4.50,
        category: 'Coffee',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 85,
        sku: 'CAP001',
      ),
      Product(
        id: '3',
        name: 'Americano',
        description: 'Smooth americano coffee',
        price: 3.25,
        category: 'Coffee',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 120,
        sku: 'AME001',
      ),
      Product(
        id: '4',
        name: 'Latte',
        description: 'Creamy latte with steamed milk',
        price: 4.75,
        category: 'Coffee',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 90,
        sku: 'LAT001',
      ),
      Product(
        id: '5',
        name: 'Croissant',
        description: 'Buttery and flaky croissant',
        price: 3.00,
        category: 'Pastry',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 45,
        sku: 'CRO001',
      ),
      Product(
        id: '6',
        name: 'Chocolate Muffin',
        description: 'Rich chocolate chip muffin',
        price: 2.75,
        category: 'Pastry',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 30,
        sku: 'MUF001',
      ),
      Product(
        id: '7',
        name: 'Green Tea',
        description: 'Premium green tea',
        price: 2.25,
        category: 'Tea',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 200,
        sku: 'TEA001',
      ),
      Product(
        id: '8',
        name: 'Sandwich',
        description: 'Fresh deli sandwich',
        price: 7.50,
        category: 'Food',
        imageUrl: 'assets/images/flutter_logo.png',
        stockQuantity: 25,
        sku: 'SAN001',
      ),
    ];
  }
}

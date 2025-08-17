import 'cart_item.dart';

class Order {
  final String id;
  final DateTime dateTime;
  final List<CartItem> items;
  final double subtotal;
  final double tax;
  final double discount;
  final String status;
  final String? customerName;

  Order({
    required this.id,
    required this.dateTime,
    required this.items,
    required this.subtotal,
    required this.tax,
    this.discount = 0.0,
    this.status = 'Completed',
    this.customerName,
  });

  double get total => subtotal + tax - discount;

  int get totalItems => items.fold(0, (sum, item) => sum + item.quantity);

  // Mock data for demonstration
  static List<Order> getMockOrders() {
    return [
      Order(
        id: 'ORD001',
        dateTime: DateTime.now().subtract(const Duration(hours: 1)),
        items: [
          CartItem(
            productId: '1',
            productName: 'Espresso',
            price: 2.50,
            quantity: 2,
            imageUrl: 'assets/images/flutter_logo.png',
          ),
          CartItem(
            productId: '5',
            productName: 'Croissant',
            price: 3.00,
            quantity: 1,
            imageUrl: 'assets/images/flutter_logo.png',
          ),
        ],
        subtotal: 8.00,
        tax: 0.80,
        customerName: 'John Doe',
      ),
      Order(
        id: 'ORD002',
        dateTime: DateTime.now().subtract(const Duration(hours: 2)),
        items: [
          CartItem(
            productId: '2',
            productName: 'Cappuccino',
            price: 4.50,
            quantity: 1,
            imageUrl: 'assets/images/flutter_logo.png',
          ),
        ],
        subtotal: 4.50,
        tax: 0.45,
        customerName: 'Jane Smith',
      ),
      Order(
        id: 'ORD003',
        dateTime: DateTime.now().subtract(const Duration(hours: 3)),
        items: [
          CartItem(
            productId: '4',
            productName: 'Latte',
            price: 4.75,
            quantity: 2,
            imageUrl: 'assets/images/flutter_logo.png',
          ),
          CartItem(
            productId: '6',
            productName: 'Chocolate Muffin',
            price: 2.75,
            quantity: 2,
            imageUrl: 'assets/images/flutter_logo.png',
          ),
        ],
        subtotal: 15.00,
        tax: 1.50,
        discount: 2.00,
        customerName: 'Mike Johnson',
      ),
    ];
  }
}

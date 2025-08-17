class CartItem {
  final String productId;
  final String productName;
  final double price;
  int quantity;
  final String imageUrl;

  CartItem({
    required this.productId,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.imageUrl,
  });

  double get totalPrice => price * quantity;
}

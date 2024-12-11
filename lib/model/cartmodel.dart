class CartItem {
  final int id;
  final String productName;
  final int quantity;
  final double price;
  final double total;

  CartItem({
    required this.id,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.total,
  });

  // Factory constructor to create a CartItem from JSON
  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],  // Assuming 'id' is in the response
      productName: json['product_name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      total: json['total'].toDouble(),  // Ensure 'total' is present in the JSON
    );
  }

  // Convert CartItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product_name': productName,
      'quantity': quantity,
      'price': price,
      'total': total,
    };
  }
}

//
// import 'dart:convert';
//
// class CartModel {
//   final int id;
//   final int productId;
//   final String productName;
//   final int quantity;
//   final double price;
//
//   CartModel({
//     required this.id,
//     required this.productId,
//     required this.productName,
//     required this.quantity,
//     required this.price,
//   });
//
//   factory CartModel.fromJson(Map<String, dynamic> json) {
//     return CartModel(
//       id: json['id'],
//       productId: json['product'],
//       productName: json['product_name'],
//       quantity: json['quantity'],
//       price: double.parse(json['price']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'product': productId,
//       'product_name': productName,
//       'quantity': quantity,
//       'price': price.toString(),
//     };
//   }
// }

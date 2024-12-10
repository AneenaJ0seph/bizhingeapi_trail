import 'dart:convert';
import 'cartmodel.dart';  // Make sure CartItem is imported

// Function to convert JSON string to List of Orders
List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

// Order model class
class Order {
  final int? businessUserId; // Nullable businessUserId
  final double? totalPrice; // Nullable totalPrice
  final String billingAddress; // String for billing address
  final String? status; // Nullable status
  final String? orderType; // Nullable orderType
  final List<CartItem> orderProducts; // List of CartItem objects

  Order({
    this.businessUserId,
    this.totalPrice,
    required this.billingAddress,
    this.status,
    this.orderType,
    required this.orderProducts,
  });

  // Factory constructor to create an instance from JSON
  factory Order.fromJson(Map<String, dynamic> json) {
    var list = json['order_products'] as List; // Ensure 'order_products' key exists
    List<CartItem> productList = list.map((i) => CartItem.fromJson(i)).toList();  // Map each item to CartItem

    return Order(
      businessUserId: json['business_user'], // Nullable
      totalPrice: json['total_price'], // Nullable
      billingAddress: json['billing_address'] ?? '', // Default to empty string
      status: json['status'], // Nullable
      orderType: json['order_type'], // Nullable
      orderProducts: productList, // List of CartItem objects
    );
  }

  // Method to convert the object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'business_user': businessUserId,
      'total_price': totalPrice,
      'billing_address': billingAddress,
      'status': status,
      'order_type': orderType,
      'order_products': orderProducts.map((e) => e.toJson()).toList(), // Convert each CartItem to JSON
    };
  }
}

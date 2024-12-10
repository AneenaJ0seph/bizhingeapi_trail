import 'package:http/http.dart' as http;
import 'dart:convert';

import '../model/categorymodel.dart';
import '../model/productmodel.dart';
import '../model/usermodel.dart';
import '../model/ordermodel.dart'; // Assuming you have an Order model

class ApiService {
  static const String baseUrl = 'https://apib2b-production.up.railway.app/api';

  // Fetch categories
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/'));

    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  // Fetch products
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products/'));

    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  // Fetch business users
  Future<List<BusinessUser>> fetchBusinessUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/business_users/'));

    if (response.statusCode == 200) {
      return businessUserFromJson(response.body);
    } else {
      throw Exception('Failed to fetch business users');
    }
  }

  // Fetch orders
  Future<List<Order>> fetchOrders() async {
    final response = await http.get(Uri.parse('$baseUrl/orders/'));

    if (response.statusCode == 200) {
      return orderFromJson(response.body); // Convert JSON response to a list of Order objects
    } else {
      throw Exception('Failed to fetch orders');
    }
  }

  // Place an order
  Future<Order> placeOrder(Order order) async {
    final response = await http.post(
      Uri.parse('$baseUrl/orders/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(order.toJson()), // Convert the order to JSON
    );

    if (response.statusCode == 201) {
      // Order placed successfully
      return Order.fromJson(jsonDecode(response.body));
    } else {
      // Throw an error for a failed request
      throw Exception('Failed to place order: ${response.statusCode}');
    }
  }
}

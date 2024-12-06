import 'package:http/http.dart' as http;

import '../model/categorymodel.dart';
import '../model/productmodel.dart';
import '../model/usermodel.dart';

class ApiService {
  static const String baseUrl = 'https://apib2b-production.up.railway.app/api';

  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/'));

    if (response.statusCode == 200) {
      return categoryFromJson(response.body);
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products/'));

    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      throw Exception('Failed to fetch products');
    }
  }

  Future<List<BusinessUser>> fetchBusinessUsers() async {
    final response = await http.get(Uri.parse('$baseUrl/business_users/'));

    if (response.statusCode == 200) {
      return businessUserFromJson(response.body);
    } else {
      throw Exception('Failed to fetch business users');
    }
  }
}

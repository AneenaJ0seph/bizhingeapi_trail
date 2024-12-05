import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/cartcontroller.dart';
import '../../model/productmodel.dart';

class ProductDetail extends StatelessWidget {
  final Product product;

  const ProductDetail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the CartController
    final CartController cartController = Get.put(CartController());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          product.productName ?? 'Product Details',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: Image.network(
                product.image ?? 'https://via.placeholder.com/150',
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // Product Name
            Text(
              product.productName ?? 'Unnamed Product',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              'Price: ₹${product.price ?? 'N/A'}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 30),

            // Product Description
            Text(
              product.productDetails ?? 'No description available.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),

            // Add to Cart Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  cartController.addToCart(product);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

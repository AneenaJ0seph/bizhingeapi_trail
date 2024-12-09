// import 'package:get/get.dart';
// import '../model/productmodel.dart';
//
// class CartController extends GetxController {
//   var cartItems = <Product>[].obs;
//   var quantities = <Product, int>{}.obs;
//
//   // Calculate total price
//   double get totalPrice => cartItems.fold(
//         0,
//         (sum, item) {
//           final itemPrice = item.price ?? 0.0; // Use double directly
//           return sum + (itemPrice * (quantities[item] ?? 1));
//         },
//       );
//
//   // Add item to cart
//   void addToCart(Product product) {
//     if (cartItems.contains(product)) {
//       quantities[product] = (quantities[product] ?? 1) + 1;
//     } else {
//       cartItems.add(product);
//       quantities[product] = 1;
//     }
//
//     Get.snackbar(
//       'Added to Cart',
//       '${product.productName} has been added to your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   // Remove item from cart
//   void removeFromCart(Product product) {
//     if (quantities[product] != null && quantities[product]! > 1) {
//       quantities[product] = quantities[product]! - 1;
//     } else {
//       cartItems.remove(product);
//       quantities.remove(product);
//     }
//
//     Get.snackbar(
//       'Removed from Cart',
//       '${product.productName} has been removed from your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   // Clear the entire cart
//   void clearCart() {
//     cartItems.clear();
//     quantities.clear();
//     Get.snackbar(
//       'Cart Cleared',
//       'All items have been removed from your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
// }

//.........
// import 'package:get/get.dart';
// import '../model/productmodel.dart';
//
// class CartController extends GetxController {
//   // Observable list of cart items
//   var cartItems = <Product>[].obs;
//
//   // Observable for total price
//   var totalPrice = 0.0.obs;
//
//   // Options for summary selection
//   var addSample = false.obs;
//   var addDisplayStand = false.obs;
//   var addBrochure = false.obs;
//   var addLeafcoin = false.obs;
//
//   // Add item to cart
//   void addToCart(Product product) {
//     var existingProduct =
//     cartItems.firstWhereOrNull((item) => item.id == product.id);
//
//     if (existingProduct == null) {
//       // If not present, add new product with initial quantity of 1
//       product.minimumOrderQuantity = (product.minimumOrderQuantity ?? 0) + 1;
//       cartItems.add(product);
//     } else {
//       // If already exists, increment quantity
//       existingProduct.minimumOrderQuantity =
//           (existingProduct.minimumOrderQuantity ?? 0) + 1;
//     }
//     calculateTotalPrice();
//
//     // Show success message
//     Get.snackbar(
//       'Added to Cart',
//       '${product.productName ?? "Item"} has been added to your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   // Remove a single quantity of an item or remove it entirely
//   void removeFromCart(Product product) {
//     var existingProduct =
//     cartItems.firstWhereOrNull((item) => item.id == product.id);
//
//     if (existingProduct != null) {
//       cartItems.remove(existingProduct);
//       calculateTotalPrice();
//
//       // Show removal message
//       Get.snackbar(
//         'Removed from Cart',
//         '${product.productName ?? "Item"} has been removed from your cart.',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }
//
//   // Increase quantity for a specific product
//   void increaseQuantity(Product product) {
//     var existingProduct =
//     cartItems.firstWhereOrNull((item) => item.id == product.id);
//
//     if (existingProduct != null) {
//       existingProduct.minimumOrderQuantity =
//           (existingProduct.minimumOrderQuantity ?? 0) + 1;
//       calculateTotalPrice();
//     }
//   }
//
//   // Decrease quantity for a specific product
//   void decreaseQuantity(Product product) {
//     var existingProduct =
//     cartItems.firstWhereOrNull((item) => item.id == product.id);
//
//     if (existingProduct != null) {
//       if ((existingProduct.minimumOrderQuantity ?? 0) > 1) {
//         existingProduct.minimumOrderQuantity =
//             (existingProduct.minimumOrderQuantity ?? 0) - 1;
//         calculateTotalPrice();
//       } else {
//         // Remove item entirely if quantity becomes 0
//         removeFromCart(product);
//       }
//     }
//   }
//
//   // Clear the entire cart
//   void clearCart() {
//     cartItems.clear();
//     calculateTotalPrice();
//
//     // Show cleared message
//     Get.snackbar(
//       'Cart Cleared',
//       'All items have been removed from your cart.',
//       snackPosition: SnackPosition.BOTTOM,
//     );
//   }
//
//   // Calculate total price of items in the cart
//   void calculateTotalPrice() {
//     totalPrice.value = cartItems.fold(
//       0.0,
//           (sum, item) =>
//       sum +
//           ((item.price ?? 0) *
//               (item.minimumOrderQuantity ?? 1)), // Handle null values
//     );
//   }
//
//   // Options for additional items
//   double get discountPrice => totalPrice.value > 100 ? 10.0 : 0.0;
//
//   double get finalPrice =>
//       totalPrice.value +
//           (addSample.value ? 5.0 : 0.0) +
//           (addDisplayStand.value ? 10.0 : 0.0) +
//           (addBrochure.value ? 2.0 : 0.0) +
//           (addLeafcoin.value ? 1.0 : 0.0) -
//           discountPrice;
//
//   // Toggle methods for additional items
//   void toggleAddSample(bool value) => addSample.value = value;
//   void toggleAddDisplayStand(bool value) => addDisplayStand.value = value;
//   void toggleAddBrochure(bool value) => addBrochure.value = value;
//   void toggleAddLeafcoin(bool value) => addLeafcoin.value = value;
//
//   // Checkout method
//   void checkout() {
//     cartItems.clear();
//     totalPrice.value = 0.0;
//     addSample.value = false;
//     addDisplayStand.value = false;
//     addBrochure.value = false;
//     addLeafcoin.value = false;
//   }
// }
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/productmodel.dart';

class CartController extends GetxController {
  // // API base URL
  final String baseUrl = 'https://apib2b-production.up.railway.app/api'; // Replace with your API base URL

  // Observable list of cart items
  var cartItems = <Product>[].obs;

  // Observable for total price
  var totalPrice = 0.0.obs;

  // Observable for user address
  var address = ''.obs;

  // Observable for loading state
  var isLoading = false.obs;

  // Options for summary selection
  var addSample = false.obs;
  var addDisplayStand = false.obs;
  var addBrochure = false.obs;
  var addLeafcoin = false.obs;

  // Add item to cart
  void addToCart(Product product) {
    var existingProduct =
    cartItems.firstWhereOrNull((item) => item.id == product.id);

    if (existingProduct == null) {
      // If not present, add new product with initial quantity of 1
      product.minimumOrderQuantity = (product.minimumOrderQuantity ?? 0) + 1;
      cartItems.add(product);
    } else {
      // If already exists, increment quantity
      existingProduct.minimumOrderQuantity =
          (existingProduct.minimumOrderQuantity ?? 0) + 1;
    }
    calculateTotalPrice();

    // Show success message
    Get.snackbar(
      'Added to Cart',
      '${product.productName ?? "Item"} has been added to your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Remove a single quantity of an item or remove it entirely
  void removeFromCart(Product product) {
    var existingProduct =
    cartItems.firstWhereOrNull((item) => item.id == product.id);

    if (existingProduct != null) {
      cartItems.remove(existingProduct);
      calculateTotalPrice();

      // Show removal message
      Get.snackbar(
        'Removed from Cart',
        '${product.productName ?? "Item"} has been removed from your cart.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Increase quantity for a specific product
  void increaseQuantity(Product product) {
    var existingProduct =
    cartItems.firstWhereOrNull((item) => item.id == product.id);

    if (existingProduct != null) {
      existingProduct.minimumOrderQuantity =
          (existingProduct.minimumOrderQuantity ?? 0) + 1;
      calculateTotalPrice();
    }
  }

  // Decrease quantity for a specific product
  void decreaseQuantity(Product product) {
    var existingProduct =
    cartItems.firstWhereOrNull((item) => item.id == product.id);

    if (existingProduct != null) {
      if ((existingProduct.minimumOrderQuantity ?? 0) > 1) {
        existingProduct.minimumOrderQuantity =
            (existingProduct.minimumOrderQuantity ?? 0) - 1;
        calculateTotalPrice();
      } else {
        // Remove item entirely if quantity becomes 0
        removeFromCart(product);
      }
    }
  }

  // Clear the entire cart
  void clearCart() {
    cartItems.clear();
    calculateTotalPrice();

    // Show cleared message
    Get.snackbar(
      'Cart Cleared',
      'All items have been removed from your cart.',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  // Calculate total price of items in the cart
  void calculateTotalPrice() {
    totalPrice.value = cartItems.fold(
      0.0,
          (sum, item) =>
      sum + ((item.price ?? 0) * (item.minimumOrderQuantity ?? 1)),
    );
  }

  // Options for additional items
  double get discountPrice => totalPrice.value > 100 ? 10.0 : 0.0;

  double get finalPrice =>
      totalPrice.value +
          (addSample.value ? 5.0 : 0.0) +
          (addDisplayStand.value ? 10.0 : 0.0) +
          (addBrochure.value ? 2.0 : 0.0) +
          (addLeafcoin.value ? 1.0 : 0.0) -
          discountPrice;

  // Toggle methods for additional items
  void toggleAddSample(bool value) => addSample.value = value;
  void toggleAddDisplayStand(bool value) => addDisplayStand.value = value;
  void toggleAddBrochure(bool value) => addBrochure.value = value;
  void toggleAddLeafcoin(bool value) => addLeafcoin.value = value;

  // Checkout method
  void checkout() {
    cartItems.clear();
    totalPrice.value = 0.0;
    addSample.value = false;
    addDisplayStand.value = false;
    addBrochure.value = false;
    addLeafcoin.value = false;
  }

  // Method to update the user's address in the backend
  Future<void> updateAddress(String newAddress) async {
    isLoading.value = true;
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/business_users/'), // Replace '1' with user ID
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'address': newAddress}),
      );

      if (response.statusCode == 200) {
        address.value = newAddress;
        Get.snackbar('Success', 'Address updated successfully.');
      } else {
        Get.snackbar('Error', 'Failed to update address.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    } finally {
      isLoading.value = false;
    }
  }
}


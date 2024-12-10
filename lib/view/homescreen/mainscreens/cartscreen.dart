import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../../../common/textconstants.dart';
import '../../../controller/cartcontroller.dart';
import '../../widgets/cartcontainer.dart';
import '../detailedviews/addresss.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Cart', style: NeededTextstyles.commonhead),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        if (cartController.cartItems.isEmpty) {
          return const Center(
            child: Text(
              'Your cart is empty!',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Cart Items Section
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartController.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cartController.cartItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: CartContainer(
                            product: product,
                            cartController: cartController,
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(),

                  ListTile(
                    title: Text(cartController.address.value.isEmpty
                        ? "No address provided"
                        : cartController.address.value),
                    trailing: TextButton(
                        child: Text(cartController.address.value.isEmpty ? "Add" : "Change"),
                        onPressed: () {
                          Get.to(() => ChangeAddress());
                        }
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Cart Summary Section
                  Container(
                    decoration: BoxDecoration(
                      color: lighttheme84,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: maintheme1, width: 1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(Icons.eco_outlined,
                                      size: 20, color: Colors.black),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "You will get 10 leaf coins",
                                    style: NeededTextstyles.style04,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              buildOptionRow(
                                'Add a sample',
                                cartController.addSample.value,
                                    (value) =>
                                    cartController.toggleAddSample(value ?? false),
                              ),
                              buildOptionRow(
                                'Add display stand',
                                cartController.addDisplayStand.value,
                                    (value) =>
                                    cartController.toggleAddDisplayStand(value ?? false),
                              ),
                              buildOptionRow(
                                'Add brochure',
                                cartController.addBrochure.value,
                                    (value) =>
                                    cartController.toggleAddBrochure(value ?? false),
                              ),
                              buildOptionRow(
                                'Add leafcoin',
                                cartController.addLeafcoin.value,
                                    (value) =>
                                    cartController.toggleAddLeafcoin(value ?? false),
                              ),
                              buildRow(
                                'Sub total',
                                '₹${cartController.totalPrice.value.toStringAsFixed(2)}',
                              ),
                              const SizedBox(height: 8),
                              buildRow(
                                'Discount price',
                                '(₹${cartController.discountPrice.toStringAsFixed(2)})',
                              ),
                              const SizedBox(height: 8),
                              buildRow('Delivery Charge', 'Free'),
                              const SizedBox(height: 8),
                              const Divider(color: Colors.white),
                              const SizedBox(height: 8),
                              buildRow(
                                'Total',
                                '₹${cartController.finalPrice.toStringAsFixed(2)}',
                                isBold: true,
                              ),
                              const SizedBox(height: 16),
                              Center(
                                child: SizedBox(
                                  height: 44,
                                  width: 244,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (cartController.cartItems.isEmpty) {
                                        Get.snackbar("Error", "Please add items to the cart.");
                                      } else {
                                        cartController.checkout(); // Call checkout method to place the order and clear the cart
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: maintheme1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15.0),
                                      ),
                                    ),
                                    child: Text(
                                      'Proceed to Checkout',
                                      style: NeededTextstyles.style05,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Widget buildRow(String label, String value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: NeededTextstyles.style13,
        ),
        Text(
          value,
          style: NeededTextstyles.style13.copyWith(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget buildOptionRow(String label, bool isChecked, ValueChanged<bool?> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: NeededTextstyles.style13, // Your text style
        ),
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            if (value != null) {
              onChanged(value); // Pass the non-null value
            }
          },
          activeColor: Colors.white, // Customize active color
          checkColor: Colors.black, // Customize check color
        ),
      ],
    );
  }
}

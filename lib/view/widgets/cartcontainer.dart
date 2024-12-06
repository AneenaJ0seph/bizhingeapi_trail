import 'package:flutter/material.dart';

import '../../common/app_colors.dart';
import '../../common/textconstants.dart';
import '../../controller/cartcontroller.dart';
import '../../model/productmodel.dart';

class CartContainer extends StatelessWidget {
  const CartContainer({
    super.key,
    required this.product,
    required this.cartController,
  });

  final Product product;
  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: white,
      elevation: 4,
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color:grey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.network(
              product.image ?? '',
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          product.productName ?? '',
            style: NeededTextstyles.style3
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'medicine',
              style:  NeededTextstyles.style2,
            ),
            const SizedBox(height: 4),
            Text(
              '₹${product.price?.toStringAsFixed(2)}',
                style:  NeededTextstyles.style1
            ),
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                cartController.removeFromCart(product);
              },
              child: const Icon(
                Icons.close,
                color: Colors.grey,
                size: 20,
              ),
            ),
            const Spacer(),
            Flexible(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      cartController.decreaseQuantity(product);
                    },
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.black,
                      size: 18,
                    ),
                  ),
                  Text(
                    '${product.minimumOrderQuantity}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartController.increaseQuantity(product);
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.black,
                      size: 18,
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
}
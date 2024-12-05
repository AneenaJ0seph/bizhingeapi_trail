import 'package:bizhingebase/view/homescreen/productdetail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../common/textconstants.dart';
import '../../controller/app_controller.dart';
import '../../model/categorymodel.dart';

class CategoryProductPage extends StatelessWidget {
  final Category category;
  final AppController controller = Get.find();

  CategoryProductPage({required this.category});

  @override
  Widget build(BuildContext context) {
    final categoryProducts = controller.products
        .where((product) => product.category == category.id)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('${category.name} Products'),
      ),
      body: categoryProducts.isEmpty
          ? Center(child: Text('No products available for this category.'))
          : ListView.builder(
              itemCount: categoryProducts.length,
              itemBuilder: (context, index) {
                final product = categoryProducts[index];
                return Padding(
                  padding: const  EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                  child: Card(
                    color: white,
                    elevation: 5,
                    child: ListTile(
                      onTap: () {
                        // Use GetX for navigation
                        Get.to(() => ProductDetail(product: product));
                      },
                      leading: Image.network(
                        product.image!,
                        width: 70,
                        height: 80,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image, size: 50, color: Colors.grey);
                        },
                      ),
                      title: Text(
                        product.productName!,
                          style: NeededTextstyles.style21
                      ),
                      subtitle: Text(
                        product.productDetails!,
                        style: NeededTextstyles.style24,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      trailing: Text(
                        '\$${product.price?.toStringAsFixed(2)}',
                          style: NeededTextstyles.style21,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}

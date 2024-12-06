import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../controller/app_controller.dart';
import '../../controller/srchcontrlr.dart';
import '../widgets/catlist.dart';
import 'firstscreen.dart';
import 'productdetail.dart';

class SearchScreen extends StatelessWidget {
  final AppController appController = Get.find();
  final SrchController searchController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Search Products'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.to(
                FirstScreen()
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color:white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products...',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onChanged: (query) {
                    searchController.searchProducts(query, appController.products);
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (searchController.isSearching.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (searchController.searchResults.isEmpty) {

                  return Column(
                    children: [
                      SizedBox(height: 15,),
                      Cataglist(controller: appController),
                      // SizedBox(
                      //   height: 500, // Adjust the height as needed
                      //
                      // ),
                    ],
                  );
                }

                // Show search results
                return ListView.builder(
                  itemCount: searchController.searchResults.length,
                  itemBuilder: (context, index) {
                    final product = searchController.searchResults[index];
                    return ListTile(
                      leading: const Icon(Icons.shopping_cart),
                      title: Text(product.productName ?? ''),
                      subtitle: Text('Price: ${product.price}'),
                      onTap: () {
                        // Navigate to ProductDetail
                        Get.to(() => ProductDetail(product: product));
                      },
                    );
                  },
                );
              }),
            )
            ,

          ],
        ),
      ),
    );
  }
}

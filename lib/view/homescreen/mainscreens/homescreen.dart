import 'package:bizhingebase/view/homescreen/detailedviews/productdetail.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/app_colors.dart';
import '../../../common/textconstants.dart';
import '../../widgets/catlist.dart';
import '../../../controller/app_controller.dart';
import '../../../controller/cartcontroller.dart';


class HomeScreen extends StatelessWidget {
  final String companyName;
  final List<String> banners = [
    "assets/img_5.png",
    "assets/img_5.png",
  ];
  final AppController controller = Get.put(AppController());
  final CartController cartController = Get.put(CartController());

  HomeScreen({required this.companyName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
           backgroundColor: lighttheme84,
              child: Icon(Icons.maps_home_work_outlined,color: black,))
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi ,  $companyName", // Dynamic shop name
              style: NeededTextstyles.homeapp
            ),
            Text(
              "Welcome!!!", // Static welcome text
              style: NeededTextstyles.welcome,
            ),

          ],
        ),
        actions: [
          IconButton(

              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SuperCoinStatement()),
                // );
              },
              icon: Badge(
                backgroundColor:  Darktheme1,

                child: Icon(Icons.account_balance_wallet_outlined,
                    color: Darktheme1),)
          ),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => NotificationsPage()),
                // );
              },
              icon: Badge(
                backgroundColor:  Darktheme1,
                child: Icon(Icons.notifications_none_outlined,
                    color: Darktheme1),)
          ),
        ],

      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index, _) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(banners[index]),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 162,
                  viewportFraction: 0.8,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  enlargeCenterPage: true,
                ),
              ),
              SizedBox(height: 20,),

              Text(
                  "Top Categories",
                  style: NeededTextstyles.style2
              ),
              SizedBox(height: 20,),
              // Categories Section
              Cataglist(controller: controller),

              SizedBox(height: 20,),
              Text(
                "Best Selling",
                style: NeededTextstyles.style2,
              ),
              SizedBox(height: 20,),

              // All Products Section
              Obx(() {
                if (controller.isLoadingProducts.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.products.isEmpty) {
                  return Center(child: Text('No products available.',
                    style: NeededTextstyles.style2,));
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Number of columns
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7, // Adjust to control the card size
                  ),
                  itemBuilder: (context, index) {
                    final product = controller.products[index];
                    return GestureDetector(
                      onTap: () {
                        // Use GetX for navigation
                        Get.to(() => ProductDetail(product: product));
                      },
                      child: Card(

                        color: white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Product Image
                            product.image != null
                                ? Expanded(
                              child: Image.network(
                                product.image!,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.image_not_supported),
                              ),
                            )
                                : Expanded(
                              child: Icon(Icons.image, size: 50),
                            ),
                            // Product Name and Price with Add Icon
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Product Name
                                  Expanded(
                                    child: Text(
                                      product.productName ?? 'Unnamed Product',
                                      style: NeededTextstyles.style03,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  // Add Icon Button
                                  Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      color: maintheme1,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.add,
                                        size: 20,
                                        color: Color(0xff333333),
                                      ),
                                      onPressed: () {
                                        cartController.addToCart(product);
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(builder: (context) => CartPage()),
                                        // );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Product Price
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                'Price: ${product.price ?? 'N/A'}',
                                style: NeededTextstyles.style04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    ;
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
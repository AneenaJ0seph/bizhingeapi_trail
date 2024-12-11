// import 'package:bizhingebase/common/textconstants.dart';
// import 'package:flutter/material.dart';
// import '../../../../controller/apicontroller.dart';
// import '../../../../model/ordermodel.dart';
//
// class OrderDetailScreen extends StatefulWidget {
//   @override
//   _OrderDetailScreenState createState() => _OrderDetailScreenState();
// }
//
// class _OrderDetailScreenState extends State<OrderDetailScreen> {
//   late Future<List<Order>> _futureOrders;
//   //
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   _futureOrders = ApiService().fetchOrders();
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Order Details',style: NeededTextstyles.commonhead,),
//         centerTitle: true,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: FutureBuilder<List<Order>>(
//         future: _futureOrders,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(
//               child: Text(
//                 'Failed to load orders: ${snapshot.error}',
//                 style: TextStyle(color: Colors.red),
//               ),
//             );
//           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return  Center(child: Text('No orders found.',style: NeededTextstyles.co,));
//           }
//
//           final orders = snapshot.data!;
//           return ListView.builder(
//             padding: const EdgeInsets.all(16),
//             itemCount: orders.length,
//             itemBuilder: (context, index) {
//               final order = orders[index];
//               return Card(
//                 color: Colors.white,
//                 elevation: 3,
//                 margin: const EdgeInsets.symmetric(vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Icon(Icons.shopping_cart, color: Colors.blue, size: 30),
//                           // const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Order ID: ${order.businessUserId ?? 'N/A'}',
//                                   style: const TextStyle(
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   'Total Price: \$${order.totalPrice?.toStringAsFixed(2) ?? '0.00'}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 Text(
//                                   'Status: ${order.status ?? 'Pending'}',
//                                   style: TextStyle(
//                                     fontSize: 14,
//                                     color: order.status == 'Shipped'
//                                         ? Colors.green
//                                         : Colors.orange,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Shipping Address:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       Text(
//                         order.billingAddress.isNotEmpty
//                             ? order.billingAddress
//                             : 'Not provided',
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.black54,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Order Products:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.w600,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: order.orderProducts.length,
//                         itemBuilder: (context, productIndex) {
//                           final product = order.orderProducts[productIndex];
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   product.productName,
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 Text(
//                                   'x${product.quantity}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                                 Text(
//                                   '\$${(product.price * product.quantity).toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     fontSize: 14,
//                                     color: Colors.black54,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }}
// // }
// // import 'package:flutter/material.dart';
// //
// // class SingleOrderExample extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final Map<String, dynamic> order = {
// //       "orderId": "ORD123456",
// //       "totalPrice": 129.99,
// //       "status": "Shipped",
// //       "shippingAddress": "123 Main Street, Springfield",
// //       "orderProducts": [
// //         {"productName": "Wireless Headphones", "quantity": 2, "price": 64.99}
// //       ]
// //     };
// //
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         title: const Text('Single Order Example'),
// //         backgroundColor: Colors.white,
// //         foregroundColor: Colors.black,
// //         elevation: 0,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Card(
// //           color: Colors.white,
// //           elevation: 3,
// //           margin: const EdgeInsets.symmetric(vertical: 8),
// //           shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(12),
// //           ),
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Row(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Icon(Icons.shopping_cart, color: Colors.blue, size: 30),
// //                     const SizedBox(width: 16),
// //                     Expanded(
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             'Order ID: ${order["orderId"] as String}',
// //                             style: const TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                           ),
// //                           const SizedBox(height: 4),
// //                           Text(
// //                             'Total Price: \$${order["totalPrice"].toString()}',
// //                             style: const TextStyle(
// //                               fontSize: 14,
// //                               color: Colors.black54,
// //                             ),
// //                           ),
// //                           Text(
// //                             'Status: ${order["status"] as String}',
// //                             style: TextStyle(
// //                               fontSize: 14,
// //                               color: order["status"] == "Shipped"
// //                                   ? Colors.green
// //                                   : Colors.orange,
// //                               fontWeight: FontWeight.w600,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Text(
// //                   'Shipping Address:',
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //                 Text(
// //                   order["shippingAddress"] as String,
// //                   style: const TextStyle(
// //                     fontSize: 14,
// //                     color: Colors.black54,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 12),
// //                 Text(
// //                   'Order Products:',
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.w600,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //                 const SizedBox(height: 8),
// //                 SizedBox(
// //                   height: 80,
// //                   child: ListView.builder(
// //                     shrinkWrap: true,
// //                     physics: const NeverScrollableScrollPhysics(),
// //                     itemCount: order["orderProducts"].length,
// //                     itemBuilder: (context, productIndex) {
// //                       final product = order["orderProducts"][productIndex];
// //                       return Padding(
// //                         padding: const EdgeInsets.symmetric(vertical: 4),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text(
// //                               product["productName"] as String,
// //                               style: const TextStyle(
// //                                 fontSize: 14,
// //                                 color: Colors.black87,
// //                               ),
// //                             ),
// //                             Text(
// //                               'x${product["quantity"].toString()}',
// //                               style: const TextStyle(
// //                                 fontSize: 14,
// //                                 color: Colors.black54,
// //                               ),
// //                             ),
// //                             Text(
// //                               '\$${((product["price"] as num? ?? 0) * (product["quantity"] as num? ?? 0)).toStringAsFixed(2)}',
// //                               style: const TextStyle(
// //                                 fontSize: 14,
// //                                 color: Colors.black54,
// //                               ),
// //                             ),
// //
// //                           ],
// //                         ),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

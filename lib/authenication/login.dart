// import 'package:biztrail/view/homescreen/firstscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _shopNameController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isLoading = false;
//
//   // Login method
//   Future<void> _login() async {
//     final shopName = _shopNameController.text.trim().toLowerCase();
//     final phone = _phoneController.text.trim();
//
//     if (shopName.isEmpty || phone.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Both fields are required!')),
//       );
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     final url = Uri.parse(
//         'https://apib2b-production.up.railway.app/api/business_users/');
//
//     try {
//       final response = await http.get(url);
//
//       print("Response Status Code: ${response.statusCode}");
//       print("Response Body: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//
//         print("Decoded Response: $data");
//
//         if (data is List && data.isNotEmpty) {
//           bool matchFound = false;
//
//           for (final user in data) {
//             final apiShopName = (user['company_name']?.toString().trim().toLowerCase() ?? '');
//             String apiPhone = (user['phone']?.toString().trim() ?? '');
//
//             // Normalize phone number by removing country code prefix (e.g., "+91")
//             apiPhone = apiPhone.startsWith('+91') ? apiPhone.substring(3) : apiPhone;
//
//             print("Checking User: $user");
//             print("Normalized API Phone: $apiPhone");
//
//             if (apiShopName == shopName && apiPhone == phone) {
//               matchFound = true;
//               break;
//             }
//           }
//
//           if (matchFound) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Login Successful!')),
//             );
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => FirstScreen()),
//             );
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(content: Text('Login Unsuccessful. No matching details found.')),
//             );
//           }
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Login Unsuccessful. No matching details found.')),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Error: ${response.statusCode}. Please try again.')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Login",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     "Enter your details to continue.",
//                     style: TextStyle(
//                       fontFamily: 'Poppins',
//                       fontSize: 14,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                   SizedBox(height: 20),
//                   // Shop Name Field
//                   TextFormField(
//                     controller: _shopNameController,
//                     decoration: InputDecoration(
//                       labelText: "Shop Name",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Shop Name is required.";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   // Phone Number Field
//                   TextFormField(
//                     controller: _phoneController,
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       labelText: "Phone Number",
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return "Phone Number is required.";
//                       }
//                       if (!RegExp(r'^\d{10}$').hasMatch(value)) {
//                         return "Enter a valid 10-digit phone number.";
//                       }
//                       return null;
//                     },
//                   ),
//                   SizedBox(height: 30),
//                   Center(
//                     child: ElevatedButton(
//                       onPressed: _isLoading ? null : _login,
//                       style: ElevatedButton.styleFrom(
//                         padding: EdgeInsets.symmetric(vertical: 16, horizontal: 40),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         backgroundColor: Colors.green,
//                       ),
//                       child: _isLoading
//                           ? CircularProgressIndicator(color: Colors.white)
//                           : Text(
//                         "Login",
//                         style: TextStyle(
//                           fontFamily: 'Poppins',
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
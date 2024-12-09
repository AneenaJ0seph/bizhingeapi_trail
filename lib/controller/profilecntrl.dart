import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../model/usermodel.dart';

class ProfileController extends GetxController {
  var businessUser = Rxn<BusinessUser>(); // Rxn allows null value

  // Fetch profile data from the API
  Future<void> fetchProfile() async {
    try {
      final response = await http.get(Uri.parse('https://apib2b-production.up.railway.app/api/business_users/'));

      if (response.statusCode == 200) {
        final businessUserData = businessUserFromJson(response.body);
        businessUser.value = businessUserData.isNotEmpty ? businessUserData[0] : null;
      } else {
        Get.snackbar('Error', 'Failed to load profile data.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error fetching profile: $e');
    }
  }

  // Update profile method
  Future<void> updateProfile(String companyName, String contactPerson, String email, String phone, String address) async {
    if (businessUser.value == null) {
      Get.snackbar('Error', 'Profile data is missing. Please try again.');
      return;
    }

    try {
      final url = Uri.parse('https://apib2b-production.up.railway.app/api/business_users/${businessUser.value?.id}');
      final response = await http.put(url, body: {
        'company_name': companyName,
        'contact_person': contactPerson,
        'email': email,
        'phone': phone,
        'address': address,
      });

      if (response.statusCode == 200) {
        // Update the local profile data
        businessUser.value = businessUser.value?.copyWith(
          companyName: companyName,
          contactPerson: contactPerson,
          email: email,
          phone: phone,
          address: address,
        );
        Get.snackbar('Success', 'Profile updated successfully');
      } else {
        Get.snackbar('Error', 'Failed to update profile');
      }
    } catch (e) {
      Get.snackbar('Error', 'Error updating profile: $e');
    }
  }
}

import 'package:get/get.dart';

class ChangeAddressController extends GetxController {
  var name = ''.obs;
  var phoneNumber = ''.obs;
  var houseNo = ''.obs;
  var area = ''.obs;
  var state = ''.obs;
  var city = ''.obs;
  var pinCode = ''.obs;
  var landmark = ''.obs;
  var isHomeSelected = false.obs;
  var isOfficeSelected = false.obs;

  // Function to toggle Home/Office selection
  void toggleHome() {
    isHomeSelected.value = true;
    isOfficeSelected.value = false;
  }

  void toggleOffice() {
    isHomeSelected.value = false;
    isOfficeSelected.value = true;
  }

  // Save the address data
  void saveAddress() {
    // Here you would typically make an API call to save the data
    print('Address saved: $name, $phoneNumber, $houseNo, $area, $state, $city, $pinCode, $landmark');
  }
}

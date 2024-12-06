import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/app_colors.dart';
import '../../common/textconstants.dart';
import '../../controller/changeAddressController.dart';
// Import your controller

class ChangeAddress extends StatelessWidget {
  const ChangeAddress({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the ChangeAddressController
    final changeAddressController = Get.put(ChangeAddressController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 18, right: 18),
            child: Form(
              child: Column(
                children: [
                  Text("Add a new address", style: NeededTextstyles.style3),
                  SizedBox(height: 30),
                  // Name field
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Shop Name', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.name.value = value,
                  ),
                  SizedBox(height: 10),
                  // Phone number field
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Phone Number', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.phoneNumber.value = value,
                  ),
                  SizedBox(height: 10),
                  // House number
                  TextFormField(
                    decoration: InputDecoration(hintText: 'House No, Building Name *', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.houseNo.value = value,
                  ),
                  SizedBox(height: 20),
                  // Road Name / Area
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Road Name, Area, Colony *', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.area.value = value,
                  ),
                  SizedBox(height: 20),
                  // State and City fields
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'State *', hintStyle: NeededTextstyles.style03),
                          onChanged: (value) => changeAddressController.state.value = value,
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(hintText: 'City *', hintStyle: NeededTextstyles.style03),
                          onChanged: (value) => changeAddressController.city.value = value,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Pin code field
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Pin Code *', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.pinCode.value = value,
                  ),
                  SizedBox(height: 20),
                  // Landmark field (optional)
                  TextFormField(
                    decoration: InputDecoration(hintText: 'Landmark (optional)', hintStyle: NeededTextstyles.style03),
                    onChanged: (value) => changeAddressController.landmark.value = value,
                  ),
                  SizedBox(height: 20),
                  // Home/Office toggle buttons
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 12),
                    child: Row(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => changeAddressController.toggleHome(),
                          icon: Icon(Icons.home, size: 15),
                          label: Text("Home", style: NeededTextstyles.style03),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: changeAddressController.isHomeSelected.value ? maintheme1 : white,
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton.icon(
                          onPressed: () => changeAddressController.toggleOffice(),
                          icon: Icon(Icons.villa_sharp, size: 15),
                          label: Text("Office", style: NeededTextstyles.style03),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: changeAddressController.isOfficeSelected.value ? maintheme1 : white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Save address button
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        changeAddressController.saveAddress(); // Save the address using GetX controller
                        Navigator.pop(context); // Navigate back to the previous screen after saving
                      },
                      child: Text("Save Address", style: NeededTextstyles.style05),
                      style: ElevatedButton.styleFrom(backgroundColor: Darktheme1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:bizhingebase/common/textconstants.dart';
import 'package:flutter/material.dart';
import '../../../../common/app_colors.dart';

class EditProfile extends StatelessWidget {
   EditProfile({super.key});
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _contactPersonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 350,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color:Darktheme1,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: white,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff677294).withOpacity(0.80),
                            ),
                            child: IconButton(onPressed: (){}, icon: Icon(
                              Icons.camera_alt,
                              color:Darktheme1,
                            ),)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 200),
                child: Text(
                  "Personal information",
                  style: NeededTextstyles.style40
                ),
              ),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                      style: NeededTextstyles.co

                  ),
                  Container(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                       controller: _contactPersonController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Contact number",
                      style: NeededTextstyles.co

                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      controller: _phoneController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        suffixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Shop Name",
                      style: NeededTextstyles.co

                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      controller: _companyNameController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "Location",
                    style: NeededTextstyles.co
                  ),
                  SizedBox(
                    height: 40,
                    width: 370,
                    child: TextFormField(
                      controller: _addressController,
                      cursorHeight: 15,
                      decoration: InputDecoration(
                        fillColor: Colors.grey.withOpacity(0.2),
                        suffixIcon: Icon(Icons.edit),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        filled: true,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              SizedBox(
                height: 50,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: maintheme1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8.0), // Responsive border radius
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: NeededTextstyles.whit15
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
//
// import 'package:bizhingebase/common/app_colors.dart';
// import 'package:bizhingebase/common/textconstants.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../../../controller/profilecntrl.dart';
//
// class EditProfile extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());
//
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _contactPersonController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     // Fetch the profile when the screen is initialized
//     profileController.fetchProfile();
//
//     return Scaffold(
//       backgroundColor: white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   Container(
//                     height: 350,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Darktheme1,
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(30.0),
//                         bottomRight: Radius.circular(30.0),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 150),
//                     child: CircleAvatar(
//                       radius: 60,
//                       backgroundColor: white,
//                       child: Align(
//                         alignment: Alignment.bottomRight,
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xff677294).withOpacity(0.80),
//                           ),
//                           child: IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.camera_alt,
//                               color: Darktheme1,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Padding(
//                 padding: const EdgeInsets.only(right: 200),
//                 child: Text("Personal information", style: NeededTextstyles.style40),
//               ),
//               SizedBox(height: 20),
//               Obx(() {
//                 // Check if profile data is available
//                 if (profileController.businessUser.value == null) {
//                   return Center(child: CircularProgressIndicator());
//                 }
//
//                 // Set values from the profile
//                 _companyNameController.text = profileController.businessUser.value!.companyName;
//                 _contactPersonController.text = profileController.businessUser.value!.contactPerson;
//                 _emailController.text = profileController.businessUser.value!.email;
//                 _phoneController.text = profileController.businessUser.value!.phone;
//                 _addressController.text = profileController.businessUser.value!.address;
//
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text("Name", style: NeededTextstyles.co),
//                     _buildTextField(_contactPersonController),
//                     SizedBox(height: 10),
//                     Text("Contact number", style: NeededTextstyles.co),
//                     _buildTextField(_phoneController),
//                     SizedBox(height: 10),
//                     Text("Shop Name", style: NeededTextstyles.co),
//                     _buildTextField(_companyNameController),
//                     SizedBox(height: 10),
//                     Text("Location", style: NeededTextstyles.co),
//                     _buildTextField(_addressController),
//                   ],
//                 );
//               }),
//               SizedBox(height: 25),
//               SizedBox(
//                 height: 50,
//                 width: 200,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     // Trigger profile update
//                     profileController.updateProfile(
//                       _companyNameController.text,
//                       _contactPersonController.text,
//                       _emailController.text,
//                       _phoneController.text,
//                       _addressController.text,
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: maintheme1,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0),
//                     ),
//                   ),
//                   child: Text("Update Profile", style: NeededTextstyles.whit15),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTextField(TextEditingController controller) {
//     return Container(
//       height: 40,
//       width: 370,
//       child: TextFormField(
//         controller: controller,
//         cursorHeight: 15,
//         decoration: InputDecoration(
//           fillColor: Colors.grey.withOpacity(0.2),
//           border: OutlineInputBorder(
//             borderSide: BorderSide.none,
//             borderRadius: BorderRadius.circular(6),
//           ),
//           filled: true,
//         ),
//       ),
//     );
//   }
// }

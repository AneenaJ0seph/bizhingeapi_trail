import 'package:bizhingebase/common/textconstants.dart';
import 'package:flutter/material.dart';


import '../common/app_colors.dart';
import 'kyc.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _contactPersonController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  bool isChecked = false;

  void clearText() {
    _companyNameController.clear();
    _contactPersonController.clear();
    _emailController.clear();
    _phoneController.clear();
    _addressController.clear();

  }

  void _goToNextPage() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!isChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('You must accept the terms and conditions')),
        );
        return;
      }
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(
            companyName: _companyNameController.text,
            contactPerson: _contactPersonController.text,
            email: _emailController.text,
            phone: _phoneController.text,
            address: _addressController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 350),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 10),
                  child: Text(
                    'Join us to start searching',
                    style: NeededTextstyles.stykshblac
                  ),
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    'Sign up to explore and buy authentic',
                    style: NeededTextstyles.style21
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    'Ayurvedic medicines!',
                      style: NeededTextstyles.style21

                  ),
                ),
                SizedBox(height: 50),
                _buildTextField(
                  controller: _companyNameController,
                  hint: 'Shop Name',
                  icon: Icons.maps_home_work_sharp,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Shop Name cannot be empty';
                    }
                    if (value.contains("@")) {
                      return 'Invalid Shop Name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                _buildTextField(
                  controller: _contactPersonController,
                  hint: 'Owner Name',
                  icon: Icons.person,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Owner Name cannot be empty';
                    }
                    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
                      return 'Name must contain only letters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                _buildTextField(
                  controller: _phoneController,
                  hint: 'Phone',
                  icon: Icons.phone,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Phone number cannot be empty';
                    }
                    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                      return 'Enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                _buildTextField(
                  controller: _addressController,
                  hint: 'Shop Address',
                  icon: Icons.maps_home_work_sharp,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Address cannot be empty';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 5),
                _buildTextField(
                  controller: _emailController,
                  hint: 'Referral (Optional)',
                  icon: Icons.wallet_giftcard_rounded,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: FormField<bool>(
                    initialValue: isChecked,
                    validator: (value) {
                      if (!isChecked) {
                        return "You must accept the terms and conditions.";
                      }
                      return null;
                    },
                    builder: (formFieldState) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isChecked = !isChecked;
                                    formFieldState.didChange(isChecked);
                                  });
                                },
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: isChecked ? Color(0xff6EBC31) : Colors.grey,
                                      width: 2,
                                    ),
                                    color: isChecked ? Color(0xff6EBC31) : Colors.transparent,
                                  ),
                                  child: isChecked
                                      ? Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 14,
                                  )
                                      : null,
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'I agree with the terms of Service & Privacy Policy',
                                  style: NeededTextstyles.style2
                                ),
                              ),
                            ],
                          ),
                          if (formFieldState.hasError)
                            Padding(
                              padding: const EdgeInsets.only(left: 30, top: 5),
                              child: Text(
                                formFieldState.errorText!,
                                  style: NeededTextstyles.error

                              ),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: _goToNextPage,
                  child: Text(
                    "Sign up",
                    style: NeededTextstyles.white18,

                  ),
                  style: ElevatedButton.styleFrom(
                    elevation: 6,
                    backgroundColor: maintheme1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    String? Function(String?)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: NeededTextstyles.style19,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        validator: validator,
      ),
    );
  }
}

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../view/homescreen/mainscreens/firstscreen.dart';



class SecondPage extends StatefulWidget {
  final String companyName;
  final String contactPerson;
  final String email;
  final String phone;
  final String address;

  const SecondPage({
    required this.companyName,
    required this.contactPerson,
    required this.email,
    required this.phone,
    required this.address,
    Key? key,
  }) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isAgreed = false;
  String? ownershipCertificate;
  String? gstCertificate;
  bool _isLoading = false;

  // Method to pick files
  Future<void> pickFile(String certificateType) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'jpg', 'png', 'jpeg'],
    );

    if (result != null) {
      setState(() {
        if (certificateType == "ownership") {
          ownershipCertificate = result.files.single.path;
        } else if (certificateType == "gst") {
          gstCertificate = result.files.single.path;
        }
      });
    }
  }

  // Method to submit form and upload files
  Future<void> _submitForm() async {
    if (!isAgreed || (ownershipCertificate == null && gstCertificate == null)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please agree to the terms and upload a certificate.")),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('https://apib2b-production.up.railway.app/api/business_users/');
    final request = http.MultipartRequest('POST', url)
      ..fields['company_name'] = widget.companyName
      ..fields['contact_person'] = widget.contactPerson
      ..fields['email'] = widget.email
      ..fields['phone'] = widget.phone
      ..fields['address'] = widget.address;

    if (ownershipCertificate != null) {
      request.files.add(await http.MultipartFile.fromPath('ownership_certificate', ownershipCertificate!));
    }
    if (gstCertificate != null) {
      request.files.add(await http.MultipartFile.fromPath('gst_certificate', gstCertificate!));
    }

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up Successful!')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(companyName: widget.companyName, contactPerson: widget.contactPerson,),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // Method to skip the file upload
  Future<void> _skipForm() async {
    setState(() {
      _isLoading = true;
    });

    final url = Uri.parse('http://192.168.1.6:8000/api/business_users/');
    final request = http.MultipartRequest('POST', url)
      ..fields['company_name'] = widget.companyName
      ..fields['contact_person'] = widget.contactPerson
      ..fields['email'] = widget.email
      ..fields['phone'] = widget.phone
      ..fields['address'] = widget.address;

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Sign Up Successful!')));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => FirstScreen(companyName: widget.companyName, contactPerson: widget.contactPerson,),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to sign up. Status code: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "KYC Verification",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "For completion of registration,\nplease upload ANY ONE of the following\ndocument",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: Color(0xff677294)),
                  SizedBox(width: 8),
                  Text(
                    "Why this is needed?",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      color: Color(0xff677294),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
              _buildUploadButton("ownership", "Ownership Certificate"),
              SizedBox(height: 30),
              _buildUploadButton("gst", "GST Certificate"),
              SizedBox(height: 50),
              Row(
                children: [
                  Checkbox(
                    value: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value!;
                      });
                    },
                    activeColor: Colors.green,
                  ),
                  Expanded(
                    child: Text(
                      "I agree with giving above documents",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xff677294),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Center(
                child: Column(
                  children: [
                    _buildButton("Skip", _skipForm, Color(0xff6EBC31).withOpacity(0.50), Color(0xff005511)),
                    SizedBox(height: 15),
                    _buildButton(
                      "Verify",
                      isAgreed && (ownershipCertificate != null || gstCertificate != null) ? _submitForm : null,
                      Color(0xff6EBC31),
                      Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUploadButton(String type, String label) {
    String? file = type == "ownership" ? ownershipCertificate : gstCertificate;
    return GestureDetector(
      onTap: () => pickFile(type),
      child: Container(
        height: 100,
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            file != null ? "$label Uploaded" : "Upload $label",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback? onPressed, Color backgroundColor, Color textColor) {
    return Container(
      height: 40,
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: _isLoading && label == "Verify"
            ? CircularProgressIndicator(color: textColor)
            : Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
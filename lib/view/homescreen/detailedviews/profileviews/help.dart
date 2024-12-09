import 'package:bizhingebase/common/textconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX

import 'package:url_launcher/url_launcher.dart';

import '../../../../common/app_colors.dart';

class HelpCenterPage extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      // Use Get.snackbar for error messages
      Get.snackbar(
        'Error',
        'Could not launch $url',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          'Help Center',
          style: NeededTextstyles.commonhead,
        ),
        backgroundColor: white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: lighttheme84),
          onPressed: () => Get.back(), // Use GetX navigation for back action
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeaderSection(),
              SizedBox(height: 24),
              _buildContactOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff005511).withOpacity(0.84), Color(0xff6EBC31)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(Icons.headset_mic, size: 60, color: white),
          SizedBox(height: 10),
          Text(
            'We\'d Love to Hear From You!',
            style: NeededTextstyles.bold,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Please contact us with your queries or feedback, and we\'ll get back to you as soon as possible.',
            style: NeededTextstyles.style70,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildContactOptionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Contact Us',
          style:NeededTextstyles.lighttheme,
        ),
        SizedBox(height: 24),
        _contactOption(
          Icons.messenger_outlined,
          'Contact on WhatsApp',
          'https://wa.me/7510530121',
          'Chat with us on WhatsApp',
        ),
        _contactOption(
          Icons.email,
          'Email Us',
          _buildMailToUrl(
            email: 'bizhinge@gmail.com',
            subject: 'Support',
            body: 'Hi Team,',
          ),
          'Send an email to support',
        ),
        _contactOption(
          Icons.phone,
          'Call Us',
          'tel:+917510530121',
          'Call our support line',
        ),
      ],
    );
  }

  String _buildMailToUrl({required String email, String? subject, String? body}) {
    final Uri mailtoUri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      },
    );
    return mailtoUri.toString();
  }

  Widget _contactOption(
      IconData icon, String title, String url, String description) {
    return Card(
      color: white,
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: lighttheme84),
        title: Text(
          title,
          style: NeededTextstyles.style6,
        ),
        subtitle: Text(
          description,
          style: NeededTextstyles.style25,
        ),
        onTap: () => _launchURL(url),
      ),
    );
  }
}

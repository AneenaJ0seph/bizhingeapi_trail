import 'package:flutter/material.dart';

import '../../../../common/app_colors.dart';

class PrivacyPolicyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text('Privacy Policy',
          style: TextStyle(fontFamily: 'Poppins',
          fontWeight: FontWeight.bold,
          color: Color(0xff005511),
        ),),
        centerTitle: true,
        elevation: 1,
        backgroundColor:Colors.grey.shade100,
      ),
      body: SafeArea(
        child: ListView(

          padding: EdgeInsets.all(16.0),
          children: [
            _buildSection(
              icon: Icons.info,
              title: '1. Information We Collect',
              content:
              'We may collect personal information such as your name, email address, phone number, and payment information. '
                  'We also collect usage data like browsing history, items viewed, and app performance logs.',
            ),
            _buildSection(
              icon: Icons.security,
              title: '2. How We Use Your Information',
              content:
              'Your data is used to process orders, provide customer support, improve the app, and prevent fraud.',
            ),
            _buildSection(
              icon: Icons.share,
              title: '3. Sharing Your Information',
              content:
              'We do not sell your data. However, we may share it with service providers and legal authorities when required.',
            ),
            _buildSection(
              icon: Icons.cookie,
              title: '4. Cookies and Tracking',
              content:
              'We use cookies to remember your preferences, analyze app performance, and deliver personalized recommendations.',
            ),
            _buildSection(
              icon: Icons.lock,
              title: '5. Data Security',
              content:
              'We implement industry-standard measures to protect your data, but no system is completely secure.',
            ),
            _buildSection(
              icon: Icons.gavel,
              title: '6. Your Rights',
              content:
              'Depending on your location, you may have rights to access, correct, or delete your personal data.',
            ),
            _buildSection(
              icon: Icons.contact_support,
              title: '7. Contact Us',
              content:
              'If you have any questions, please contact us at bizhinge@gmail.com.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({required IconData icon, required String title, required String content}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Color(0xff005511),),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  content,
                  style: TextStyle(fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
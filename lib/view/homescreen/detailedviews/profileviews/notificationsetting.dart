import 'package:bizhingebase/common/textconstants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart'; // Import GetX
import '../../../../common/app_colors.dart';
import '../../../../controller/noticonroller.dart';


class NotificationSettingsScreen extends StatelessWidget {

  final NotificationSettingsController controller = Get.put(NotificationSettingsController());

  // List of predefined ringtones
  final List<String> ringtones = [
    'Default Ringtone',
    'Classic Melody',
    'Chime Sound',
    'Buzzer Alert',
    'Ding Notification'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        title: Text('Notification Settings', style: NeededTextstyles.commonhead),
      ),
      body: ListView(
        children: [
          _buildMuteToggle(),
          _buildSectionHeader('Order Notifications'),
          _buildToggle(
            'Order Confirmation',
            controller.orderConfirmationAllowed,
          ),
          _buildToggle(
            'Shipping Updates',
            controller.shippingUpdatesAllowed,
          ),
          _buildToggle(
            'Delivery Notifications',
            controller.deliveryNotificationsAllowed,
          ),
          Divider(),
          _buildSectionHeader('Promotions'),
          _buildToggle(
            'Sales & Discounts',
            controller.salesDiscountsAllowed,
          ),
          _buildToggle(
            'New Arrivals',
            controller.newArrivalsAllowed,
          ),
          Divider(),
          _buildSectionHeader('Personalized Recommendations'),
          _buildToggle(
            'Recommendations',
            controller.recommendationsAllowed,
          ),
          Divider(),
          _buildSectionHeader('Account Alerts'),
          _buildToggle(
            'Security Alerts',
            controller.securityAlertsAllowed,
          ),
          Divider(),
          _buildSectionHeader('Feedback Requests'),
          _buildToggle(
            'Request for Feedback',
            controller.feedbackRequestsAllowed,
          ),
          SizedBox(height: 20),
          _buildRingtoneSettings(),
        ],
      ),
    );
  }

  Widget _buildMuteToggle() {
    return Obx(() => SwitchListTile(
      title: Text(
        'Mute Notifications',
        style: NeededTextstyles.style40,
      ),
      value: controller.isMuted.value,
      activeColor: Darktheme1,
      inactiveTrackColor: Colors.transparent,
      onChanged: (val) {
        controller.toggleSetting(controller.isMuted);
      },
      secondary: Icon(controller.isMuted.value
          ? Icons.notifications_off
          : Icons.notifications, color: Darktheme1),
    ));
  }

  Widget _buildRingtoneSettings() {
    return Obx(() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: ListTile(
        title: Text(
          'Set Ringtone',
          style:NeededTextstyles.style50,
        ),
        subtitle: Text(
          controller.selectedRingtone.value != null
              ? "Selected ringtone: ${controller.selectedRingtone.value}"
              : "No ringtone selected",
          style: NeededTextstyles.style50,
        ),
        onTap: () => _showRingtonePicker(),
        trailing: Icon(Icons.music_note, color: Darktheme1),
      ),
    ));
  }

  // Show ringtone picker dialog
  void _showRingtonePicker() async {
    if (controller.isMuted.value) return;

    final selected = await showDialog<String>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Text('Select a Ringtone', style: NeededTextstyles.style35),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: ringtones.map((ringtone) {
            return ListTile(
              title: Text(ringtone, style: NeededTextstyles.style50),
              onTap: () {
                Navigator.pop(context, ringtone);
              },
            );
          }).toList(),
        ),
      ),
    );

    if (selected != null) {
      controller.setRingtone(selected);
    }
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 24, 16, 8),
        child: Text(
          title,
          style: NeededTextstyles.style4
        ));
  }

  Widget _buildToggle(String title, RxBool toggleValue) {
    return Obx(() => SwitchListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            color: controller.isMuted.value ? grey : black),
      ),
      value: toggleValue.value,
      onChanged: !controller.isMuted.value
          ? (_) => controller.toggleSetting(toggleValue)
          : null,
      activeColor: Darktheme1,
      inactiveTrackColor: Colors.transparent,
      secondary: Icon(Icons.notifications,
          color: controller.isMuted.value ? grey : Darktheme1),
    ));
  }
}

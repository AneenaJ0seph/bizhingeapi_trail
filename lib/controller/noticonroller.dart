import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationSettingsController extends GetxController {
  var isMuted = false.obs;
  var orderConfirmationAllowed = false.obs;
  var shippingUpdatesAllowed = false.obs;
  var deliveryNotificationsAllowed = false.obs;
  var salesDiscountsAllowed = false.obs;
  var newArrivalsAllowed = false.obs;
  var recommendationsAllowed = false.obs;
  var securityAlertsAllowed = false.obs;
  var feedbackRequestsAllowed = false.obs;
  var selectedRingtone = 'Default Ringtone'.obs;

  // List of predefined constant ringtones
  final List<String> ringtones = [
    'Default Ringtone',
    'Classic Melody',
    'Chime Sound',
    'Buzzer Alert',
    'Ding Notification'
  ];

  @override
  void onInit() {
    super.onInit();
    _loadSettings();
  }

  // Load settings from shared_preferences
  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    isMuted.value = prefs.getBool('isMuted') ?? false;
    orderConfirmationAllowed.value = prefs.getBool('orderConfirmationAllowed') ?? false;
    shippingUpdatesAllowed.value = prefs.getBool('shippingUpdatesAllowed') ?? false;
    deliveryNotificationsAllowed.value = prefs.getBool('deliveryNotificationsAllowed') ?? false;
    salesDiscountsAllowed.value = prefs.getBool('salesDiscountsAllowed') ?? false;
    newArrivalsAllowed.value = prefs.getBool('newArrivalsAllowed') ?? false;
    recommendationsAllowed.value = prefs.getBool('recommendationsAllowed') ?? false;
    securityAlertsAllowed.value = prefs.getBool('securityAlertsAllowed') ?? false;
    feedbackRequestsAllowed.value = prefs.getBool('feedbackRequestsAllowed') ?? false;
    selectedRingtone.value = prefs.getString('selectedRingtone') ?? 'Default Ringtone';
  }

  // Save settings to shared_preferences
  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isMuted', isMuted.value);
    await prefs.setBool('orderConfirmationAllowed', orderConfirmationAllowed.value);
    await prefs.setBool('shippingUpdatesAllowed', shippingUpdatesAllowed.value);
    await prefs.setBool('deliveryNotificationsAllowed', deliveryNotificationsAllowed.value);
    await prefs.setBool('salesDiscountsAllowed', salesDiscountsAllowed.value);
    await prefs.setBool('newArrivalsAllowed', newArrivalsAllowed.value);
    await prefs.setBool('recommendationsAllowed', recommendationsAllowed.value);
    await prefs.setBool('securityAlertsAllowed', securityAlertsAllowed.value);
    await prefs.setBool('feedbackRequestsAllowed', feedbackRequestsAllowed.value);
    await prefs.setString('selectedRingtone', selectedRingtone.value);
  }

  // Toggle setting
  void toggleSetting(RxBool setting) {
    setting.value = !setting.value;
    _saveSettings(); // Save automatically after each change
  }

  // Set ringtone
  void setRingtone(String ringtone) {
    selectedRingtone.value = ringtone;
    FlutterRingtonePlayer().stop();
    FlutterRingtonePlayer().playRingtone();
    _saveSettings();
  }
}

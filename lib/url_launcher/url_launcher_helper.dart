import 'package:easy_url_launcher/easy_url_launcher.dart';

class LauncherHelper {
  static Future<void> openUrl(String url) async {
    await EasyLauncher.url(url: url);
  }

  static Future<void> sendEmail(
      String email, String subject, String body) async {
    await EasyLauncher.email(email: email, subject: subject, body: body);
  }

  static Future<void> numberLauncher(String number) async {
    await EasyLauncher.call(number: number);
  }

  static Future<void> runUssd(String ussdCode) async {
    await EasyLauncher.call(number: ussdCode);
  }

  static Future<void> sendSms(String number, String message) async {
    await EasyLauncher.sms(number: number, message: message);
  }

  static Future<void> sendToWhatsApp(String phone, String message) async {
    await EasyLauncher.sendToWhatsApp(phone: phone, message: message);
  }

  static Future<void> openMap(String lati, String long) async {
    await EasyLauncher.openMap(lati: lati, long: long);
  }
}

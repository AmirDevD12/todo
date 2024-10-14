import 'package:todo/common_ui/widgets/my_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

class MyUrlLauncher {
  const MyUrlLauncher._();

  static Future<void> launchUri(String? uriString) async {
    if (uriString == null || uriString.isEmpty) {
      _showError("خطا", "لینک معتبر نیست");
      return;
    }

    final uri = Uri.tryParse(uriString);
    if (uri == null) {
      _showError("خطا", "فرمت لینک نامعتبر است");
      return;
    }

    if (await canLaunchUrl(uri)) {
      await _attemptLaunch(uri);
    } else {
      _showError("خطا", "قابلیت راه‌اندازی لینک وجود ندارد");
    }
  }

  static Future<void> _attemptLaunch(Uri uri) async {
    try {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } catch (e) {
      _showError("خطا", "راه‌اندازی لینک ناموفق بود");
    }
  }

  static Future<void> launchWeb(String url) async {
    await launchUri(url);
  }

  static Future<void> launchPhoneCall(String phoneNumber) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    await launchUri(uri.toString());
  }

  static Future<void> launchEmail(String emailAddress) async {
    final uri = Uri(scheme: 'mailto', path: emailAddress);
    await launchUri(uri.toString());
  }

  static Future<void> launchSMS(String phoneNumber, {String? message}) async {
    final uri = Uri(
      scheme: 'sms',
      path: phoneNumber,
      queryParameters: message != null ? {'body': message} : null,
    );
    await launchUri(uri.toString());
  }

  static void _showError(String title, String message) {
    MySnackBar.show(title, message);
  }
}

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

class UrlUtils {
  static openUrl(String url) async {
    // ignore: deprecated_member_use
    if (await canLaunch(url) != null) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openEmail(String email, {String subject = ''}) async {
    final Uri _emailLaunchUri = Uri(
        scheme: 'mailto', path: email, queryParameters: {'subject': subject});

    await launch(_emailLaunchUri.toString());
  }

  static openCall(String phoneNumber) async {
    await launch('tel:$phoneNumber');
  }

  static openSMS(String phoneNumber) async {
    await launch('sms:$phoneNumber');
  }

  static openWhatsapp(String number, String message) async {
    // String url = "whatsapp://send?phone=$number&text=$message";
    // await canLaunch(url) ? launch(url) : print('Tidak dapat membuka whatsapp');
    await canLaunch(urlWa(number, message))
        ? launch(urlWa(number, message))
        : print('Tidak dapat membuka whatsapp');
  }

  static urlWa(String number, String message) {
    if (Platform.isAndroid) {
      return "https://wa.me/$number/?text=${Uri.parse(message)}"; // new line
    } else {
      return "https://wa.me/$number/?text=${Uri.parse(message)}"; 
      // return "https://api.whatsapp.com/send?phone=$number=${Uri.parse(message)}"; // new line
    }
  }

  static callFromNumber(String number) {
    openUrl("tel:" + number.toString());
  }

  static openMap(double latitude, double longitude) {
    openUrl("http://maps.google.com/maps?q=$latitude+$longitude");
  }
}

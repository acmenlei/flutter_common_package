import 'package:flutter/services.dart';

class ChannelInfo {
  static const platform = MethodChannel('app.channel.shared.data');

  static Future<String> getFlavor() async {
    try {
      final String flavor = await platform.invokeMethod('getFlavor');
      return flavor;
    } catch (e) {
      return "Unknown";
    }
  }

  static Future<String?> getSensitiveData() async {
    try {
      final String result = await platform.invokeMethod('getSensitiveData');
      return result;
    } on PlatformException catch (e) {
      print("Failed to get sensitive data: '${e.message}'.");
      return null;
    }
  }
}

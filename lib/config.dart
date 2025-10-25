import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';

class AppConfig {
  static Future<String> getBaseUrl() async {
    if (Platform.isMacOS) {
      return 'http://localhost:3000';
    } else if (Platform.isWindows) {
      final info = NetworkInfo();
      final ip = await info.getWifiIP(); // auto-detect Windows IPv4
      return 'http://$ip:3000';
    } else {
      return 'http://127.0.0.1:3000';
    }
  }
}
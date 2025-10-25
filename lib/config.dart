import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';

// class AppConfig {
//   static Future<String> getBaseUrl() async {
//     if (Platform.isMacOS) {
//       return 'http://localhost:3000';
//     } else if (Platform.isWindows) {
//       final info = NetworkInfo();
//       final ip = await info.getWifiIP(); // auto-detect Windows IPv4
//       return 'http://$ip:3000';
//     } else {
//       return 'http://127.0.0.1:3000';
//     }
//   }
// }


class AppConfig {
  static Future<String> getBaseUrl() async {
    final info = NetworkInfo();

    if (Platform.isMacOS) {
      return 'http://localhost:3000';
    } else if (Platform.isWindows) {
      // For Windows desktop app
      final ip = await info.getWifiIP();
      return ip != null ? 'http://$ip:3000' : 'http://127.0.0.1:3000';
    } else if (Platform.isAndroid) {
      // Android emulator
      final ip = await info.getWifiIP();
      return 'http://$ip:3000';
    } else if (Platform.isIOS) {
      // iOS simulator
      return 'http://localhost:3000';
    } else {
      // Fallback for any unknown platform
      final ip = await info.getWifiIP();
      return ip != null ? 'http://$ip:3000' : 'http://127.0.0.1:3000';
    }
  }
}
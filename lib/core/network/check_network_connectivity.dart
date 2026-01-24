import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity{
  static Future<void> checkInitialConnectivity() async {
    final List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      print('Connected to mobile network.');
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      print('Connected to Wi-Fi.');
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      print('No internet connection.');
    } else {
      print('Other connectivity type: $connectivityResult');
    }
  }
}
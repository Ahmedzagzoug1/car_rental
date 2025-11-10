import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkConnectivity{
  static Future<bool> checkInternetConnectivity() async {
    final List<ConnectivityResult> connectivity = await Connectivity()
        .checkConnectivity();
    if (connectivity.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return true;
    }
  }
}
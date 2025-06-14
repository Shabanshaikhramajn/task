import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  static Future<bool> getConnectionStatus() async {
    final List<ConnectivityResult> connectivityResult = await Connectivity().checkConnectivity();

    if (connectivityResult.contains(ConnectivityResult.none)) {
      return true;
    }
    else{

      return false;
    }
  }
}

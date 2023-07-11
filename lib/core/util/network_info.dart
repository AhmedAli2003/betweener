import 'dart:io';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get hasConnection;
  Future<bool> get hasBandwidth => _checkBandwidth();
  Future<bool> get isReady async => await hasConnection && await hasBandwidth;

  const NetworkInfo();

  Future<bool> _checkBandwidth() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  const NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get hasConnection => _internetConnectionChecker.hasConnection;
}

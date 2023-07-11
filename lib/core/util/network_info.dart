import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get hasConnection;
  const NetworkInfo();
}

class NetworkInfoImpl extends NetworkInfo {
  final InternetConnectionChecker _internetConnectionChecker;

  const NetworkInfoImpl(this._internetConnectionChecker);

  @override
  Future<bool> get hasConnection => _internetConnectionChecker.hasConnection;
}

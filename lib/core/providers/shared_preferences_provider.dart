import 'package:betweener/core/constants/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AppSharedPreferencesProvider = StateNotifierProvider<SharedPreferencesNotifier, SharedPreferences>;

final sharedPreferencesProvider = Provider<SharedPreferences>((_) {
  throw UnimplementedError();
});

final appSharedPreferencesProvider = AppSharedPreferencesProvider((ref) {
  return SharedPreferencesNotifier(ref.watch(sharedPreferencesProvider));
});

class SharedPreferencesNotifier extends StateNotifier<SharedPreferences> {
  SharedPreferencesNotifier(super.state);

  void setAccessToken(String accessToken) {
    state.setString(AppConstants.accessToken, 'Bearer $accessToken');
  }

  String getAccessToken() {
    return state.getString(AppConstants.accessToken) ?? '';
  }

  void setUserId(int id) {
    state.setInt(AppConstants.userId, id);
  }

  int getUserId() {
    return state.getInt(AppConstants.userId) ?? 0;
  }

  void setUserEmail(String email) {
    state.setString(AppConstants.userEmail, email);
  }

  String getUserEmail() {
    return state.getString(AppConstants.userEmail) ?? '';
  }

  void setUserPassword(String password) {
    state.setString(AppConstants.userPassword, password);
  }

  String getUserPassword() {
    return state.getString(AppConstants.userPassword) ?? '';
  }

  void setOnBoardingScreenFirstTime() {
    state.setBool(AppConstants.boardingScreenFirstTime, false);
  }

  bool getOnBoardingScreenFirstTime() {
    return state.getBool(AppConstants.boardingScreenFirstTime) ?? true;
  }

  void setIsLoggedIn(bool isLoggedIn) {
    state.setBool(AppConstants.isLoggedIn, isLoggedIn);
  }

  bool getIsLoggedIn() {
    return state.getBool(AppConstants.isLoggedIn) ?? false;
  }
}

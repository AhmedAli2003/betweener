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
}

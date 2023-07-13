import 'package:betweener/core/providers/auth_providers.dart';
import 'package:betweener/core/providers/params/login_param.dart';
import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goNext(WidgetRef ref) {
    final sharedPreferences = ref.read(appSharedPreferencesProvider.notifier);
    final email = sharedPreferences.getUserEmail();
    final password = sharedPreferences.getUserPassword();
    final isFirstTime = sharedPreferences.getOnBoardingScreenFirstTime();
    final isLoggedIn = sharedPreferences.getIsLoggedIn();
    if (isLoggedIn) {
      ref.read(loginProvider(LoginParm(email: email, password: password)));
    }
    Future.delayed(const Duration(seconds: 3), () {
      if (isFirstTime) {
        Navigator.pushReplacementNamed(context, AppRouter.onBoardingPage);
      } else if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, AppRouter.mainPage);
      } else {
        Navigator.pushReplacementNamed(context, AppRouter.loginPage);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        _goNext(ref);
        return const Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: Center(
            child: Text(
              'Betweener',
              style: TextStyle(
                fontSize: 48,
                color: AppColors.kLightDangerColor,
              ),
            ),
          ),
        );
      },
    );
  }
}

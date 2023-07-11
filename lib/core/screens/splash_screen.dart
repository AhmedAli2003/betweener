import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _goNext() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, AppRouter.onBoardingPage);
    });
  }

  @override
  void initState() {
    super.initState();
    _goNext();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}

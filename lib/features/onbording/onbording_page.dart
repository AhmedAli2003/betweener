import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/constants/app_assets.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:betweener/core/widgets/secondary_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Spacer(),
            SvgPicture.asset(AppAssets.onBoardingImage),
            const Text(
              'Just one Scan for everything',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.kPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            Consumer(
              builder: (context, ref, child) {
                return SecondaryButtonWidget(
                  text: 'Get Started',
                  width: double.infinity,
                  onTap: () {
                    ref.read(appSharedPreferencesProvider.notifier).setOnBoardingScreenFirstTime();
                    Navigator.pushReplacementNamed(context, AppRouter.loginPage);
                  },
                );
              },
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

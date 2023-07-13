import 'package:betweener/core/providers/shared_preferences_provider.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:betweener/features/active_share/receive_page.dart';
import 'package:betweener/features/home/home_page.dart';
import 'package:betweener/features/main_app/widgets/custom_floating_nav_bar.dart';
import 'package:betweener/features/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  int _currentIndex = 1;

  final screensList = [
    const ReceivePage(),
    const HomePage(),
    ProfilePage(),
  ];

  AppBar getAppBar() {
    if (_currentIndex == 0) {
      return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Active Sharing",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: AppColors.kPrimaryColor,
          ),
        ),
      );
    } else if (_currentIndex == 1) {
      return AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.qr_code_scanner_sharp,
              color: Colors.black,
            ),
          ),
        ],
      );
    } else {
      return AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(color: AppColors.kPrimaryColor),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(ref.watch(appSharedPreferencesProvider.notifier).getAccessToken());
    return Scaffold(
      appBar: getAppBar(),
      body: screensList[_currentIndex],
      extendBody: true,
      bottomNavigationBar: CustomFloatingNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      floatingActionButton: _currentIndex == 2
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRouter.newOrEditLink);
              },
              shape: const CircleBorder(),
              backgroundColor: AppColors.kPrimaryColor,
              child: const Icon(
                Icons.add,
                size: 40,
                color: Colors.white,
              ),
            )
          : null,
    );
  }
}

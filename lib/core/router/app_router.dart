import 'package:betweener/core/screens/splash_screen.dart';
import 'package:betweener/features/active_share/receive_page.dart';
import 'package:betweener/features/auth/login_page.dart';
import 'package:betweener/features/auth/register_page.dart';
import 'package:betweener/features/home/home_page.dart';
import 'package:betweener/features/main_app/main_page.dart';
import 'package:betweener/features/onbording/onbording_page.dart';
import 'package:betweener/features/profile/profile_page.dart';
import 'package:betweener/features/settings/edit_user_info_page.dart';
import 'package:betweener/features/settings/new_or_edit_link_page.dart';
import 'package:betweener/features/settings/user_data.dart';
import 'package:flutter/material.dart';

class AppRouter {
  // The constructor is private because we don't want to create any object from it
  AppRouter._();

  // RoutesNames
  static const String splashScreen = '/';
  static const String onBoardingPage = '/onBoardingPage';
  static const String loginPage = '/loginPage';
  static const String registerPage = '/registerPage';
  static const String homePage = '/homePage';
  static const String mainPage = '/mainPage';
  static const String profilePage = '/profilePage';
  static const String loginScreen = '/loginScreen';
  static const String receivePage = '/receivePage';
  static const String newOrEditLink = '/newOrEditLink';
  static const String editUserInfo = '/editUserInfo';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case onBoardingPage:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case registerPage:
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case mainPage:
        return MaterialPageRoute(builder: (_) => const MainPage());
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case profilePage:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      case receivePage:
        return MaterialPageRoute(builder: (_) => const ReceivePage());
      case newOrEditLink:
        return MaterialPageRoute(
          builder: (_) => const NewOrEditLinkPage(isNew: true),
        );
      case editUserInfo:
        return MaterialPageRoute(
          builder: (_) => const EditUserInfoPage(
            userData: UserData(
              username: 'test username',
              email: 'test@test.com',
              phone: '+123456789',
            ),
          ),
        );
      default:
        return null;
    }
  }
}

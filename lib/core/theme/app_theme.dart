import 'package:betweener/core/theme/app_colors.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final appTheme = ThemeData(
  useMaterial3: true,
  colorSchemeSeed: AppColors.kPrimaryColor,
  appBarTheme: const AppBarTheme(
    titleTextStyle: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.kPrimaryColor,
    ),
  ),
  scaffoldBackgroundColor: AppColors.kScaffoldColor,
);

void setSystemOverlayStyle() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
    ),
  );
}

import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_theme.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    setSystemOverlayStyle();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Betweener',
      theme: appTheme,
      initialRoute: AppRouter.profilePage,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}

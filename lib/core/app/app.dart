import 'package:betweener/core/provider/link_provider_controller.dart';
import 'package:betweener/core/router/app_router.dart';
import 'package:betweener/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    setSystemOverlayStyle();
    return ChangeNotifierProvider(create: (context) => LinkProviderController(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Betweener',
          theme: appTheme,
          initialRoute: AppRouter.splashScreen,
          onGenerateRoute: AppRouter.onGenerateRoute,);
      },
    );
  }
}

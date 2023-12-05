import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/modules/screens/meal/meal_detail_screen.dart';
import 'src/modules/screens/revenues/revenues_screen.dart';
import 'src/modules/screens/settings/settings_screen.dart';
import 'src/modules/screens/tabs_screen.dart';

import 'src/shared/themes/app_colors.dart';
import 'src/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: AppColors.primary,
          systemNavigationBarColor: AppColors.primary),
    );

    return MaterialApp(
      title: 'PayFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/home",
      routes: {
        // "/splash": (context) => const SplashPage(),
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.revenues: (context) => const RevenuesScreen(),
        AppRoutes.mealDetail: (context) => const MealDetailScreen(),
        AppRoutes.settings: (context) => const SettingsScreen(),
        // "/login": (context) => const LoginPage(),
        // "/barcode_scanner": (context) => const BarcodeScannerPage()
      },
      // onUnknownRoute: (settings) {
      //   return MaterialPageRoute(
      //     builder: (_) {
      //       return const HomeScreen();
      //     },
      //   );
      // },
    );
  }
}

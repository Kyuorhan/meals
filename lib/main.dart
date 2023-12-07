import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/data/dummy_data.dart';

import 'src/modules/screens/revenues/revenues_detail_screen.dart';
import 'src/modules/screens/category/category_screen.dart';
import 'src/modules/screens/settings/settings_screen.dart';
import 'src/modules/screens/tabs_screen.dart';

import 'src/shared/models/meal_model.dart';
import 'src/shared/themes/app_colors.dart';
import 'src/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MealModel> _availableMeals = dummyMeals;

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
      title: 'Meals',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/home",
      routes: {
        // "/splash": (context) => const SplashPage(),
        AppRoutes.home: (context) => const TabsScreen(),
        AppRoutes.category: (context) =>
            CategoryScreen(mealNodel: _availableMeals),
        AppRoutes.revenues: (context) => const RevenuesDetailScreen(),
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

import 'package:flutter/material.dart';
import 'package:meals/src/modules/screens/splash/splash_screen.dart';

import 'src/data/dummy_data.dart';

import 'src/modules/screens/revenues/revenues_detail_screen.dart';
import 'src/modules/screens/category/category_screen.dart';
import 'src/modules/screens/settings/settings_screen.dart';
import 'src/modules/screens/tabs_screen.dart';

import 'src/shared/models/meal_model.dart';
import 'src/shared/models/settings_model.dart';
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
  SettingsModel settings = SettingsModel();
  List<MealModel> _availableMeals = dummyMeals;
  final List<MealModel> _favoriteMeals = [];

  void _filterMeals(SettingsModel settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((mealModel) {
        final filterGluten = settings.isGlutenFree && !mealModel.isGlutenFree;
        final filterLactose =
            settings.isLactoseFree && !mealModel.isLactoseFree;
        final filterVegan = settings.isVegan && !mealModel.isVegan;
        final filterVegetarian =
            settings.isVegetarian && !mealModel.isVegetarian;

        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(MealModel mealModel) {
    setState(() {
      _favoriteMeals.contains(mealModel)
          ? _favoriteMeals.remove(mealModel)
          : _favoriteMeals.add(mealModel);
    });
  }

  bool _isFavorite(MealModel mealModel) {
    return _favoriteMeals.contains(mealModel);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Stations',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: AppColors.primary,
      ),
      initialRoute: "/splash",
      routes: {
        // "/splash": (context) => const SplashPage(),
        AppRoutes.home: (context) => TabsScreen(
              favoriteMeals: _favoriteMeals,
            ),

        AppRoutes.category: (context) => CategoryScreen(
              mealNodel: _availableMeals,
            ),
        AppRoutes.revenues: (context) => RevenuesDetailScreen(
              onToggleFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.settings: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterMeals,
            ),
        AppRoutes.splash: (context) => const SplashScreen(),
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

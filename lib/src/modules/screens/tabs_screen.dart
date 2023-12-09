import 'package:flutter/material.dart';

import '../../shared/models/meal_model.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_text_style.dart';
import '../../shared/widgets/main_drawer_widget.dart';

import 'favorite/favorite_screen.dart';
import 'home/home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    super.key,
    required this.favoriteMeals,
  });

  final List<MealModel> favoriteMeals;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Lista de Categorias',
        'screen': const HomeScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(favoriteMeals: widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.shape,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.background,
          size: 26,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        leadingWidth: 72,
        toolbarHeight: 72,
        title: Text(
          (_screens[_selectedScreenIndex]['title'] as String),
          // _titles[_selectedScreenIndex],
          style: TextStyles.titleHome,
        ),
      ),
      drawer: const MainDrawerWidget(),
      body: (_screens[_selectedScreenIndex]['screen'] as Widget),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedItemColor: AppColors.selected,
        unselectedItemColor: AppColors.background,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        iconSize: 26,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}

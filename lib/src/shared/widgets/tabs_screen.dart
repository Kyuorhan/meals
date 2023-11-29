import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';
import '../../modules/screens/favorite/favorite_screen.dart';
import '../../modules/screens/home/home_screen.dart';
import 'main_drawer_widget.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  // final List<Widget> _screens = [
  //   const HomeScreen(),
  //   const FavoriteScreen(),
  // ];
  final List<Map<String, Object>> _screens = [
    {'title': 'Lista de Categorias', 'screen': const HomeScreen()},
    {'title': 'Meus Favoritos', 'screen': const FavoriteScreen()},
  ];

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
        selectedItemColor: AppColors.select,
        unselectedItemColor: AppColors.background,
        iconSize: 26,
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
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

import 'package:flutter/material.dart';

import '../../shared/models/meal_model.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/widgets/custom/custom_navigationbars_widget.dart';
import '../../shared/widgets/custom/custom_statusbars_widget.dart';
import '../../shared/widgets/sidebar_drawer_widget.dart';

import 'favorite_screen.dart';
import 'home_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<MealModel> favoriteMeals;

  const TabsScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  // late DrawerObserver _navigatorObserver;
  late List<Map<String, Object>> _screens;

  int _selectedScreenIndex = 1;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        'title': 'Configuração',
        'screen': const HomeScreen(),
      },
      {
        'title': 'Lista de Categorias',
        'screen': const HomeScreen(),
      },
      {
        'title': 'Meus Favoritos',
        'screen': FavoriteScreen(
          favoriteMeals: widget.favoriteMeals,
        ),
      },
    ];
  }

  _selectScreen(int index) {
    if (index == 0) {
      // Abre a gaveta
      _scaffoldKey.currentState!.openDrawer();
    } else {
      setState(() {
        _selectedScreenIndex = index;
      });
    }
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.shape,
      // extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: CustomStatusBars(
        context: context,
        title: _screens[_selectedScreenIndex]['title'] as String,
        leading: Container(),
        // actions: [
        //   CustomAction(
        //       icon: const Icon(Icons.filter_alt),
        //       onPressed: () => Navigator.of(context)
        //           .pushNamed(AppRoutes.settings, arguments: false),
        //       tooltip: 'Filter')
        // ],
      ),
      drawer: SideBarDrawer(context: context, isDrawerEnabled: true),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavigationBars(
        currentIndex: _selectedScreenIndex,
        onTabTapped: _selectScreen,
      ),
    );
  }
}

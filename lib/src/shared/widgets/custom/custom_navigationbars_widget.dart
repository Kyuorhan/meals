import 'package:flutter/material.dart';
import 'package:meals/src/shared/themes/app_colors.dart';

class CustomNavigationBars extends StatelessWidget {
  const CustomNavigationBars({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  final int currentIndex;
  final ValueChanged<int> onTabTapped;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    late List<BottomNavigationBarItem> selectNavigationBarItem = [
      BottomNavigationBarItem(
        icon: const Icon(Icons.menu_outlined),
        activeIcon: Icon(
          Icons.menu,
          size: size.width / 17,
        ),
        label: 'Menu',
        tooltip: 'Menu',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        activeIcon: Icon(
          Icons.home,
          size: size.width / 17,
        ),
        label: 'Categorias',
        tooltip: 'Categorias',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.star),
        activeIcon: Icon(
          Icons.star,
          size: size.width / 17,
        ),
        label: 'Favoritos',
        tooltip: 'Favoritos',
      ),
    ];

    return BottomAppBar(
      color: AppColors.transparent,
      // height: size.width <= 461 ? size.width * 0.24 : size.width * 0.15,
      height: size.width <= 461 ? 96 : 112,
      elevation: 0.0,
      padding: EdgeInsets.only(
        bottom: 20.0,
        left: size.width * 0.08,
        right: size.width * 0.08,
        top: 10.0,
      ),
      // shape: const CircularNotchedRectangle(),
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(),
      ),
      child: Material(
        color: AppColors.transparent,
        // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        elevation: 8.5,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          child: BottomNavigationBar(
            backgroundColor: AppColors.primary,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            // type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColors.selected,
            unselectedItemColor: AppColors.background,
            currentIndex: currentIndex,
            onTap: onTabTapped,
            iconSize: size.width / 18.5,
            selectedFontSize: 10.0,
            items: selectNavigationBarItem,
          ),
        ),
      ),
    );
  }
}

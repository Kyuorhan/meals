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

    final navigatioBarScaler = MediaQuery.textScalerOf(context);
    final scaledNavigatioBar =
        navigatioBarScaler.scale(size.width <= 461 ? 96 : 112).roundToDouble();
    final scaledPaddingNavigatioBar = scaledNavigatioBar * 0.32;
    final scaledIconSize = scaledNavigatioBar * 0.24;
    // final scaledIconSize = size.width * 0.052;

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
          size: scaledIconSize * 1.1,
        ),
        label: 'Categorias',
        tooltip: 'Categorias',
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.star),
        activeIcon: Icon(
          Icons.star,
          size: scaledIconSize * 1.1,
        ),
        label: 'Favoritos',
        tooltip: 'Favoritos',
      ),
    ];

    return BottomAppBar(
      color: AppColors.transparent,
      height: scaledNavigatioBar,
      elevation: 0.0,
      padding: EdgeInsets.only(
        bottom: scaledPaddingNavigatioBar * 0.75,
        left: scaledPaddingNavigatioBar * 1.25,
        right: scaledPaddingNavigatioBar * 1.25,
        top: scaledPaddingNavigatioBar * 0.25,
      ),
      // shape: const CircularNotchedRectangle(),
      shape: const AutomaticNotchedShape(
        RoundedRectangleBorder(),
        StadiumBorder(),
      ),
      child: Material(
        color: AppColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
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
            iconSize: scaledIconSize,
            selectedFontSize: 10.0,
            items: selectNavigationBarItem,
          ),
        ),
      ),
    );
  }
}

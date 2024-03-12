import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';

import '../themes/app_colors.dart';
import '../themes/app_scalable_text.dart';

class SideBarDrawer extends StatelessWidget {
  final BuildContext context;
  final bool isDrawerEnabled;

  const SideBarDrawer({
    super.key,
    required this.context,
    required this.isDrawerEnabled,
  });

  // Defina a largura do SideBarDrawer
  final double sideBarWidth = 304;

  TextScaler get sideBarScaler => MediaQuery.textScalerOf(context);
  double get scaledSideBar => sideBarScaler.scale(sideBarWidth).roundToDouble();

  Widget _createItem(IconData icon, String label, Function() onTap) {
    final scaledCreateItemPadding =
        sideBarScaler.scale(scaledSideBar).roundToDouble();

    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        vertical: scaledCreateItemPadding * 0.056,
        horizontal: scaledCreateItemPadding * 0.068,
      ),
      leading: Padding(
        padding: EdgeInsets.all(sideBarScaler.scale(8.0)),
        child: Icon(
          icon,
          size: scaledSideBar == sideBarWidth ? 26 : 32,
          color: AppColors.secundary,
        ),
      ),
      title: ScalableText.subTitleDrawer(
        context: context,
        title: label,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaledDrawer = sideBarScaler.scale(scaledSideBar).roundToDouble();
    return Drawer(
      backgroundColor: AppColors.shape,
      surfaceTintColor: AppColors.primary,
      width: scaledDrawer,
      elevation: 2.0,
      shadowColor: AppColors.black.withOpacity(0.85),
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                )
              ],
              color: AppColors.drawer,
            ),
            height: scaledDrawer * 0.56,
            width: double.infinity,
            padding: EdgeInsets.all(scaledDrawer * 0.125),
            child: ScalableText.titleDrawer(
              context: context,
              title: 'Vamos Cozinhar?',
            ),
          ),
          _createItem(
            Icons.restaurant,
            'Refeições',
            () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.home, arguments: false),
          ),
          _createItem(
            Icons.filter_alt,
            'Filtros',
            () => Navigator.of(context)
                .pushReplacementNamed(AppRoutes.filters, arguments: true),
          ),
          _createItem(
            Icons.settings,
            'Configurações',
            () => (),
          ),
        ],
      ),
    );
  }
}

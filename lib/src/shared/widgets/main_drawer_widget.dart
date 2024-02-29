import 'package:flutter/material.dart';
import 'package:meals/src/utils/app_routes.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({
    super.key,
    required this.isDrawerEnabled,
  });

  final bool isDrawerEnabled;

  Widget _createItem(IconData icon, String label, Function() onTap) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      leading: Icon(
        icon,
        size: 26,
        color: AppColors.secundary,
      ),
      title: Text(
        label,
        style: TextStyles.subTitleDrawer,
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: AppColors.shape,
      surfaceTintColor: AppColors.primary,
      elevation: 4,
      child: Column(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            color: AppColors.drawer,
            height: mySize.height / 7.2,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyles.titleDrawer,
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

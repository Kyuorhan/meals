import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';

class MainDrawerWidget extends StatelessWidget {
  const MainDrawerWidget({super.key});

  Widget _createItem(IconData icon, String label) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        label,
        style: TextStyles.subTitleDrawer,
      ),
      onTap: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;

    return Drawer(
      backgroundColor: AppColors.shape,
      surfaceTintColor: AppColors.primary,
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
          _createItem(Icons.restaurant, 'Refeições'),
          _createItem(Icons.settings, 'Configurações'),
        ],
      ),
    );
  }
}

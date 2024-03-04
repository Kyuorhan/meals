import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_scalable_text.dart';

class CustomAction {
  final Icon icon;
  final VoidCallback onPressed;
  final String? tooltip;

  CustomAction({required this.icon, required this.onPressed, this.tooltip});
}

class CustomStatusBars extends StatelessWidget implements PreferredSizeWidget {
  const CustomStatusBars({
    super.key,
    required this.context,
    this.leading,
    required this.title,
    this.actions,
  });

  final BuildContext context;
  final Widget? leading;
  final String title;
  final List<CustomAction>? actions;

  TextScaler get statusBarScaler => MediaQuery.textScalerOf(context);
  double get scaledStatusBar => statusBarScaler.scale(74).roundToDouble();

  @override
  Size get preferredSize => Size.fromHeight(scaledStatusBar);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constraints) {
      // final scaledStatusBar = statusBarScaler.scale(70).roundToDouble();

      return AppBar(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.shape,
        surfaceTintColor: AppColors.primary,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(
          color: AppColors.background,
          size: preferredSize.height == 74 ? 26 : 32,
        ),
        leadingWidth: scaledStatusBar,
        toolbarHeight: scaledStatusBar,
        leading: leading,
        title: ScalableText.titleHome(
          context: context,
          title: title,
        ),
        actions: actions?.map((action) {
          return SizedBox(
            height: scaledStatusBar,
            width: scaledStatusBar,
            child: IconButton(
              icon: action.icon,
              onPressed: action.onPressed,
              tooltip: action.tooltip,
            ),
          );
        }).toList(),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      );
    });
  }
}

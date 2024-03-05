import 'package:flutter/material.dart';

import '../../themes/app_colors.dart';
import '../../themes/app_scalable_text.dart';

class CustomAction {
  final Icon icon;
  final VoidCallback onPressed;
  final String? tooltip;

  CustomAction({required this.icon, required this.onPressed, this.tooltip});
}

// PreferredSizeWidget
class CustomStatusBars extends StatelessWidget implements PreferredSizeWidget {
  static double maxHeight = 0.0;

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

  // Defina a altura do CustomStatusBars
  final double statusBarsHeight = 76;

  TextScaler get statusBarScaler => MediaQuery.textScalerOf(context);
  double get scaledStatusBar {
    maxHeight = statusBarScaler.scale(statusBarsHeight).roundToDouble();
    return maxHeight;
  }

  @override
  Size get preferredSize => Size.fromHeight(scaledStatusBar);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (BuildContext context, constraints) {
      final scaledStatusBarPadding =
          statusBarScaler.scale(scaledStatusBar).roundToDouble();

      return AppBar(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.shape,
        surfaceTintColor: AppColors.primary,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(
          color: AppColors.background,
          size: preferredSize.height == statusBarsHeight ? 26 : 32,
        ),
        leadingWidth: scaledStatusBarPadding,
        toolbarHeight: scaledStatusBarPadding,
        leading: leading,
        title: ScalableText.titleHome(
          context: context,
          title: title,
        ),
        actions: actions?.map((action) {
          return SizedBox(
            height: scaledStatusBarPadding,
            width: scaledStatusBarPadding,
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

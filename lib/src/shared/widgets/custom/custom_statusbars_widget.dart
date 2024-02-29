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
    this.leading,
    // this.leadingWidth,
    this.toolbarHeight = kToolbarHeight,
    required this.title,
    this.actions,
  });

  final Widget? leading;
  // final double? leadingWidth;
  final double toolbarHeight;
  final String title;
  // final Widget title;
  final List<CustomAction>? actions;

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight <= 70 ? 70 : 86);
  // Size get preferredSize => Size.fromHeight(toolbarHeight);

  @override
  Widget build(BuildContext context) {
    // final textScaler = MediaQuery.textScalerOf(context);
    // final scaledFontSize = textScaler.scale(fontSize);
    // final int titleLength = title.length;
    // final double fontScaler = double.parse(titleLength.toStringAsFixed(1));

    return LayoutBuilder(builder: (BuildContext context, constraints) {
      return AppBar(
        backgroundColor: AppColors.primary,
        shadowColor: AppColors.shape,
        surfaceTintColor: AppColors.primary,
        centerTitle: true,
        elevation: 4,
        iconTheme: IconThemeData(
          color: AppColors.background,
          size: preferredSize.height <= 70 ? 26 : 32,
        ),
        leadingWidth: preferredSize.height <= 70.0
            ? kToolbarHeight * 1.25
            : kToolbarHeight * 1.5,
        toolbarHeight: preferredSize.height <= 70.0
            ? kToolbarHeight * 1.25
            : kToolbarHeight * 1.5,
        leading: leading,
        title: ScalableText.titleHome(
          context: context,
          title: title,
        ),
        // title: Text(
        //   title,
        //   maxLines: 2,
        //   textAlign: TextAlign.center,
        //   textScaler: textScaler,
        //   style: TextStyles.titleHome,
        //   // style: TextStyle(
        //   //   fontFamily: 'LexendDeca',
        //   //   fontSize: scaledFontSize,
        //   //   // fontSize: TextScaler.linear(
        //   //   //   fontScaler <= 1.2 ? 1.0 : 0.85,
        //   //   // ).scale(
        //   //   //   fontScaler <= 1.2 ? 24 : 22,
        //   //   // ),
        //   //   fontWeight: FontWeight.w500,
        //   //   color: AppColors.secundary,
        //   // ),
        // ),
        actions: actions?.map((action) {
          return IconButton(
            padding: EdgeInsets.symmetric(
              horizontal: preferredSize.height <= 70 ? 22 : 26,
              vertical: preferredSize.height <= 70 ? 22 : 26,
            ),
            icon: action.icon,
            onPressed: action.onPressed,
            tooltip: action.tooltip,
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

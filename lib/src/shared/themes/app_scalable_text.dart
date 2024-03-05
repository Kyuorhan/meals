import 'package:flutter/material.dart';

import 'app_colors.dart';

class ScalableText {
  static Widget titleHome({
    required BuildContext context,
    required String title,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(title.length <= 25 ? 20 : 18);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.secundary,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  static Widget subTitleCategory({
    required BuildContext context,
    required String title,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(15);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.background.withOpacity(0.9),
      ),
      maxLines: 2,
    );
  }

  static Widget subTitleMealItems({
    required BuildContext context,
    required String title,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(15);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.background.withOpacity(0.9),
      ),
      overflow: TextOverflow.fade,
      softWrap: true,
    );
  }

  static Widget subTitleMealItemsDetails({
    required BuildContext context,
    required String title,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(14);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.background,
      ),
    );
  }

  static Widget subTitleRevenues({
    required BuildContext context,
    required String title,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(18);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w600,
        color: AppColors.background.withOpacity(0.9),
      ),
    );
  }

  static Widget subTitleRevenuesDetails({
    required BuildContext context,
    required String title,
    Color? color,
  }) {
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(14);

    return Text(
      title,
      style: TextStyle(
        fontFamily: 'LexendDeca',
        fontSize: scaledFontSize,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }
}

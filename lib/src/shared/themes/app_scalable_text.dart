import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class ScalableText {
  static Widget titleHome({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(title.length <= 25 ? 20 : 18),
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
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(15),
        fontWeight: FontWeight.w500,
        color: AppColors.background.withOpacity(0.9),
      ),
      maxLines: 2,
    );
  }

  static Widget titleDrawer({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(20),
        fontWeight: FontWeight.w600,
        color: AppColors.secundary,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  static Widget subTitleDrawer({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(14),
        fontWeight: FontWeight.w600,
        color: AppColors.background,
      ),
    );
  }

  static Widget titleFilter({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(16),
        fontWeight: FontWeight.w600,
        color: AppColors.secundary,
      ),
    );
  }

  static Widget subTitleFilter({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.inter(
        fontSize: textScalers.scale(15),
        fontWeight: FontWeight.w600,
        color: AppColors.background.withOpacity(0.9),
      ),
    );
  }

  static Widget subTitleMealItems({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(15),
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
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(15),
        fontWeight: FontWeight.w500,
        color: AppColors.background,
      ),
    );
  }

  static Widget subTitleRevenues({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        fontSize: textScalers.scale(18),
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
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.lexendDeca(
        // fontFamily: 'LexendDeca',
        fontSize: textScalers.scale(14),
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  static Widget manual({
    required BuildContext context,
    required String title,
  }) {
    final TextScaler textScalers = MediaQuery.textScalerOf(context);

    return Text(
      title,
      style: TextStyles.manual(
        // fontFamily: 'LexendDeca',
        fontSize: textScalers.scale(title.length <= 25 ? 20 : 18),
        fontWeight: FontWeight.w600,
        color: AppColors.secundary,
      ),
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }
}

class ScalableTextStyles {
  static Widget titleHome({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
      ).titleHome,
      maxLines: 2,
      textAlign: TextAlign.center,
    );
  }

  static Widget subTitleCategory({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
      ).subTitleCategory,
      maxLines: 2,
    );
  }

  static Widget subTitleMealItems({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
      ).subTitleCategory,
      overflow: TextOverflow.fade,
      softWrap: true,
    );
  }

  static Widget subTitleMealItemsDetails({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
      ).subTitleMealItemsDetails,
    );
  }

  static Widget subTitleRevenues({
    required BuildContext context,
    required String title,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
      ).subTitleRevenues,
    );
  }

  static Widget subTitleRevenuesDetails({
    required BuildContext context,
    required String title,
    Color? color,
  }) {
    return Text(
      title,
      style: TextScalersDisabled(
        context: context,
        title: title,
        color: color,
      ).subTitleRevenuesDetails,
    );
  }
}

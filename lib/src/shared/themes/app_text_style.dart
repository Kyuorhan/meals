import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class TextStyles {
  static TextStyle lexendDeca({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return GoogleFonts.lexendDeca(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle inter({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return GoogleFonts.inter(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle manual({
    String? fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}

// Código Morto abaixo

class TextScalersDisabled {
  final BuildContext context;
  final String title;
  final Color? color;

  TextScalersDisabled({
    required this.context,
    required this.title,
    this.color,
  });

  TextScaler get scalableFontSize => MediaQuery.textScalerOf(context);

  TextStyle get titleHome => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(title.length <= 25 ? 20 : 18),
        fontWeight: FontWeight.w600,
        color: AppColors.secundary,
      );
  TextStyle get subTitleCategory => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(15),
        fontWeight: FontWeight.w500,
        color: AppColors.background.withOpacity(0.9),
      );
  TextStyle get subTitleMealItems => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(15),
        fontWeight: FontWeight.w500,
        color: AppColors.background.withOpacity(0.9),
      );
  TextStyle get subTitleMealItemsDetails => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(14),
        fontWeight: FontWeight.w500,
        color: AppColors.background,
      );
  TextStyle get subTitleRevenues => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(18),
        fontWeight: FontWeight.w600,
        color: AppColors.background.withOpacity(0.9),
      );
  TextStyle get subTitleRevenuesDetails => GoogleFonts.lexendDeca(
        fontSize: scalableFontSize.scale(14),
        fontWeight: FontWeight.w600,
        color: color,
      );
}

class TextStylesDisabled {
  static final titleHome = GoogleFonts.lexendDeca(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: AppColors.secundary,
  );
  static final titleFavorite = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.secundary,
  );
  static final titleCategoryItens = GoogleFonts.lexendDeca(
    fontWeight: FontWeight.w500,
    color: AppColors.background,
    fontSize: 15,
  );
  static final titleMealItens = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );
  static final subTitleMealItens = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );
  static final titleMealDetail = GoogleFonts.lexendDeca(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final subTitleMealDetail = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.background,
  );
  static final subTitleMealDetailBlack = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.secundary,
  );
  static final titleDrawer = GoogleFonts.lexendDeca(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.secundary,
  );
  static final subTitleDrawer = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.background,
  );
  static final titleSettings = GoogleFonts.lexendDeca(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.secundary,
  );
  static final subTitleSettings = GoogleFonts.lexendDeca(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.background,
  );
  // static final subTitleCategoryItens = GoogleFonts.inter(
  //   fontSize: 12,
  //   fontWeight: FontWeight.w600,
  //   color: AppColors.background,
  // );

  static final textStyleBody = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.body,
  );
  static final textStyleHeading = GoogleFonts.lexendDeca(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.heading,
  );
}

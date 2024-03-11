import 'dart:math';

import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../shared/widgets/category_items_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // void onDrawer(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 0), () {
  //     Scaffold.of(context).openDrawer();
  //   });
  // }P

  // Defina a altura padrão dos items
  final double categoryItemsHeight = 120;

  @override
  Widget build(BuildContext context) {
    TextScaler categoryScaler = MediaQuery.textScalerOf(context);

    return LayoutBuilder(builder: (context, constraints) {
      final scaledNavigatioBar = categoryScaler
          .scale(constraints.maxHeight <= 461 ? 96 : 112)
          .roundToDouble();

      // final categoryItems = categoryScaler.scale(categoryItemsHeight);
      // Defina a largura e Espaçamento do GridView
      final scaledCategoryPadding = constraints.maxWidth * 0.052;
      // Defina o número de colunas com base na largura da tela
      final crossAxisCount =
          max(min(constraints.maxWidth ~/ 180.toInt(), 2), 1);
      // Defina a altura dos items com base na altura da tela
      final mainAxisExtent =
          categoryScaler.scale(constraints.maxHeight / 7.2).roundToDouble();

      return GridView(
        padding: EdgeInsets.only(
          bottom: scaledNavigatioBar * 1.25,
          left: scaledCategoryPadding,
          right: scaledCategoryPadding,
          top: scaledCategoryPadding,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          childAspectRatio: 3 / 2.15,
          crossAxisSpacing: scaledCategoryPadding,
          mainAxisSpacing: scaledCategoryPadding,
          mainAxisExtent: mainAxisExtent <= categoryItemsHeight
              ? categoryItemsHeight
              : mainAxisExtent,
        ),
        children: dummyCategories.map((cat) {
          return CategoryItemsWidget(categoryModel: cat);
        }).toList(),
      );
    });
  }
}

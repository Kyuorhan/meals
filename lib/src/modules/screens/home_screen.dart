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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final categoryScaler = MediaQuery.textScalerOf(context);
      final scaledNavigatioBar = categoryScaler
          .scale(constraints.maxHeight <= 461 ? 96 : 112)
          .roundToDouble();
      // Defina a largura e Espaçamento do GridView
      final scaledCategory = constraints.maxWidth * 0.052;
      // Defina o número de colunas com base na largura da tela
      final crossAxisCount =
          max(min(constraints.maxWidth ~/ 180.toInt(), 2), 1);
      // Defina a altura dos items com base na largura da tela
      final mainAxisExtent = (constraints.maxHeight / 6.4).roundToDouble();

      return GridView(
        padding: EdgeInsets.only(
          bottom: scaledNavigatioBar * 1.25,
          left: scaledCategory,
          right: scaledCategory,
          top: scaledCategory,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: scaledCategory,
          mainAxisSpacing: scaledCategory,
          mainAxisExtent: mainAxisExtent <= 120 ? 120 : mainAxisExtent,
        ),
        children: dummyCategories.map((cat) {
          return CategoryItemsWidget(categoryModel: cat);
        }).toList(),
      );
    });
  }
}

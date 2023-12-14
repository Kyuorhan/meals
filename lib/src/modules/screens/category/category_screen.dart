import 'package:flutter/material.dart';

import '../../../shared/models/category_model.dart';
import '../../../shared/models/meal_model.dart';

import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';

import '../../../shared/widgets/meal_items_widget.dart';
import '../../../utils/app_routes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.mealNodel,
    // required this.isDrawerEnabled,
  });

  final List<MealModel> mealNodel;
  // final bool isDrawerEnabled;

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    final categoryMeal = mealNodel.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.shape,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: AppColors.background,
          size: 26,
        ),
        leadingWidth: 72,
        toolbarHeight: 72,
        title: Text(
          category.title,
          style: TextStyles.titleHome,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(
              icon: const Icon(Icons.filter_alt),
              // onPressed: () => () {
              //   Scaffold.of(context).openDrawer();
              // },
              onPressed: () => Navigator.of(context)
                  .pushNamed(AppRoutes.settings, arguments: false),
              tooltip: 'Filter',
            ),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (ctx, index) {
            return MealItemsWidget(
              mealModel: categoryMeal[index],
            );
          },
        ),
      ),
    );
  }
}

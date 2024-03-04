import 'package:flutter/material.dart';

import '../../../shared/models/category_model.dart';
import '../../../shared/models/meal_model.dart';

import '../../../shared/themes/app_colors.dart';

import '../../../shared/widgets/custom/custom_statusbars_widget.dart';
import '../../../shared/widgets/meal_items_widget.dart';
import '../../../utils/app_routes.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.mealNodel,
  });

  final List<MealModel> mealNodel;

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    final categoryMeal = mealNodel.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.shape,
      extendBodyBehindAppBar: true,
      appBar: CustomStatusBars(
        context: context,
        title: category.title,
        actions: [
          CustomAction(
            icon: const Icon(Icons.filter_alt),
            onPressed: () => Navigator.of(context)
                .pushNamed(AppRoutes.filters, arguments: false),
            tooltip: 'Filters',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
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

import 'package:flutter/material.dart';

import '../../../data/dummy_data.dart';
import '../../../shared/models/category_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/meal_itens_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    final categoryMeal = dummyMeals.where((meal) {
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        title: Text(
          category.title,
          style: TextStyles.titleHome,
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeal.length,
          itemBuilder: (ctx, index) {
            return MealItensWidget(
              mealModel: categoryMeal[index],
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/meal_items_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({
    super.key,
    required this.favoriteMeals,
  });

  final List<MealModel> favoriteMeals;

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma refeição foi marcado como favorita!',
          style: TextStyles.titleHome,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItemsWidget(mealModel: favoriteMeals[index]);
        },
      );
    }
  }
}

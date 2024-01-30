import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/meal_items_widget.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
    required this.favoriteMeals,
  });

  final List<MealModel> favoriteMeals;

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text(
          'Nenhuma refeição foi marcado como favorita!',
          style: TextStyles.titleFavorite,
        ),
      );
    } else {
      return ListView.builder(
        itemCount: widget.favoriteMeals.length,
        itemBuilder: (context, index) {
          return MealItemsWidget(
            mealModel: widget.favoriteMeals[index],
            // onToggleFavorite: (updatedMealModel) {
            //   setState(() {
            //     widget.favoriteMeals[widget.favoriteMeals
            //         .indexOf(updatedMealModel)] = updatedMealModel;
            //   });
            // },
          );
        },
      );
    }
  }
}

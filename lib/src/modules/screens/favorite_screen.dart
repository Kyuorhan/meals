import 'package:flutter/material.dart';

import '../../shared/models/meal_model.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/widgets/meal_items_widget.dart';

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
    final textScaler = MediaQuery.textScalerOf(context);
    final scaledFontSize = textScaler.scale(15);

    Size size = MediaQuery.of(context).size;

    if (widget.favoriteMeals.isEmpty) {
      return Container(
        padding: EdgeInsets.only(
          left: size.width * 0.12,
          right: size.width * 0.12,
          bottom: size.width <= 461 ? 120 : 136.2,
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          maxLines: 2,
          textAlign: TextAlign.center,
          'Nenhuma refeição foi marcado como favorita!',
          style: TextStyle(
            fontFamily: 'LexendDeca',
            fontSize: scaledFontSize,
            fontWeight: FontWeight.w500,
            color: AppColors.secundary,
          ),
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

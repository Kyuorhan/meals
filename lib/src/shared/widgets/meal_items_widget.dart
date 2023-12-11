import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';
import '../models/meal_model.dart';
import '../themes/app_colors.dart';
import '../themes/app_text_style.dart';

class MealItemsWidget extends StatelessWidget {
  const MealItemsWidget({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          AppRoutes.revenues,
          arguments: mealModel,
        )
        .then((result) => {});
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        margin: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    mealModel.imgUrl,
                    height: mySize.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    ),
                    width: mySize.width * 0.75,
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.5,
                      horizontal: 20,
                    ),
                    child: Text(
                      mealModel.title,
                      style: TextStyles.titleMealItens,
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(children: [
                    const Icon(Icons.schedule, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      '${mealModel.duration} min',
                      style: TextStyles.subTitleMealItens,
                    )
                  ]),
                  Row(children: [
                    const Icon(Icons.work, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      mealModel.complexityText,
                      style: TextStyles.subTitleMealItens,
                    )
                  ]),
                  Row(children: [
                    const Icon(Icons.attach_money, color: AppColors.primary),
                    const SizedBox(width: 6),
                    Text(
                      mealModel.costText,
                      style: TextStyles.subTitleMealItens,
                    )
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

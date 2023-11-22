import 'package:flutter/material.dart';
import 'package:meals/src/utils/app_routes.dart';

import '../models/meal_model.dart';
import '../themes/app_text_style.dart';

class MealItensWidget extends StatelessWidget {
  const MealItensWidget({
    super.key,
    required this.mealModel,
  });

  final MealModel mealModel;

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.mealDetail,
      arguments: mealModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
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
                  right: 10,
                  bottom: 20,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black45,
                      borderRadius: BorderRadius.all(Radius.circular(2.5)),
                    ),
                    width: mySize.width * 0.75,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
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
                    const Icon(Icons.schedule),
                    const SizedBox(width: 6),
                    Text('${mealModel.duration} min')
                  ]),
                  Row(children: [
                    const Icon(Icons.work),
                    const SizedBox(width: 6),
                    Text(mealModel.complexityText)
                  ]),
                  Row(children: [
                    const Icon(Icons.attach_money),
                    const SizedBox(width: 6),
                    Text(mealModel.costText)
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

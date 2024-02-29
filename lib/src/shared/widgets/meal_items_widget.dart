import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';
import '../models/meal_model.dart';
import '../themes/app_colors.dart';
import '../themes/app_scalable_text.dart';

class MealItemsWidget extends StatelessWidget {
  const MealItemsWidget({
    super.key,
    required this.mealModel,
    // required this.onToggleFavorite,
  });

  final MealModel mealModel;
  // final Function(MealModel) onToggleFavorite;

  void _selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          AppRoutes.revenues,
          arguments: mealModel,
        )
        .then((result) => {
              // Pode adicionar lógica aqui após o retorno da tela RevenuesDetailScreen, se necessário
            });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final textScaler = MediaQuery.textScalerOf(context);
    final iconSize = textScaler.scale(22);

    return Padding(
      padding: EdgeInsets.only(
        left: size.width * 0.04,
        right: size.width * 0.04,
        top: size.width * 0.045,
      ),
      child: InkWell(
        onTap: () => _selectMeal(context),
        borderRadius: BorderRadius.circular(15.0),
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.5),
                AppColors.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      child: Opacity(
                        opacity: 0.75,
                        child: Image.network(
                          mealModel.imgUrl,
                          // height: 200,
                          height: size.height * 0.24,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                    right: 0,
                    bottom: 20,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.0),
                          bottomLeft: Radius.circular(5.0),
                        ),
                      ),
                      width: size.width * 0.65,
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.5,
                        horizontal: 15.0,
                      ),
                      child: ScalableText.subTitleMealItens(
                        title: mealModel.title,
                        context: context,
                      ),
                    ),
                  )
                  // Material(
                  //   color: Colors.black.withOpacity(0.5),
                  //   type: MaterialType.transparency,
                  // )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                  vertical: size.width * 0.04,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(children: [
                      Icon(
                        Icons.schedule,
                        color: AppColors.secundary,
                        size: iconSize,
                      ),
                      const SizedBox(width: 8),
                      ScalableText.subTitleMealItensDetails(
                        context: context,
                        title: '${mealModel.duration} min',
                      )
                      // Text(
                      //   '${mealModel.duration} min',
                      //   // style: TextStyles.subTitleMealItens,
                      //   style: GoogleFonts.lexendDeca(
                      //     fontSize: subTitleMealItens,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColors.background,
                      //   ),
                      // )
                    ]),
                    Row(children: [
                      Icon(
                        Icons.work,
                        color: AppColors.secundary,
                        size: iconSize,
                      ),
                      const SizedBox(width: 8),
                      ScalableText.subTitleMealItensDetails(
                        context: context,
                        title: mealModel.complexityText,
                      )
                      // Text(
                      //   mealModel.complexityText,
                      //   // style: TextStyles.subTitleMealItens,
                      //   style: GoogleFonts.lexendDeca(
                      //     fontSize: subTitleMealItens,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColors.background,
                      //   ),
                      // )
                    ]),
                    Row(children: [
                      Icon(
                        Icons.attach_money,
                        color: AppColors.secundary,
                        size: iconSize,
                      ),
                      const SizedBox(width: 2),
                      ScalableText.subTitleMealItensDetails(
                        context: context,
                        title: mealModel.costText,
                      )
                      // Text(
                      //   mealModel.costText,
                      //   // style: TextStyles.subTitleMealItens,
                      //   style: GoogleFonts.lexendDeca(
                      //     fontSize: subTitleMealItens,
                      //     fontWeight: FontWeight.w500,
                      //     color: AppColors.background,
                      //   ),
                      // )
                    ]),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class MealItemsWidget extends StatelessWidget {
//   const MealItemsWidget({
//     super.key,
//     required this.mealModel,
//     // required this.onToggleFavorite,
//   });

//   final MealModel mealModel;
//   // final Function(MealModel) onToggleFavorite;

//   void _selectMeal(BuildContext context) {
//     Navigator.of(context)
//         .pushNamed(
//           AppRoutes.revenues,
//           arguments: mealModel,
//         )
//         .then((result) => {
//               // Pode adicionar lógica aqui após o retorno da tela RevenuesDetailScreen, se necessário
//             });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Padding(
//       padding: EdgeInsets.all(size.width * 0.04),
//       child: InkWell(
//         onTap: () => _selectMeal(context),
//         borderRadius: BorderRadius.circular(15.0),
//         splashColor: Theme.of(context).primaryColor,
//         child: Card(
//           color: AppColors.primary,
//           surfaceTintColor: AppColors.primary,
//           // margin: EdgeInsets.symmetric(
//           //   horizontal: size.width * 0.0,
//           //   vertical: size.width * 0.0,
//           // ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           elevation: 4,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   ClipRRect(
//                       borderRadius: const BorderRadius.only(
//                         topLeft: Radius.circular(15.0),
//                         topRight: Radius.circular(15.0),
//                       ),
//                       child: Opacity(
//                         opacity: 0.75,
//                         child: Image.network(
//                           mealModel.imgUrl,
//                           height: size.height * 0.25,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       )),
//                   Positioned(
//                     right: 0,
//                     bottom: 20,
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         color: Colors.black45,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(5.0),
//                           bottomLeft: Radius.circular(5.0),
//                         ),
//                       ),
//                       width: size.width * 0.70,
//                       padding: const EdgeInsets.symmetric(
//                         vertical: 8.5,
//                         horizontal: 20,
//                       ),
//                       child: Text(
//                         mealModel.title,
//                         style: TextStyles.titleMealItens,
//                         softWrap: true,
//                         overflow: TextOverflow.fade,
//                       ),
//                     ),
//                   )
//                   // Material(
//                   //   color: Colors.black.withOpacity(0.5),
//                   //   type: MaterialType.transparency,
//                   // )
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Row(children: [
//                       const Icon(Icons.schedule, color: AppColors.secundary),
//                       const SizedBox(width: 6),
//                       Text(
//                         '${mealModel.duration} min',
//                         style: TextStyles.subTitleMealItens,
//                       )
//                     ]),
//                     Row(children: [
//                       const Icon(Icons.work, color: AppColors.secundary),
//                       const SizedBox(width: 6),
//                       Text(
//                         mealModel.complexityText,
//                         style: TextStyles.subTitleMealItens,
//                       )
//                     ]),
//                     Row(children: [
//                       const Icon(Icons.attach_money,
//                           color: AppColors.secundary),
//                       const SizedBox(width: 6),
//                       Text(
//                         mealModel.costText,
//                         style: TextStyles.subTitleMealItens,
//                       )
//                     ]),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

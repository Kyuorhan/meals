import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_scalable_text.dart';
import '../../../shared/themes/app_text_style.dart';
import '../../../shared/widgets/custom/custom_statusbars_widget.dart';
import '../../../utils/app_routes.dart';

class RevenuesDetailScreen extends StatelessWidget {
  const RevenuesDetailScreen({
    super.key,
    // required this.mealModel,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

  // final MealModel mealModel;
  final Function(MealModel) onToggleFavorite;
  final bool Function(MealModel) isFavorite;

  Widget _createSectionTitle(BuildContext context, String title) {
    final createSectionScaler = MediaQuery.textScalerOf(context);
    final scaledCreateSectionPadding = createSectionScaler.scale(20.0);
    return Container(
      margin: EdgeInsets.symmetric(vertical: scaledCreateSectionPadding),
      child: ScalableText.subTitleRevenues(
        context: context,
        title: title,
      ),
      // child: Text(
      //   title,
      //   style: TextStyles.titleMealDetail,
      // ),
    );
  }

  Widget _createSectionCardDetails(BuildContext context, Widget child) {
    final createSectionScaler = MediaQuery.textScalerOf(context);
    final scaledCreateSectionPadding = createSectionScaler.scale(16.0);

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: scaledCreateSectionPadding,
        horizontal: scaledCreateSectionPadding,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(15.0)),
      child: ShaderMask(
        shaderCallback: (Rect rect) {
          return const LinearGradient(
            colors: [
              Colors.purple,
              Colors.black12,
              Colors.transparent,
              Colors.black12,
              Colors.purple,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [
              0.0,
              0.015,
              0.0,
              0.89,
              1.0,
            ],
          ).createShader(rect);
        },
        blendMode: BlendMode.dstOut,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return LayoutBuilder(builder: (context, constraints) {
      final revenuesScaler = MediaQuery.textScalerOf(context);
      final scaledStatusBar =
          revenuesScaler.scale(CustomStatusBars.maxHeight).roundToDouble();
      // Defina o padding fora do card
      final scaledCardPadding =
          revenuesScaler.scale(constraints.maxWidth * 0.025).roundToDouble();
      // Defina o padding dos items dentro do card
      final scaledCardItemsPadding =
          revenuesScaler.scale(constraints.maxWidth * 0.075);
      // Defina o padding do card de ingredientes
      final scaledCardIngredientsPadding = revenuesScaler.scale(8.5);
      // Defina o tamanho do radius do CircleAvatar
      final scaledCardStepsCircleAvatar = revenuesScaler.scale(20);
      // Defina o tamanho e o padding do botão de favorito
      final scaledFloatingActionButtonSize = revenuesScaler.scale(70);
      final scaledFloatingActionButtonPadding = revenuesScaler.scale(12.0);

      return Scaffold(
        backgroundColor: AppColors.shape,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: CustomStatusBars(
          context: context,
          title: mealModel.title,
          actions: [
            CustomAction(
                icon: const Icon(Icons.filter_alt),
                onPressed: () => Navigator.of(context)
                    .pushReplacementNamed(AppRoutes.filters),
                tooltip: 'Filter'),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                padding: EdgeInsets.only(
                  top: scaledStatusBar,
                ),
                child: Opacity(
                  opacity: 0.65,
                  child: Image.network(
                    mealModel.imgUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(
                left: scaledCardPadding,
                top: scaledCardPadding +
                    CustomStatusBars.maxHeight +
                    MediaQuery.of(context).padding.top,
                right: scaledCardPadding,
                bottom:
                    scaledCardPadding + MediaQuery.of(context).padding.bottom,
              ),
              child: Card(
                color: AppColors.black26,
                shadowColor: AppColors.black26,
                surfaceTintColor: AppColors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 4,
                child: Container(
                  margin: EdgeInsets.only(
                    left: scaledCardItemsPadding,
                    right: scaledCardItemsPadding,
                    bottom: scaledCardItemsPadding,
                  ),
                  child: Column(
                    children: [
                      _createSectionTitle(context, 'Ingredientes'),
                      Flexible(
                        flex: 2,
                        child: _createSectionCardDetails(
                          context,
                          ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 0,
                              bottom: 80,
                            ),
                            itemCount: mealModel.ingredients.length,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            itemBuilder: (context, index) {
                              return Card(
                                color: AppColors.primary,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: scaledCardIngredientsPadding,
                                    horizontal:
                                        scaledCardIngredientsPadding * 1.5,
                                  ),
                                  child: Text(
                                    mealModel.ingredients[index],
                                    style: TextStyles.subTitleMealDetailBlack,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      _createSectionTitle(context, 'Passos'),
                      Flexible(
                        flex: 3,
                        child: _createSectionCardDetails(
                          context,
                          ListView.builder(
                            padding: const EdgeInsets.only(
                              top: 0,
                              bottom: 80,
                            ),
                            itemCount: mealModel.steps.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                // minLeadingWidth: 1.0,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 4,
                                ),
                                leading: CircleAvatar(
                                  radius: scaledCardStepsCircleAvatar,
                                  backgroundColor: AppColors.primary,
                                  child: ScalableText.subTitleRevenuesDetails(
                                    context: context,
                                    title: '${index + 1}',
                                    color: AppColors.secundary,
                                  ),
                                  // child: Text(
                                  //   '${index + 1}',
                                  //   style: const TextStyle(
                                  //     fontWeight: FontWeight.w600,
                                  //     color: AppColors.secundary,
                                  //   ),
                                  // ),
                                ),
                                title: ScalableText.subTitleRevenuesDetails(
                                  context: context,
                                  title: mealModel.steps[index],
                                  color: AppColors.background,
                                ),
                                // title: Text(
                                //   mealModel.steps[index],
                                //   style: TextStyles.subTitleMealDetail,
                                // ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: Container(
          margin: EdgeInsets.all(scaledFloatingActionButtonPadding),
          height: scaledFloatingActionButtonSize,
          width: scaledFloatingActionButtonSize,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.secundary,
              hoverColor: AppColors.secundary,
              splashColor: AppColors.shape,
              elevation: 4,
              // mini: false,
              onPressed: () {
                // Ativa a função onToggleFavorite e passa o mealModel
                onToggleFavorite(mealModel);
                // Retorna o mealModel para a tela anterior (MealItemsWidget)
                // Navigator.pop(context, mealModel);
              },
              child:
                  Icon(isFavorite(mealModel) ? Icons.star : Icons.star_border),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}

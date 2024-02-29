import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_colors.dart';
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
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        title,
        style: TextStyles.titleMealDetail,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(10)),
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
    // EdgeInsets myPadding = MediaQuery.of(context).padding;
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        backgroundColor: AppColors.shape,
        extendBodyBehindAppBar: true,
        extendBody: true,
        appBar: CustomStatusBars(
          toolbarHeight: constraints.maxWidth <= 440 ? 70 : 86,
          title: mealModel.title,
          // title: '${kToolbarHeight}',
          actions: [
            CustomAction(
              icon:
                  Icon(isFavorite(mealModel) ? Icons.star : Icons.star_border),
              onPressed: () =>
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home),
            ),
          ],
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                padding: EdgeInsets.only(
                  top: constraints.maxWidth <= 440 ? 70 : 86,
                ),
                child: Opacity(
                  opacity: 0.75,
                  child: Image.network(
                    mealModel.imgUrl,
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
              margin: EdgeInsets.only(
                top: constraints.maxWidth <= 440
                    ? kToolbarHeight + 70
                    : kToolbarHeight + 86,
                left: 10,
                right: 10,
                bottom: kBottomNavigationBarHeight,
              ),
              child: Card(
                color: Colors.black26,
                shadowColor: Colors.black26,
                surfaceTintColor: Colors.black26,
                // margin: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 4,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 35, right: 35, bottom: 35),
                  child: Column(
                    children: [
                      _createSectionTitle(context, 'Ingredientes'),
                      Flexible(
                        flex: 2,
                        child: _createSectionContainer(
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            itemCount: mealModel.ingredients.length,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            itemBuilder: (context, index) {
                              return Card(
                                color: AppColors.primary,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8,
                                    horizontal: 12,
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
                        child: _createSectionContainer(
                          ListView.builder(
                            padding: const EdgeInsets.only(top: 0),
                            itemCount: mealModel.steps.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                // minLeadingWidth: 1.0,
                                contentPadding: const EdgeInsets.symmetric(
                                  vertical: 2,
                                  horizontal: 2,
                                ),
                                leading: CircleAvatar(
                                  backgroundColor: AppColors.primary,
                                  child: Text(
                                    '${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.secundary,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  mealModel.steps[index],
                                  style: TextStyles.subTitleMealDetail,
                                ),
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
        floatingActionButton: Transform.scale(
          scale: 1.3,
          child: FloatingActionButton(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.secundary,
            hoverColor: AppColors.secundary,
            splashColor: AppColors.shape,
            elevation: 4,
            mini: false,
            onPressed: () {
              // Ativa a função onToggleFavorite e passa o mealModel
              onToggleFavorite(mealModel);
              // Retorna o mealModel para a tela anterior (MealItemsWidget)
              // Navigator.pop(context, mealModel);
            },
            child: Icon(isFavorite(mealModel) ? Icons.star : Icons.star_border),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    });
  }
}

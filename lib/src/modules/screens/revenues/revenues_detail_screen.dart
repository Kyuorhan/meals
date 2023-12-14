import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';

class RevenuesDetailScreen extends StatelessWidget {
  const RevenuesDetailScreen({
    super.key,
    required this.onToggleFavorite,
    required this.isFavorite,
  });

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
      padding: const EdgeInsets.all(20),
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
              0.025,
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
    EdgeInsets myPadding = MediaQuery.of(context).padding;
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      backgroundColor: AppColors.shape,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        iconTheme: const IconThemeData(
          color: AppColors.background,
          size: 26,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        leadingWidth: 72,
        toolbarHeight: 72,
        centerTitle: true,
        titleSpacing: 0.0,
        title: Text(
          mealModel.title,
          style: TextStyles.titleHome,
          maxLines: 2,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70),
            child: Image.network(
              mealModel.imgUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: myPadding.top + kToolbarHeight * 1.5,
              left: 10,
              right: 10,
              bottom: 10,
            ),
            child: Card(
              color: Colors.black26,
              shadowColor: Colors.black26,
              // margin: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              child: Container(
                margin: const EdgeInsets.only(left: 35, right: 35, bottom: 35),
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
                              color: AppColors.secundary,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 10,
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
                                      fontWeight: FontWeight.w600),
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
          backgroundColor: AppColors.secundary,
          foregroundColor: AppColors.black,
          elevation: 4,
          mini: false,
          child: Icon(isFavorite(mealModel) ? Icons.star : Icons.star_border),
          onPressed: () {
            onToggleFavorite(mealModel);
            // Navigator.of(context).pop(mealModel.title);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

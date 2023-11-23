import 'package:flutter/material.dart';

import '../../../shared/models/meal_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

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
      width: 300,
      height: 250,
      padding: const EdgeInsets.all(15),
      // margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          // color: Colors.white10,
          border: Border.all(color: Colors.white70),
          borderRadius: BorderRadius.circular(10)),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Size mySize = MediaQuery.of(context).size;
    final mealModel = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.background),
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(32),
          ),
        ),
        title: Text(
          maxLines: 2,
          mealModel.title,
          style: TextStyles.titleHome,
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
            padding: const EdgeInsets.only(
                top: 125, left: 10, right: 10, bottom: 10),
            child: Card(
              color: Colors.black26,
              shadowColor: Colors.black26,
              // margin: const EdgeInsets.all(15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              semanticContainer: true,
              elevation: 4,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _createSectionTitle(context, 'Ingredientes'),
                    _createSectionContainer(
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: mealModel.ingredients.length,
                        itemBuilder: (context, index) {
                          return Card(
                            color: AppColors.primary,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 5,
                                horizontal: 10,
                              ),
                              child: Text(
                                mealModel.ingredients[index],
                                style: TextStyles.subTitleMealDetail,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    _createSectionTitle(context, 'Passos'),
                    _createSectionContainer(
                      ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: mealModel.steps.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.primary,
                              child: Text('${index + 1}'),
                            ),
                            title: Text(
                              mealModel.steps[index],
                              style: TextStyles.subTitleMealDetail,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/app_routes.dart';
import '../models/category_model.dart';
import '../themes/app_scalable_text.dart';

class CategoryItemsWidget extends StatelessWidget {
  const CategoryItemsWidget({
    super.key,
    required this.categoryModel,
  });

  final CategoryModel categoryModel;

  void _selectRevenues(BuildContext context) {
    Navigator.of(context).pushNamed(
      AppRoutes.category,
      arguments: categoryModel,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectRevenues(context),
      borderRadius: BorderRadius.circular(15.0),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.5),
              categoryModel.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ScalableText.subTitleCategory(
          title: categoryModel.title,
          context: context,
        ),
      ),
    );
  }
}

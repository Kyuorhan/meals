import 'package:flutter/material.dart';
import 'package:meals/src/shared/themes/app_colors.dart';

import '../../utils/app_routes.dart';
import '../models/category_model.dart';
import '../themes/app_text_style.dart';

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
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectRevenues(context),
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              categoryModel.color.withOpacity(0.5),
              categoryModel.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Text(
          categoryModel.title,
          style: TextStyles.titleCategoryItens,
        ),
      ),
    );
  }
}

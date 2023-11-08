import 'package:flutter/material.dart';

import '../../../shared/models/category_model.dart';
import '../../../shared/themes/app_colors.dart';
import '../../../shared/themes/app_text_style.dart';

class RevenuesScreen extends StatelessWidget {
  const RevenuesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryModel =
        ModalRoute.of(context)?.settings.arguments as CategoryModel;
    return Scaffold(
      backgroundColor: AppColors.shape,
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
          categoryModel.title,
          style: TextStyles.titleHome,
        ),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${categoryModel.id}'),
      ),
    );
  }
}

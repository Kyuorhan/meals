import 'package:flutter/material.dart';

import '../../data/dummy_data.dart';
import '../../shared/widgets/category_items_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  // void onDrawer(BuildContext context) {
  //   Future.delayed(const Duration(seconds: 0), () {
  //     Scaffold.of(context).openDrawer();
  //   });
  // }P

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView(
        padding: EdgeInsets.only(
          bottom: constraints.maxHeight / 6.4,
          left: constraints.maxWidth * 0.052,
          right: constraints.maxWidth * 0.052,
          top: constraints.maxWidth * 0.052,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: constraints.maxWidth * 0.052,
          mainAxisSpacing: constraints.maxWidth * 0.052,
          mainAxisExtent: constraints.maxHeight / 6.4,
        ),
        children: dummyCategories.map((cat) {
          return CategoryItemsWidget(categoryModel: cat);
        }).toList(),
      );
    });
  }
}

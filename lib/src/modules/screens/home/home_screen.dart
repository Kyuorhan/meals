import 'package:flutter/material.dart';

import '../../../data/dummy_data.dart';
import '../../../shared/widgets/category_items_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;

    return GridView(
      padding: const EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: mySize.width / 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: dummyCategories.map((cat) {
        return CategoryItemsWidget(categoryModel: cat);
      }).toList(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mealappflutter/widgets/category_item.dart';
import '../models/dummy_data.dart';

class CategoryScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORY.map((catData) {
          return CategoryItem(
              catData.id,
              catData.title,
              catData.color
          );
        }).toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
        ),

    );
  }




}

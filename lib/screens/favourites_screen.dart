import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  List<Meal> _favouriteList;

  FavouritesScreen(this._favouriteList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  _favouriteList.length>0 ? ListView.builder(itemBuilder: (ctx, index){
        return MealItem(id: _favouriteList[index].id,title: _favouriteList[index].title,
          complexity: _favouriteList[index].complexity,affordability: _favouriteList[index].affordability,duration: _favouriteList[index].duration,
        imageUrl: _favouriteList[index].imageUrl,removeItem: null);
      }, itemCount: _favouriteList.length,) : Center(
        child: Text("FAVOURITE"),
      ),
    );
  }
}

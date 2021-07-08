import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeals extends StatefulWidget {

  static const routeName = '/category-meals';
  final List<Meal> _meals;


  CategoryMeals(this._meals);

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {

  String categoryId;
  String categoryTitle;
  List<Meal> mealList;
  var _initDataDone = false;

  @override
  void didChangeDependencies() {
    if(!_initDataDone){
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,String>;
      categoryTitle = routeArgs['title'];
      categoryId = routeArgs['id'];
      mealList = widget._meals.where((meal){
        return meal.categories.contains(categoryId);
      }).toList();
      _initDataDone = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId){
    setState(() {
      mealList.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle),),
      body: ListView.builder(itemBuilder: (ctx, index){
        return MealItem(id: mealList[index].id,title: mealList[index].title,imageUrl: mealList[index].imageUrl, duration: mealList[index].duration,
        affordability: mealList[index].affordability, complexity: mealList[index].complexity,removeItem: removeMeal,);
      },
      itemCount: mealList.length,),
    );
  }
}

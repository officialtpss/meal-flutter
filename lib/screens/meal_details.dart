import 'package:flutter/material.dart';
import '../models/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {

  static const String routeName = "/meal-details";
  final Function _toggleFavourite;


  MealDetailsScreen(this._toggleFavourite);

  @override
  Widget build(BuildContext context) {

    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.star),
        onPressed: (){
//          Navigator.of(context).pop(mealId);
          _toggleFavourite(mealId);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl,fit: BoxFit.cover,),
              ),
              getTitle(context,'Ingredients'),
              getContainer( ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index){
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Text(selectedMeal.ingredients[index],style: TextStyle(fontSize: 11),),
                  );
                },)
              ,100),
              getTitle(context,'Steps'),
              getContainer( ListView.builder(
                itemCount: selectedMeal.steps.length,
                itemBuilder: (ctx, index){
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(selectedMeal.steps[index],style: TextStyle(fontSize: 15)),
                        leading: Container(
                          child: CircleAvatar(child: Text('#${index + 1}',style: TextStyle(fontSize: 12),),),
                        ),
                      ),
                      Divider()
                    ],
                  );
                },)
              ,150),
            ],
          ),
        ),
      ),
    );
  }

  Widget getContainer(Widget child,double height){
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      height: height,
      width: double.infinity,
      child:  child
    );
  }

  Widget getTitle(BuildContext context, String title) {
    return Container(
            margin: EdgeInsets.only(top: 10),
            child: Text(title, style: Theme.of(context).textTheme.title,),
          );
  }
}

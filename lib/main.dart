import 'package:flutter/material.dart';
import 'models/dummy_data.dart';
import 'models/meal.dart';
import 'screens/settings_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/meal_details.dart';
import 'screens/category_meals_screen.dart';
import 'screens/category_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Map<String, bool> _filters = {
    'gluten': false,
    'vegetarian' : false,
    'vegan' : false,
    'lactose' : false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];

  void toggleFavourites(String mealId){
    var index =  _favouriteMeals.indexWhere((meal) => meal.id == mealId);
    if(index >=0){
      setState(() {
        _favouriteMeals.removeAt(index);
      });
    }else{
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  void updateFilters(Map<String, bool> updatedFilters){
    setState(() {
      this._filters = updatedFilters;
      _availableMeals = DUMMY_MEALS.where((meal){
          if(_filters['gluten'] && !meal.isGlutenFree)
            return false;
          if(_filters['vegetarian'] && !meal.isVegetarian)
            return false;
          if(_filters['vegan'] && !meal.isVegan)
            return false;
          if(_filters['lactose'] && !meal.isLactoseFree)
            return false;

          return true;
      }).toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Roboto',
        textTheme: ThemeData.light().textTheme.copyWith(
          body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          title: TextStyle(fontSize: 18,fontFamily: 'Roboto', fontWeight: FontWeight.bold)
        )
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals),
        CategoryMeals.routeName: (ctx) => CategoryMeals(_availableMeals),
        MealDetailsScreen.routeName : (ctx) => MealDetailsScreen(toggleFavourites),
        SettingsScreen.routeName : (ctx) => SettingsScreen(updateFilters,_filters),
      },
      onGenerateRoute: (settings){
        return MaterialPageRoute(builder: (ctx) => CategoryScreen());
      },
//      onUnknownRoute: (settings){
//
//      },
     );
  }
}


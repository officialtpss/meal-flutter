import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/favourites_screen.dart';
import '../screens/category_screen.dart';

class TabsScreenTop extends StatefulWidget {

  List<Meal> _favouriteMeals;

  TabsScreenTop(this._favouriteMeals);

  @override
  _TabsScreenTopState createState() => _TabsScreenTopState();
}

class _TabsScreenTopState extends State<TabsScreenTop> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Meals"),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.category),text: 'Categories',),
              Tab(icon: Icon(Icons.star),text: 'Favourites',)
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CategoryScreen(),
            FavouritesScreen(widget._favouriteMeals)
          ],
        ),
      ),
    );
  }
}

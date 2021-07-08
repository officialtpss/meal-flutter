import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/drawer_main.dart';
import '../screens/favourites_screen.dart';
import '../screens/category_screen.dart';

class TabsScreen extends StatefulWidget {

  List<Meal> _favouriteMeals;

  TabsScreen(this._favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  int _selectedPage = 0;
  List<Map<String, Object>> _pages ;

  @override
  void initState() {
    _pages = [
      {'page': CategoryScreen(),'title' : 'Categories'},
      {'page': FavouritesScreen(widget._favouriteMeals),'title' : 'Your Favourite'},
    ];
    super.initState();
  }

  void selectPage(int index){
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPage]['title']),
        ),
        drawer: DrawerMain(),
        body: _pages[_selectedPage]['page'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: selectPage,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          backgroundColor: Theme.of(context).primaryColor,
          currentIndex: _selectedPage,
          items: [
            BottomNavigationBarItem(
              title: Text('Categories'),
              icon: Icon(Icons.category)
            ),
            BottomNavigationBarItem(
                title: Text('Favourites'),
                icon: Icon(Icons.star)
            )
          ],
        ),
    );
  }
}

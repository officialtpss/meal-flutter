import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {

  final String _id;
  final String _title;
  final Color _color;

  CategoryItem(this._id,this._title, this._color);

  void selectCategory(BuildContext ctx){
//    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
//      return CategoryMeals(this._id, this._title);
//    }));
    Navigator.of(ctx).pushNamed(CategoryMeals.routeName,arguments: {
      'id':_id,
      'title':_title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        child: Text(_title, style: Theme.of(context).textTheme.title,),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [_color.withOpacity(.7), _color], begin: Alignment.topLeft , end: Alignment.bottomRight)
        ),
      ),
    );
  }}



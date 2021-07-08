import 'package:flutter/material.dart';
import 'package:mealappflutter/screens/settings_screen.dart';

class DrawerMain extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: 250,
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Theme.of(context).primaryColor,
              child: Text("Go Cooking", style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.white),),
            ),
            SizedBox(height: 10,),
            getListTile(Icons.restaurant,'Meals',() {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            getListTile(Icons.settings,'Settings',(){
              Navigator.of(context).pushReplacementNamed(SettingsScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }

  ListTile getListTile(IconData icon, String text, Function tapHandler) {
    return ListTile(
            onTap: tapHandler,
            leading: Icon(icon,size: 20,),
            title: Text(text,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'Releway'),),
          );
  }
}

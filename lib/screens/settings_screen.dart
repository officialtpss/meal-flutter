import 'package:flutter/material.dart';
import '../screens/drawer_main.dart';

class SettingsScreen extends StatefulWidget {

  static const String routeName = '/settings-screen';
  final Function updateFilters;
  Map<String, bool> _filters;

  SettingsScreen(this.updateFilters,this._filters);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var _isGlutenFree = false;
  var _isVegetarian = false;
  var _isVegan = false;
  var _isLactoseFree = false;

  @override
  void initState() {
    _isGlutenFree = widget._filters['gluten'];
    _isVegetarian = widget._filters['vegetarian'];
    _isVegan = widget._filters['vegan'];
    _isLactoseFree = widget._filters['lactose'];
    super.initState();
  }

  Widget getSwitchItem(String title, String subTitle, bool switchValue,Function function){
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: switchValue,
      onChanged: (val){
        function(val);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: (){
              widget.updateFilters({
                'gluten': _isGlutenFree,
                'vegetarian' : _isVegetarian,
                'vegan' : _isVegan,
                'lactose' : _isLactoseFree
              });
            },
            icon: Icon(Icons.save),
          )
        ],
        title: Text('Settings'),
      ),
      drawer: DrawerMain(),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("Your Filters", style: Theme.of(context).textTheme.title,),
            Expanded(
              child: ListView(
                children: <Widget>[
                  getSwitchItem("Gluten Free", "Only Includes gluten free meals",_isGlutenFree, (val){
                    setState(() {
                      _isGlutenFree = val;
                    });
                  }),
                  getSwitchItem("Vegetarian", "Only Includes vegetarian meals",_isVegetarian, (val){
                    setState(() {
                      _isVegetarian = val;
                    });
                  }),
                  getSwitchItem("Vegan", "Only Includes vegen meals",_isVegan, (val){
                    setState(() {
                      _isVegan = val;
                    });
                  }),
                  getSwitchItem("Lactose Free", "Only Includes Lactose free meals",_isLactoseFree, (val){
                    setState(() {
                      _isLactoseFree = val;
                    });
                  }),

                ],
              ),
            )
          ],
        )
      ),
    );
  }
}

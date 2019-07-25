import 'package:flutter/material.dart';
import 'package:meals_catalogue/components/GridList.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/foodModel.dart';

class ListFood extends StatefulWidget {
  final String title;

  const ListFood({Key key, this.title = "Meals Catalogue"}) : super(key: key);
  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  List<FoodModel> _listFood = [];
  String _foodCategory = "breakfast";
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getFood().then((v) {
      setState(() {
        _listFood = v;
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: GridList(_listFood, _foodCategory),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("Breakfast")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("Desert"),
          )
        ],
        onTap: (i) {
          setState(() {
            if (i == 0) {
              _selectedTab = 0;
              _foodCategory = "breakfast";
            } else {
              _selectedTab = 1;
              _foodCategory = "desert";
            }
          });
        },
        currentIndex: _selectedTab,
      ),
    );
  }
}
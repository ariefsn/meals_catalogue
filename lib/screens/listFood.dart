import 'dart:async';

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
  String _foodCategory = "Dessert";
  int _selectedTab = 0;
  bool _showLoading = true;

  @override
  void initState() {
    _getListFoods();
    super.initState();
  }

  void _getListFoods() {
    try {
      getFoodFromApiByCategory(_foodCategory).then((v) {
        setState(() {
          _listFood = v;
          _showLoading = false;
        });
      });
    } on TimeoutException {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Unable to load data. Timeout."),
        action: SnackBarAction(
          label: "Refresh",
          onPressed: () {
            _getListFoods();
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: _showLoading ? Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3,)),
            CircularProgressIndicator(),
            Padding(padding: EdgeInsets.all(5.0)),
            Text("Please Wait ...")
          ],
        ),
      ) : GridList(_listFood, _foodCategory),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("Dessert")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("Seafood"),
          )
        ],
        onTap: (i) {
          if (_selectedTab != i) {
            setState(() {
              _showLoading = true;
              if (i == 0) {
                _selectedTab = 0;
                _foodCategory = "Dessert";
              } else {
                _selectedTab = 1;
                _foodCategory = "Seafood";
              }
              _getListFoods();
            });
          }
        },
        currentIndex: _selectedTab,
      ),
    );
  }
}
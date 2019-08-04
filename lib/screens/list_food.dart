import 'dart:async';

import 'package:flutter/material.dart';
import 'package:meals_catalogue/components/grid_list.dart';
import 'package:meals_catalogue/config/config.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/food_model.dart';
import 'package:meals_catalogue/screens/favorite_screen.dart';

class ListFood extends StatefulWidget {
  final String title;
  final ConfigFlavor configFlavor;

  const ListFood({Key key, this.title = "Meals Catalogue", this.configFlavor}) : super(key: key);
  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  List<FoodModel> _listFood = [];
  List<FoodModel> _listFoodSearch = [];
  String _foodCategory = "Dessert";
  int _selectedTab = 0;
  bool _showLoading = true;
  bool _showSearchBar = false;
  TextEditingController _controllerSearch = TextEditingController();

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
    print(_selectedTab);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: !_showSearchBar ? Text(widget.title + " (${widget.configFlavor.abbreviation})") : TextField(
          key: Key("searchBar"),
          controller: _controllerSearch,
          decoration: InputDecoration(
            hintText: "Type name here",
            hintStyle: TextStyle(color: Colors.white)
          ),
          onChanged: (v) {
            setState(() {
              if (v.isNotEmpty) {
                _listFoodSearch = _listFood.where((e) => e.strMeal.toLowerCase().contains(_controllerSearch.text.toLowerCase())).toList();
              } else {
                _listFoodSearch = _listFood;
              }
            });
          },
        ),
        leading: !_showSearchBar ? Icon(widget.configFlavor.icon) : Icon(Icons.search),
        actions: <Widget>[
          !_showSearchBar && _selectedTab != 2 ? IconButton(icon: Icon(Icons.search), onPressed: () {
            setState(() {
              _showSearchBar = true;
            });
          }, key: Key("searchBarOpen"),) : _showSearchBar && _selectedTab != 2 ? IconButton(icon: Icon(Icons.clear), onPressed: () {
            setState(() {
              _showSearchBar = false;
              _controllerSearch.text = "";
            });
          }, key: Key("searchBarClose"),) : Container()
        ],
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
      ) : (_selectedTab == 2 ? Favorite() : GridList(_controllerSearch.text.isNotEmpty ? _listFoodSearch : _listFood, _foodCategory)),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            title: Text("Dessert", key: Key("navDessert"),)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text("Seafood", key: Key("navSeafood"),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite", key: Key("navFavorite"),),
          )
        ],
        onTap: (i) {
          if (_selectedTab != i) {
            setState(() {
              _controllerSearch.clear();
              if (i == 0) {
                _showLoading = true;
                _selectedTab = i;
                _foodCategory = "Dessert";
                _getListFoods();
              } else if (i == 1) {
                _showLoading = true;
                _selectedTab = i;
                _foodCategory = "Seafood";
                _getListFoods();
              } else {
                _selectedTab = i;
              }
            });
          }
        },
        currentIndex: _selectedTab,
      ),
    );
  }
}
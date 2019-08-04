import 'dart:async';
import 'package:flutter/material.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/food_model.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final FoodModel item;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function() callback;

  const DetailScreen({Key key, this.title = "Food's Ingredients", this.item, this.scaffoldKey, this.callback, }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  TabController _tabController;
  ScaffoldState _scaffoldState;
  bool _showLoading = true;
  FoodModel _foodModel;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    try {
      getFoodDetailById(widget.item.idMeal).then((v) {
        setState(() {
          _foodModel = FoodModel.fromJson(v.toJson());
          WidgetsBinding.instance
            .addPostFrameCallback((_) => _scaffoldState.showSnackBar(
              SnackBar(
                content: Text("You choose ${v.strMeal}", key: Key("snackbar-detail-name"),),
                action: SnackBarAction(
                  label: "Go Back",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ));
          _showLoading = false;
        });
      });
    } on TimeoutException {
      WidgetsBinding.instance
        .addPostFrameCallback((_) => _scaffoldState.showSnackBar(
          SnackBar(
            content: Text("Unable to load data. Timeout."),
            action: SnackBarAction(
              label: "Go Back",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.strMeal == "" ? widget.title : widget.item.strMeal),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Builder(
        builder: (BuildContext buildContext) {
          _scaffoldState = Scaffold.of(buildContext);

          return _showLoading ? Center(
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3,)),
                CircularProgressIndicator(),
                Padding(padding: EdgeInsets.all(5.0)),
                Text("Please Wait ...")
              ],
            ),
          ) : SafeArea(
            child: Column(
              children: <Widget>[
                Hero(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Image.network(_foodModel.strMealThumb, height: MediaQuery.of(context).size.height * 0.4, fit: BoxFit.fill,),
                      )
                    ],
                  ),
                  tag: _foodModel.idMeal,
                  createRectTween: (begin, end) {
                    Rect newE = Rect.fromLTRB(end.left, end.top, end.right + 1000, end.bottom);

                    return MaterialRectCenterArcTween(begin: begin, end: newE);
                  },
                ),
                TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Ingredients"),
                    ),
                    Tab(
                      child: Text("Instructions"),
                    )
                  ],
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.blue,
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: <Widget>[
                      ListView(
                        children: _foodModel.combine.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                            leading: Icon(Icons.check),
                          );
                        }).toList(),
                      ),
                      ListView(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(_foodModel.strInstructions != null ? _foodModel.strInstructions : "-", style: TextStyle(
                              height: 1.2
                            ),),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
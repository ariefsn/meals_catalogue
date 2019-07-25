import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModel.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final FoodModel item;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final void Function() callback;

  const DetailScreen({Key key, this.title = "Detail Bahan Food", this.item, this.scaffoldKey, this.callback, }) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  TabController _tabController;
  ScaffoldState _scaffoldState;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _scaffoldState.showSnackBar(
          SnackBar(
            content: Text("You choose ${widget.item.name}"),
            action: SnackBarAction(
              label: "Go Back",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.name == "" ? widget.title : widget.item.name),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Builder(
        builder: (BuildContext buildContext) {
          _scaffoldState = Scaffold.of(buildContext);

          return SafeArea(
            child: Column(
              children: <Widget>[
                Hero(
                  child: Image.network(widget.item.image),
                  tag: widget.item.id,
                  createRectTween: (begin, end) {
                    Rect newE = Rect.fromLTRB(end.left, end.top, end.right + 1000, end.bottom);

                    return MaterialRectCenterArcTween(begin: begin, end: newE);
                  },
                ),
                TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text("Ingredient"),
                    ),
                    Tab(
                      child: Text(widget.item.category == "breakfast" ? "Seasoning" : "How To"),
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
                        children: widget.item.ingredient.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                            leading: Icon(Icons.check),
                          );
                        }).toList(),
                      ),
                      widget.item.category == "breakfast" ? ListView(
                        children: widget.item.seasoning.map((s) {
                          return ListTile(
                            dense: true,
                            title: Text(s),
                            leading: Icon(Icons.check),
                          );
                        }).toList(),
                      ) : Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(widget.item.howto, style: TextStyle(
                                height: 1.2
                              ),),
                            ),
                          )
                        ]
                      ),
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
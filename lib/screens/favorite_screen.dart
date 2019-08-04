import 'package:flutter/material.dart';
import 'package:meals_catalogue/providers/favorite_provider.dart';
import 'package:meals_catalogue/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> with SingleTickerProviderStateMixin {
  TabController _tabController;

  Widget _generateList(BuildContext context, String category) {
    final fp = Provider.of<FavoriteProvider>(context);

    final data = fp.favoriteFoodsByCategory(category);

    return data.length == 0 ? Container(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.not_interested, color: Colors.black, size: 50.0,),
            Padding(padding: EdgeInsets.all(3.0),),
            Text("Empty List")
          ],
        ),
      ),
    ): ListView.builder(
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (context, i) => ListTile(
        leading: GestureDetector(
          child: Container(
            padding: EdgeInsets.all(2.0),
            child: ClipRRect(
              child: Image.network(data[i].strMealThumb),
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailScreen(
                item: data[i],
              )
            ));
          },
        ),
        title: Text(data[i].strMeal),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Remove Favorite"),
                content: Text("Remove ${data[i].strMeal} from favorites?"),
                actions: <Widget>[
                  RaisedButton(
                    child: Text("Yes", style: TextStyle(color: Colors.white),),
                    color: Colors.red,
                    onPressed: () {
                      fp.removeFavourite(data[i]);
                      Navigator.pop(context);
                    },
                  ),
                  RaisedButton(
                    child: Text("No", style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              )
            );
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  
    return ListView(
      children: <Widget>[
        TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text("Dessert", style: TextStyle(color: _tabController.index == 0 ? Colors.blue : Colors.grey),),
            ),
            Tab(
              child: Text("Seafood", style: TextStyle(color: _tabController.index == 1 ? Colors.blue : Colors.grey),),
            )
          ],
          onTap: (i) {
            setState(() {
              _tabController.index = i;
            });
          },
        ),
        _tabController.index == 0 ? _generateList(context, "Dessert") : _generateList(context, "Seafood")
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/food_model.dart';
import 'package:meals_catalogue/providers/favorite_provider.dart';
import 'package:meals_catalogue/screens/detail_screen.dart';
import 'package:provider/provider.dart';

class GridList extends StatefulWidget {
  final List<FoodModel> listFood;
  final String category;

  GridList(this.listFood, this.category);

  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  List<Widget> _generateChild(BuildContext context, String category) {
    final fp = Provider.of<FavoriteProvider>(context);

    List<Widget> list = List();

    for (var m in widget.listFood) {
      list.add(Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return DetailScreen(
                  item: m,
                );
              },
            ));
          },
          child: Stack(
            children: <Widget>[
              GridTile(
                key: Key("tile-${m.idMeal}"),
                child: ClipRRect(
                  child: Hero(
                    child: Image.network(m.strMealThumb, fit: BoxFit.fill,),
                    tag: m.idMeal,
                    createRectTween: (begin, end) {
                      Rect newE = Rect.fromLTRB(end.left + 1000, end.top, end.right, end.bottom);

                      return MaterialRectCenterArcTween(begin: begin, end: newE);
                    },
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                footer: Container(
                  height: 35.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.0),
                      child: Text(
                        m.strMeal,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        key: Key("tile-name-${m.idMeal}"),
                      ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white54
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white60
                  ),
                  child: IconButton(
                    color: fp.isFavorite(m) ? Colors.red : Colors.black,
                    iconSize: 30.0,
                    icon: Icon(fp.isFavorite(m) ? Icons.favorite : Icons.favorite_border),
                    onPressed: () {
                      if (fp.isFavorite(m)) {
                        fp.removeFavourite(m);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Remove ${m.strMeal} from favorites."),
                            duration: Duration(milliseconds: 800),
                          )
                        );
                      } else {
                        fp.addFavourite(m);
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Add ${m.strMeal} to favorites."),
                            duration: Duration(milliseconds: 800),
                          )
                        );
                      }
                    },
                  ),
                ),
                right: 0.0,
              ),
            ],
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      key: Key("grid-view"),
      crossAxisCount: 2,
      children: _generateChild(context, widget.category),
    );
  }
}
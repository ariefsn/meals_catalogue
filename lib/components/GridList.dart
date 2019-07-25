import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModel.dart';
import 'package:meals_catalogue/screens/detailScreen.dart';

class GridList extends StatelessWidget {
  final List<FoodModel> listFood;
  final String category;

  GridList(this.listFood, this.category);

  List<Widget> _generateChild(BuildContext context, String category) {
    List<Widget> list = new List();

    List<FoodModel> listFoodByCat = listFood.where((e) {
      return e.category == category;
    }).toList();

    for (var m in listFoodByCat) {
      list.add(Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailScreen(
                item: m,
              ),
            ));
          },
          child: GridTile(
            child: ClipRRect(
              child: Hero(
                child: Image.network(m.image, fit: BoxFit.fill,),
                tag: m.id,
                createRectTween: (begin, end) {
                  Rect newE = Rect.fromLTRB(end.left + 1000, end.top, end.right, end.bottom);

                  return MaterialRectCenterArcTween(begin: begin, end: newE);
                },
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            footer: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                  child: Text(m.name,style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),),
              ),
              decoration: BoxDecoration(
                color: Colors.white54
              ),
            ),
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: _generateChild(context, category),
    );
  }
}
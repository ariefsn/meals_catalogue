import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/foodModel.dart';
import 'package:meals_catalogue/screens/detailScreen.dart';

class GridList extends StatelessWidget {
  final List<FoodModel> listFood;
  final String category;

  GridList(this.listFood, this.category);

  List<Widget> _generateChild(BuildContext context, String category) {
    List<Widget> list = List();

    for (var m in listFood) {
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
          child: GridTile(
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
                  child: Text(m.strMeal,style: TextStyle(
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
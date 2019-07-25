import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/makananModel.dart';
import 'package:meals_catalogue/screens/detailScreen.dart';

class GridList extends StatelessWidget {
  final List<MakananModel> listMakanan;

  GridList(this.listMakanan);

  List<Widget> _generateChild(BuildContext context) {
    List<Widget> list = new List();
    for (var m in listMakanan) {
      list.add(Padding(
        padding: EdgeInsets.all(5.0),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => DetailScreen(item: m,)
            ));
          },
          child: GridTile(
            child: ClipRRect(
              child: Image.network(m.gambar, fit: BoxFit.fill,),
              borderRadius: BorderRadius.circular(5.0),
            ),
            footer: Container(
              child: Padding(
                padding: EdgeInsets.only(left: 5.0),
                  child: Text(m.nama,style: TextStyle(
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
      children: _generateChild(context),
    );
  }
}
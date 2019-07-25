import 'package:flutter/material.dart';
import 'package:meals_catalogue/components/GridList.dart';
import 'package:meals_catalogue/core/functions.dart';
import 'package:meals_catalogue/models/makananModel.dart';

class ListMakanan extends StatefulWidget {
  final String title;

  const ListMakanan({Key key, this.title = "Meals Catalogue"}) : super(key: key);
  @override
  _ListMakananState createState() => _ListMakananState();
}

class _ListMakananState extends State<ListMakanan> {
  List<MakananModel> _listMakanan = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    getMakanan().then((v) {
      setState(() {
        _listMakanan = v;
      });
    });
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: GridList(_listMakanan),
    );
  }
}
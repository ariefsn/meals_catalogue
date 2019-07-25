import 'package:flutter/material.dart';
import 'package:meals_catalogue/models/makananModel.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  final MakananModel item;

  const DetailScreen({Key key, this.title = "Detail Bahan Makanan", this.item}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.item.nama == "" ? widget.title : widget.item.nama),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Image.network(widget.item.gambar),
            TabBar(
              controller: _tabController,
              tabs: <Widget>[
                Tab(
                  child: Text("Bahan"),
                ),
                Tab(
                  child: Text("Bumbu"),
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
                    children: widget.item.bahan.map((s) {
                      return ListTile(
                        dense: true,
                        title: Text(s),
                        leading: Icon(Icons.check),
                      );
                    }).toList(),
                  ),
                  ListView(
                    children: widget.item.bumbu.map((s) {
                      return ListTile(
                        dense: true,
                        title: Text(s),
                        leading: Icon(Icons.check),
                      );
                    }).toList(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
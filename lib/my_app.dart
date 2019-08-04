import 'package:flutter/material.dart';
import 'package:meals_catalogue/config/config.dart';
import 'package:meals_catalogue/providers/favorite_provider.dart';
import 'package:meals_catalogue/screens/list_food.dart';
import 'package:provider/provider.dart';

// void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ConfigFlavor configFlavor;

  const MyApp({Key key, this.configFlavor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<FavoriteProvider>(
          builder: (context) => FavoriteProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Meals Catalogue',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ListFood(configFlavor: configFlavor,)
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meals_catalogue/config/config.dart';
import 'package:meals_catalogue/my_app.dart';

void main() {
  Config.appFlavor = Flavor.PRO;
  return runApp(MyApp(configFlavor: Config.appConfig,));
}
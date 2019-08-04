import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum Flavor { DEV, PRO }

class Config {
  static Flavor appFlavor;

  static ConfigFlavor get appConfig {
    switch (appFlavor) {
      case Flavor.DEV:
        return ConfigFlavor("Development", "Dev", Icons.developer_mode);
        break;
      case Flavor.PRO:
        return ConfigFlavor("Production", "Pro", Icons.new_releases);
        break;
      default:
        return ConfigFlavor("Main", "Main", Icons.android);

    }
  }
}

class ConfigFlavor {
  final String status;
  final String abbreviation;
  final IconData icon;

  ConfigFlavor(this.status, this.abbreviation, this.icon);
}
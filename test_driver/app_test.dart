import 'package:flutter_driver/flutter_driver.dart' as fd;
import 'package:test/test.dart';

void main() {
  group("Meals Catalogue", () {
    final bottomNavDessert = fd.find.byValueKey("navDessert");
    final bottomNavSeafood = fd.find.byValueKey("navSeafood");
    final searchBar = fd.find.byValueKey("searchBar");
    final searchBarOpen = fd.find.byValueKey("searchBarOpen");

    fd.FlutterDriver driver;

    setUpAll(() async {
      driver = await fd.FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test("Seafood and find Honey Teriyaki Salmon", () async {
      String id = "52773";

      await driver.tap(bottomNavSeafood);

      await driver.waitFor(fd.find.byValueKey("grid-view"), timeout: Duration(seconds: 30));

      await driver.scroll(fd.find.byValueKey("grid-view"), 0, -200, Duration(seconds: 3));

      await driver.waitFor(fd.find.byValueKey("tile-$id"), timeout: Duration(seconds: 30));

      await driver.waitFor(fd.find.byValueKey("tile-name-$id"), timeout: Duration(seconds: 30));

      expect(await driver.getText(fd.find.byValueKey("tile-name-$id")), "Honey Teriyaki Salmon");
    });

    test("Search by 'Choc Chip Pecan Pie'", () async {
      await driver.tap(bottomNavDessert);

      await driver.tap(searchBarOpen);

      await driver.tap(searchBar);

      await driver.enterText("pie");

      await driver.waitFor(searchBar);

      await driver.waitFor(fd.find.byValueKey("tile-52856"), timeout: Duration(seconds: 30));

      await driver.tap(fd.find.byValueKey("tile-52856"));

      expect(await driver.getText(fd.find.byValueKey("snackbar-detail-name")), "You choose Choc Chip Pecan Pie");
    });
    
  });
}
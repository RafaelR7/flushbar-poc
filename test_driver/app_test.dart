import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flushbar POC | ', () {
    final flushbarButton = find.byValueKey("flushbar_buttom");
    final flushbarMessageText = find.byValueKey("flushbar_text");
    final snackbarButton = find.byValueKey("snackbar_buttom");
    final snackbarText = find.byValueKey("snackbar_text");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('should show flushbar', () async {
      await driver.tap(flushbarButton);
      expect(await driver.getText(flushbarMessageText),
          'Lorem ipsum dolor sit amet');
    });

    test('should show snackbar', () async {
      await driver.tap(snackbarButton);
      sleep(Duration(seconds: 1));
      expect(await driver.getText(snackbarText), 'Default snackbar');
    });
  });
}

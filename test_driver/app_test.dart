import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Flushbar POC | ', () {
    final buttonFinder = find.byValueKey("flushbar_buttom");
    final buttomText = find.byValueKey("buttom_text");
    final messageText = find.byValueKey("messsage_text'");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('should show snackbar', () async {
      await driver.tap(buttonFinder);
      expect(await driver.getText(messageText), 'Lorem ipsum dolor sit amet');
      expect(await driver.getText(buttomText), 'Flushbar');
    });
  });
}

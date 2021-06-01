import 'package:currency_converter/app/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromTextField = TextEditingController();
  final TextEditingController toTextField = TextEditingController();
  final homeController =
      HomeController(fromTextField: fromTextField, toTextField: toTextField);

  test(
    'verificar diferenças entre ponto e virgula',
    () {
      fromTextField.text = "2,0";
      homeController.convert();
      expect(toTextField.text, '0.60');
    },
  );

  test(
    'deve converter de real para dolar',
    () {
      fromTextField.text = "2.0";
      homeController.convert();
      expect(toTextField.text, '0.60');
    },
  );
  test(
    'deve converter de dolar para real',
    () {
      fromTextField.text = "1.0";
      homeController.fromCurrency = homeController.currencies[1];
      homeController.toCurrency = homeController.currencies[0];
      homeController.convert();
      expect(toTextField.text, '5.30');
    },
  );
}

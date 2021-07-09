import 'package:currency_converter/app/controllers/home_api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  final TextEditingController fromTextField = TextEditingController();
  final TextEditingController toTextField = TextEditingController();
  final homeApiController =
      HomeApiController(fromTextField: fromTextField, toTextField: toTextField);

  test(
    'deve converter euro para dolar',
    () async {
      await homeApiController.start();
      /*for (var item in homeApiController.currencies) {
        print(item.name);
      }*/
      homeApiController.fromCurrency = homeApiController.currencies[2];
      homeApiController.toCurrency = homeApiController.currencies[1];
      homeApiController.convert();
      print(homeApiController.toTextField.text);
      expect(homeApiController.toTextField.text, '1.18');
    },
  );

  test(
    'deve converter de real para dolar',
    () async {
      await homeApiController.start();
      /*for (var item in homeApiController.currencies) {
        print(item.name);
      }*/
      homeApiController.fromCurrency = homeApiController.currencies[0];
      homeApiController.toCurrency = homeApiController.currencies[1];
      homeApiController.convert();
      print(homeApiController.toTextField.text);
      expect(homeApiController.toTextField.text, '0.19');
    },
  );
  test(
    'deve converter de dolar para real',
    () async {
      await homeApiController.start();
      /*for (var item in homeApiController.currencies) {
        print(item.name);
      }*/
      homeApiController.fromCurrency = homeApiController.currencies[1];
      homeApiController.toCurrency = homeApiController.currencies[0];
      homeApiController.convert();
      print(homeApiController.toTextField.text);
      expect(homeApiController.toTextField.text, '5.25');
    },
  );
}

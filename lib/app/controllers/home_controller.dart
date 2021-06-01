import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  late List<CurrencyModel> currencies;
  late CurrencyModel fromCurrency;
  late CurrencyModel toCurrency;
  final TextEditingController fromTextField;
  final TextEditingController toTextField;

  HomeController({required this.fromTextField, required this.toTextField}) {
    currencies = CurrencyModel.getCurrencies();
    fromCurrency = currencies[0];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromTextField.text;
    double fromValue = double.tryParse(text.replaceFirst(",", ".")) ?? 1.0;
    double toValue = 0;

    switch (toCurrency.name) {
      case "brl":
        toValue = fromValue * fromCurrency.brl;
        break;
      case "usd":
        toValue = fromValue * fromCurrency.usd;
        break;
      case "eur":
        toValue = fromValue * fromCurrency.eur;
        break;
      case "btc":
        toValue = fromValue * fromCurrency.btc;
        break;
      case "eth":
        toValue = fromValue * fromCurrency.eth;
        break;
      case "doge":
        toValue = fromValue * fromCurrency.doge;
        break;
    }
    toTextField.text = toValue.toStringAsFixed(2);
  }
}

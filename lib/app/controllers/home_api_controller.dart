import 'package:currency_converter/app/models/hg_api_model.dart';
import 'package:currency_converter/app/repositories/hg_api_repository.dart';
import 'package:flutter/material.dart';

class HomeApiController {
  List<Currency> currencies = [];
  Currency? toCurrency;
  Currency? fromCurrency;
  final TextEditingController fromTextField;
  final TextEditingController toTextField;
  final _apiRepo = HgApiRepository();

  HomeApiController({required this.fromTextField, required this.toTextField});

  Future start() async {
    currencies = await _apiRepo.fetchCurrencyList();
    fromCurrency = currencies[2];
    toCurrency = currencies[1];
  }

  void convert() {
    String text = fromTextField.text;
    double fromValue = double.tryParse(text.replaceFirst(",", ".")) ?? 1.0;
    double toValue = 0;

    switch (toCurrency!.name) {
      case "Real":
        toValue = fromValue * (fromCurrency!.buy / toCurrency!.buy);
        break;
      case "Dollar":
        toValue = fromValue * (fromCurrency!.buy / toCurrency!.buy);
        break;
      case "Euro":
        toValue = fromValue * (fromCurrency!.buy / toCurrency!.buy);
        break;
      case "Bitcoin":
        toValue = fromValue * (fromCurrency!.buy / toCurrency!.buy);
        break;
    }
    toTextField.text = toValue.toStringAsFixed(2);
  }
}

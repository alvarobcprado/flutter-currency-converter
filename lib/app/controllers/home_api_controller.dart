import 'package:currency_converter/app/models/hg_api_model.dart';
import 'package:currency_converter/app/repositories/hg_api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class HomeApiController {
  List<Currency> currencies = [];
  Currency? toCurrency;
  Currency? fromCurrency;
  final TextEditingController fromTextField;
  final TextEditingController toTextField;
  final _apiRepo = HgApiRepository();
  ValueNotifier<CurrencyState> controllerState =
      ValueNotifier<CurrencyState>(CurrencyState.starting);

  HomeApiController({required this.fromTextField, required this.toTextField});

  Future start() async {
    controllerState.value = CurrencyState.loading;
    try {
      this.currencies = await _apiRepo.fetchCurrencyList();
      this.fromCurrency = this.currencies[1];
      this.toCurrency = this.currencies[0];
      controllerState.value = CurrencyState.success;
    } catch (e) {
      controllerState.value = CurrencyState.error;
      throw Exception("Deu muito errado hein");
    }
  }

  void convert() {
    String text = fromTextField.text.replaceFirst("\$ ", "");
    double fromValue = double.tryParse(text) ?? 1.0;
    double toValue = 0;
    toValue = fromValue * (fromCurrency!.buy / toCurrency!.buy);
    toTextField.text = toCurrencyString(
      toValue.toStringAsFixed(2),
      leadingSymbol: '\$',
      useSymbolPadding: true,
      thousandSeparator: ThousandSeparator.None,
    );
  }
}

enum CurrencyState {
  starting,
  loading,
  success,
  error,
}

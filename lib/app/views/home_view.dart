import 'dart:ffi';

import 'package:currency_converter/app/components/currencyConverterRow.dart';
import 'package:currency_converter/app/controllers/home_api_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController fromText = TextEditingController();
  final TextEditingController toText = TextEditingController();

  //late HomeController homeCtrl;
  late HomeApiController homeCtrl;

  @override
  void initState() {
    homeCtrl = HomeApiController(fromTextField: fromText, toTextField: toText);
    super.initState();
    homeCtrl.start();
  }

  Widget _buildBtnWidget(String name) {
    return TextButton(
      onPressed: () {
        homeCtrl.convert();
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.all(10),
      ),
      child: Text(name),
    );
  }

  Widget buildSucess() {
    return Column(
      children: [
        CurrencyConverterRow(
          readOnly: false,
          label: "Converter",
          options: homeCtrl.currencies,
          selectedItem: homeCtrl.fromCurrency,
          controller: homeCtrl.fromTextField,
          onChanged: (model) {
            setState(() {
              homeCtrl.fromCurrency = model!;
            });
          },
        ),
        CurrencyConverterRow(
          readOnly: true,
          label: "Resultado",
          options: homeCtrl.currencies,
          selectedItem: homeCtrl.toCurrency,
          controller: homeCtrl.toTextField,
          onChanged: (model) {
            setState(() {
              homeCtrl.toCurrency = model!;
            });
          },
        ),
        SizedBox(height: 50),
        _buildBtnWidget("Converter"),
      ],
    );
  }

  Widget buildError() {
    return Container(
      child: Center(
        child: Text("Algo deu errado x.x"),
      ),
    );
  }

  Widget manageState(CurrencyState state) {
    switch (state) {
      case CurrencyState.starting:
        return Container();
      case CurrencyState.loading:
        return Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      case CurrencyState.success:
        return buildSucess();
      case CurrencyState.error:
        return buildError();
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 80),
            child: Image.asset(
              "assets/money.png",
              height: 200,
            ),
          ),
          ValueListenableBuilder(
            valueListenable: homeCtrl.controllerState,
            builder: (context, CurrencyState value, child) =>
                manageState(value),
          ),
        ],
      ),
    );
  }
}

import 'package:currency_converter/app/components/buttonWidget.dart';
import 'package:currency_converter/app/components/currencyConverterRow.dart';
import 'package:currency_converter/app/components/loadingContainer.dart';
import 'package:currency_converter/app/components/placeHolderRow.dart';
import 'package:currency_converter/app/controllers/home_api_controller.dart';
import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({
    Key? key,
  }) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final MoneyMaskedTextController fromText =
      MoneyMaskedTextController(initialValue: 0.00, leftSymbol: "\$ ");
  final MoneyMaskedTextController toText =
      MoneyMaskedTextController(initialValue: 0.00, leftSymbol: "\$ ");

  //late HomeController homeCtrl;
  late HomeApiController homeCtrl;

  @override
  void initState() {
    homeCtrl = HomeApiController(fromTextField: fromText, toTextField: toText);
    super.initState();
    homeCtrl.start();
  }

  Widget _buildLoading() {
    return Column(
      children: [
        SizedBox(height: 25),
        PlaceHolderRow(),
        SizedBox(height: 30),
        PlaceHolderRow(),
        SizedBox(height: 55),
        Container(
          width: 100,
          child: LoadingContainer(),
        ),
      ],
    );
  }

  Widget _buildSuccess() {
    return Column(
      children: [
        CurrencyConverterRow(
          readOnly: false,
          label: "Value to convert",
          options: homeCtrl.currencies,
          selectedItem: homeCtrl.fromCurrency,
          controller: homeCtrl.fromTextField,
          onChanged: (model) {
            setState(() {
              homeCtrl.fromCurrency = model!;
              homeCtrl.convert();
            });
          },
        ),
        CurrencyConverterRow(
          readOnly: true,
          label: "Result from convert",
          options: homeCtrl.currencies,
          selectedItem: homeCtrl.toCurrency,
          controller: homeCtrl.toTextField,
          onChanged: (model) {
            setState(() {
              homeCtrl.toCurrency = model!;
              homeCtrl.convert();
            });
          },
        ),
        SizedBox(height: 50),
        ButtonWidget(name: "Convert", onPressed: homeCtrl.convert),
      ],
    );
  }

  Widget _buildError() {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          Text(
            "Algo deu errado x.x",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 10),
          ButtonWidget(
            name: "Tentar Novamente",
            onPressed: homeCtrl.start,
          )
        ],
      ),
    );
  }

  Widget manageState(CurrencyState state) {
    switch (state) {
      case CurrencyState.starting:
        return Container();
      case CurrencyState.loading:
        return _buildLoading();
      case CurrencyState.success:
        return _buildSuccess();
      case CurrencyState.error:
        return _buildError();
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
            padding: EdgeInsets.only(
              bottom: (MediaQuery.of(context).size.height * 0.05),
              top: (MediaQuery.of(context).size.height * 0.07),
            ),
            child: Image.asset(
              "assets/money.png",
              height: (MediaQuery.of(context).size.height * 0.25),
            ),
          ),
          ValueListenableBuilder(
            valueListenable: homeCtrl.controllerState,
            builder: (context, CurrencyState value, child) =>
                manageState(value),
            //    _buildLoading(),
            //_buildSuccess(),
          ),
        ],
      ),
    );
  }
}

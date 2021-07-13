import 'package:currency_converter/app/components/buttonWidget.dart';
import 'package:currency_converter/app/components/currencyConverterRow.dart';
import 'package:currency_converter/app/components/loadingContainer.dart';
import 'package:currency_converter/app/components/placeHolderRow.dart';
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

  Widget _buildLoading() {
    return Column(
      children: [
        PlaceHolderRow(),
        SizedBox(height: 30),
        PlaceHolderRow(),
        SizedBox(height: 50),
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
        ButtonWidget(name: "Converter", onPressed: homeCtrl.convert),
      ],
    );
  }

  Widget _buildError() {
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
            //    _buildLoading(),
            //_buildSuccess(),
          ),
        ],
      ),
    );
  }
}

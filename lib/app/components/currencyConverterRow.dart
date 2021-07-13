import 'package:currency_converter/app/models/hg_api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';

class CurrencyConverterRow extends StatefulWidget {
  final String label;
  final List<Currency> options;
  final Currency? selectedItem;
  final TextEditingController controller;
  final void Function(Currency? model)? onChanged;
  final bool readOnly;

  CurrencyConverterRow({
    Key? key,
    required this.label,
    required this.options,
    required this.selectedItem,
    required this.controller,
    required this.onChanged,
    required this.readOnly,
  }) : super(key: key);

  @override
  _CurrencyConverterRowState createState() => _CurrencyConverterRowState();
}

class _CurrencyConverterRowState extends State<CurrencyConverterRow> {
  Widget _buildDropdownFieldWidget() {
    return DropdownButton<Currency>(
      value: widget.selectedItem,
      isExpanded: true,
      itemHeight: 76,
      iconSize: 20,
      icon: Icon(Icons.arrow_downward, color: Colors.white),
      style: TextStyle(color: Colors.white),
      dropdownColor: Colors.purple,
      underline: Container(
        height: 1,
        color: Colors.white,
      ),
      onChanged: widget.onChanged,
      items: widget.options
          .map(
            (e) => DropdownMenuItem<Currency>(
              child: Text(e.name.toUpperCase()),
              value: e,
            ),
          )
          .toList(),
    );
  }

  Widget _buildTextFieldWidget() {
    return TextField(
      inputFormatters: [
        MoneyInputFormatter(
          leadingSymbol: MoneySymbols.DOLLAR_SIGN,
          useSymbolPadding: true,
          thousandSeparator: ThousandSeparator.None,
        ),
      ],
      readOnly: widget.readOnly,
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: widget.label,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.white),
      ),
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: _buildDropdownFieldWidget(),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 6,
          child: _buildTextFieldWidget(),
        ),
      ],
    );
  }
}

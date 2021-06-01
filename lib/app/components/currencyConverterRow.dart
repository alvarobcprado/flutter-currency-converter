import 'package:currency_converter/app/models/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyConverterRow extends StatefulWidget {
  final String label;
  final List<CurrencyModel> options;
  final CurrencyModel selectedItem;
  final TextEditingController controller;
  final void Function(CurrencyModel? model)? onChanged;

  const CurrencyConverterRow({
    Key? key,
    required this.options,
    required this.controller,
    required this.onChanged,
    required this.selectedItem,
    required this.label,
  }) : super(key: key);

  @override
  _CurrencyConverterRowState createState() => _CurrencyConverterRowState();
}

class _CurrencyConverterRowState extends State<CurrencyConverterRow> {
  Widget _buildDropdownFieldWidget() {
    return DropdownButton<CurrencyModel>(
      value: widget.selectedItem,
      isExpanded: true,
      itemHeight: 65,
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
            (e) => DropdownMenuItem<CurrencyModel>(
              child: Text(e.name.toUpperCase()),
              value: e,
            ),
          )
          .toList(),
    );
  }

  Widget _buildTextFieldWidget() {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: widget.label,
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintStyle: TextStyle(color: Colors.white),
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
          flex: 1,
          child: _buildDropdownFieldWidget(),
        ),
        SizedBox(width: 20),
        Expanded(
          flex: 4,
          child: _buildTextFieldWidget(),
        ),
      ],
    );
  }
}

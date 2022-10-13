import 'dart:math';

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String? selectedCurrency = "USD";
  List<DropdownMenuItem<String>> getDropDownItems() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currentList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  List<Widget> getPickerItem() {
    List<Text> pickerItem = [];
    for (String currency in currentList) {
      Text(currency);
      pickerItem.add(Text(currency));
    }
    return pickerItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 28),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              backgroundColor: Colors.lightBlueAccent,
              itemExtent: 32,
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
              },
              children: getPickerItem(),
            ),
          )
        ],
      ),
    );
  }
}
// DropdownButton<String>(
// value: selectedCurrency,
// items: getDropDownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value;
// });
// },
// ),

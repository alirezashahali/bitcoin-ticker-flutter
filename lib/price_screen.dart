import 'dart:async';
import 'dart:convert';

import 'package:bitcoin_ticker/utils/CardRenderer.dart';
import 'package:bitcoin_ticker/utils/Konst.dart';
import 'package:bitcoin_ticker/utils/httpCall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  dynamic _data;
  dynamic _baseCurrency = 'IRR';
  dynamic _listCurrency = ['USD', 'EUR', 'GBP'];
  dynamic _height;

  final spinkit = SpinKitRotatingCircle(
    color: Colors.lightBlue,
    size: 50.0,
  );

  void getData() async {
    var _http = HttpCall(kUrl);
    var _holder = await _http.getCurrency();
    setState(() {
      _data = jsonDecode(_holder.body);
    });
  }

  void timer() {
    Timer(Duration(minutes: 30), () {
      getData();
    });
  }

  void _changeBaseCurrency(String nVal) {
    setState(() {
      _baseCurrency = nVal;
    });
  }

  void _deleteListCurrency(String cName) {
    // print(cName);
    setState(() {
      _listCurrency = _listCurrency.where((f) => f != cName).toList();
    });
  }

  void _addListCurrency(String cName) {
    print(cName);
    if (_listCurrency.indexOf(cName) < 0) {
      setState(() {
        _listCurrency.add(cName);
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      _height = MediaQuery.of(context).size.height;
    });
    if (_data == null) {
      return spinkit;
    }
    return cardRenderer(_data['rates'], _baseCurrency, _listCurrency, _height,
        _changeBaseCurrency, _deleteListCurrency, _addListCurrency);
  }
}

import 'dart:core';

import 'package:flutter/material.dart';

List<Widget> listToWidget(List<String> inList) {
  List<Widget> outList = [];
  for (String iL in inList) {
    // print(iL);
    outList.add(Text(
      iL,
      style: TextStyle(color: Colors.white, fontSize: 18),
    ));
  }
  return outList;
}

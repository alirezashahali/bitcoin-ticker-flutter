import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DropDown extends StatefulWidget {
  final List<String> list;
  final Function changeBaseCurrency;
  DropDown(this.list, this.changeBaseCurrency);
  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  String current = 'IRR';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: current,
      icon: FaIcon(FontAwesomeIcons.syncAlt, color: Colors.white),
      iconSize: 16,
      elevation: 16,
      dropdownColor: Colors.lightBlue[900],
      focusColor: Colors.lightBlue,
      style: TextStyle(color: Colors.white),
      onChanged: (String newValue) {
        setState(() {
          current = newValue;
        });
        widget.changeBaseCurrency(newValue);
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

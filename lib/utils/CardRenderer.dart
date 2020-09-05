import 'package:bitcoin_ticker/Components/dropDown.dart';
import 'package:bitcoin_ticker/utils/Konst.dart';
import 'package:bitcoin_ticker/utils/listToWidgetList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget cardRenderer(data, baseCurrency, listCurrency, height,
    changeBaseCurrency, deleteListCurrency, addListCurrency) {
  int index = 0;
  return Scaffold(
      appBar: AppBar(
        title: Text(
          'Convercy',
          style: TextStyle(fontFamily: 'Niconne', fontSize: 30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            child: Center(
              child: Card(
                elevation: 10,
                color: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                child: DropDown(
                                    data.keys.toList(), changeBaseCurrency))
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(children: <Widget>[
                          Container(
                            height: (listCurrency.length * (kfontSize * 3)) +
                                        3 * kfontSize >
                                    height * .4
                                ? height * .2
                                : listCurrency.length * (kfontSize * 4),
                            child: ListView.separated(
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    child: Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${((data[baseCurrency] / data[listCurrency[index]]) * 100).round() / 100} ${listCurrency[index]}',
                                              style: kCurrencyStyle,
                                            ),
                                            IconButton(
                                              icon: FaIcon(
                                                FontAwesomeIcons.trash,
                                                color: Colors.white,
                                                size: 16,
                                              ),
                                              onPressed: () {
                                                deleteListCurrency(
                                                    listCurrency[index]);
                                              },
                                            )
                                          ]),
                                    ),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        const Divider(),
                                itemCount: listCurrency.length),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Center(
                                  child: Container(
                                    height: 108.0,
                                    child: CupertinoPicker(
                                      itemExtent: 24.0,
                                      children:
                                          listToWidget(data.keys.toList()),
                                      backgroundColor: Colors.lightBlue[400],
                                      onSelectedItemChanged: (selectedIndex) {
                                        print(selectedIndex);
                                        index = selectedIndex;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  onPressed: () {
                                    print(index);
                                    addListCurrency(data.keys.toList()[index]);
                                  },
                                  icon: FaIcon(
                                    FontAwesomeIcons.plusSquare,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ]),
                      )
                    ],
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                ),
              ),
            ),
          ),
        ],
      ));
}

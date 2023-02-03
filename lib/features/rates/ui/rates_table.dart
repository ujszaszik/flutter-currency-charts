import 'package:currency_charts/model/currency/currency_item.dart';
import 'package:currency_charts/model/currency/currency_model.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Widget ratesTable(CurrencyModel model) {
  return Center(
      child: Container(
    margin: const EdgeInsets.all(Dimens.doublePadding),
    padding: const EdgeInsets.all(Dimens.doublePadding),
    child: Table(
      border: TableBorder.all(
          color: Colors.grey, style: BorderStyle.solid, width: 1),
      children: [
        _ratesHeaderRow(),
        _ratesDataRow(Strings.currencyValue, model.currencyModel[0]),
        _ratesDataRow(Strings.forExValue, model.exchangeModel[0])
      ],
    ),
  ));
}

TableRow _ratesHeaderRow() {
  return TableRow(children: [
    Column(),
    _ratesCell(Strings.buyLabel),
    _ratesCell(Strings.sellLabel),
  ]);
}

TableRow _ratesDataRow(String key, CurrencyItem item) {
  return TableRow(children: [
    _ratesCell(key),
    _ratesCell(item.buy),
    _ratesCell(item.sell)
  ]);
}

Container _ratesCell(dynamic value) {
  return Container(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(children: [
        Text(value.toString(),
            style: const TextStyle(fontSize: Dimens.textSizeL))
      ]));
}

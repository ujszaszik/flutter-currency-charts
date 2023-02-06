import 'package:currency_charts/extension/string_extensions.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/table/rates_source.dart';
import 'package:flutter/material.dart';

Widget ratesTable(RatesSource source) {
  return Center(
      child: Container(
    margin: const EdgeInsets.all(Dimens.doublePadding),
    padding: const EdgeInsets.all(Dimens.doublePadding),
    child: Table(
      border: TableBorder.all(
          color: Colors.grey, style: BorderStyle.solid, width: 1),
      children: [
        _ratesHeaderRow(source.headerImageName()),
        _ratesDataRow(
            Strings.currencyValue, source.currencyBuy(), source.currencySell()),
        _ratesDataRow(Strings.forExValue, source.forExBuy(), source.forExSell())
      ],
    ),
  ));
}

TableRow _ratesHeaderRow(String headerImageName) {
  return TableRow(children: [
    _currencyCell(headerImageName),
    _ratesCell(Strings.buyLabel),
    _ratesCell(Strings.sellLabel),
  ]);
}

TableRow _ratesDataRow(String key, double buy, double sell) {
  return TableRow(
      children: [_ratesCell(key), _ratesCell(buy), _ratesCell(sell)]);
}

Container _ratesCell(dynamic value) {
  return Container(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(children: [
        Text(value.toString().replaceUnknownValue(),
            style: const TextStyle(fontSize: Dimens.textSizeL))
      ]));
}

Container _currencyCell(String imageName) {
  return Container(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(children: [Image.asset(imageName, width: 25, height: 25)]));
}

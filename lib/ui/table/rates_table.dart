import 'package:currency_charts/extension/string_extensions.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:currency_charts/ui/table/rates_source.dart';
import 'package:flutter/material.dart';

Widget ratesTable(RatesSource source) {
  return Center(
      child: Container(
    margin: const EdgeInsets.all(Dimens.doublePadding),
    padding: const EdgeInsets.all(Dimens.doublePadding),
    child: Table(
      children: [
        _ratesHeaderRow(source.headerImageName()),
        _ratesDataOddRow(
            Strings.currencyValue, source.currencyBuy(), source.currencySell()),
        _ratesDataEvenRow(
            Strings.forExValue, source.forExBuy(), source.forExSell())
      ],
    ),
  ));
}

TableRow _ratesHeaderRow(String headerImageName) {
  return TableRow(children: [
    _imageHeaderCell(headerImageName),
    _ratesEvenCell(Strings.buyLabel),
    _ratesEvenCell(Strings.sellLabel),
  ]);
}

TableRow _ratesDataOddRow(String key, double buy, double sell) {
  return TableRow(
      decoration: const BoxDecoration(color: Colors.blueGrey),
      children: [_ratesOddCell(key), _ratesOddCell(buy), _ratesOddCell(sell)]);
}

Container _ratesOddCell(dynamic value) {
  return Container(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(value.toString().replaceUnknownValue(),
            style: const TextStyle(
                fontSize: Dimens.textSizeM, color: Colors.white))
      ]));
}

TableRow _ratesDataEvenRow(String key, double buy, double sell) {
  return TableRow(
      decoration: const BoxDecoration(color: Colors.white),
      children: [
        _ratesEvenCell(key),
        _ratesEvenCell(buy),
        _ratesEvenCell(sell)
      ]);
}

Container _ratesEvenCell(dynamic value) {
  return Container(
      padding: const EdgeInsets.all(Dimens.defaultPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(value.toString().replaceUnknownValue(),
            style: const TextStyle(
                fontSize: Dimens.textSizeM, color: Colors.blueGrey))
      ]));
}

Container _imageHeaderCell(String imageName) {
  return Container(
      padding: const EdgeInsets.all(Dimens.halfPadding),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        imageAsset(name: imageName, size: Sizes.tableCellHeaderImageSize),
      ]));
}

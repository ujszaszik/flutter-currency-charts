import 'package:currency_charts/features/rates/model/rates_query.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:currency_charts/ui/text/texts.dart';
import 'package:flutter/material.dart';

Widget ratesHeader(RatesQuery query) {
  return SpacedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.defaultPadding,
      elements: [
        horizontalSpacer(),
        _ratesHeaderItem(Strings.labelBankName, query.bank!.name),
        _ratesHeaderItem(Strings.labelCurrencyName, query.currencyType.name)
      ]);
}

Widget _ratesHeaderItem(String key, dynamic value) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: Column(
        children: [largeBoldText(key), largeItalicText(value)],
      ));
}

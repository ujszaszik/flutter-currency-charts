import 'package:currency_charts/features/userrates/query/user_rates_query.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:currency_charts/ui/text/texts.dart';
import 'package:flutter/material.dart';

Widget userRatesHeader(UserRatesQuery query) {
  return SpacedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.defaultPadding,
      elements: [
        horizontalSpacer(),
        _userRatesHeaderItem(Strings.labelBankName, query.bank.name),
        _userRatesHeaderItem(Strings.labelCurrencyName, query.currencyType.name)
      ]);
}

Widget _userRatesHeaderItem(String key, dynamic value) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: Column(
        children: [largeBoldText(key), largeItalicText(value)],
      ));
}

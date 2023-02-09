import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header_currency.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header_rates.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Widget chartHeader(ChartsItems items) {
  return _container(chartHeaderRates(items), chartCurrencyHeader(items));
}

Widget _container(Widget left, Widget right) {
  return Padding(
      padding: const EdgeInsets.all(Dimens.doublePadding),
      child: Row(
        children: [
          Flexible(
            child: SizedBox(height: 100, child: left),
            flex: 1,
          ),
          Expanded(
            child: SizedBox(height: 100, child: right),
            flex: 1,
          )
        ],
      ));
}

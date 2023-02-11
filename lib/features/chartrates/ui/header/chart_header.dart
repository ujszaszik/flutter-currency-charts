import 'package:currency_charts/features/chartrates/model/charts_items.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header_currency.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header_extremes.dart';
import 'package:currency_charts/features/chartrates/ui/header/chart_header_rates.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/ui/container/section_container.dart';
import 'package:currency_charts/ui/padding/padding_containers.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:flutter/material.dart';

Widget chartHeader(
    {required ChartsItems data, required DateInterval interval}) {
  return DoublePadding(
      child: Card(
          elevation: Dimens.defaultCardElevation,
          child: Column(children: [
            sectionContainer(
                left: chartHeaderRates(data),
                right: chartCurrencyHeader(data),
                height: Dimens.chartHeaderHeight),
            chartHeaderExtremes(data),
          ])));
}

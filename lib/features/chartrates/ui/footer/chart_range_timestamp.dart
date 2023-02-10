import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/util/date/date_interval.dart';
import 'package:flutter/material.dart';

Widget chartRangeTimestamp(DateInterval interval) {
  return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Text(
      interval.labelText(),
      style: const TextStyle(fontSize: Dimens.textSizeXS, color: Colors.blueGrey),
    )
  ]);
}

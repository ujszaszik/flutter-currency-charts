import 'package:currency_charts/data/model/bank.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';

Widget bankItemScreen({required Bank bank, required Function(Bank) onClick}) {
  return InkWell(
      onTap: () => {onClick(bank)},
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(Dimens.defaultPadding),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Image.asset(bank.imageName(), height: 50, width: 150)]),
      )));
}

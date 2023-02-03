import 'package:currency_charts/features/home/model/selector_item_model.dart';
import 'package:currency_charts/resources/strings.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:currency_charts/ui/text/texts.dart';
import 'package:flutter/material.dart';

Widget currencyDropDown(
    {required int currentSelection,
    required List<SelectorItemModel> menuItems,
    required Function(int) onChanged}) {
  return Column(children: [
    const Text(Strings.currencySelectionTitle),
    verticalSpacer(),
    DropdownButton(
      value: currentSelection,
      items: menuItems.map((item) => _currencyDropdownRow(item)).toList(),
      onChanged: (newValue) => onChanged(newValue),
    )
  ]);
}

DropdownMenuItem _currencyDropdownRow(SelectorItemModel item) {
  return DropdownMenuItem(
      value: item.index,
      child: Row(children: [
        const Icon(Icons.euro),
        horizontalSpacer(),
        largeText(item.name)
      ]));
}

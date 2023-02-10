import 'package:currency_charts/features/home/model/selector_item_model.dart';
import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/container/decorated_container.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:currency_charts/ui/text/texts.dart';
import 'package:flutter/material.dart';

Widget genericDropdown<T>(
    {required String title,
    required int currentSelection,
    required List<SelectorItemModel> menuItems,
    required Function(int) onChanged}) {
  return SpacedColumn(
      spacing: Dimens.defaultPadding,
      mainAxisAlignment: MainAxisAlignment.start,
      elements: [
        Text(title,
            textAlign: TextAlign.start,
            style: const TextStyle(color: Colors.blueGrey)),
        decoratedContainer(
            child: DropdownButton(
          value: currentSelection,
          items: menuItems.map((item) => _bankDropdownRow(item)).toList(),
          onChanged: (newValue) => onChanged(newValue),
          underline: Container(),
          iconEnabledColor: Colors.blueGrey,
        ))
      ]);
}

DropdownMenuItem _bankDropdownRow(SelectorItemModel item) {
  return DropdownMenuItem(
      value: item.index,
      child: Row(mainAxisSize: MainAxisSize.max, children: [
        imageAsset(name: item.imageName, size: Sizes.dropdownImageSize),
        horizontalSpacer(),
        largeText(item.name)
      ]));
}

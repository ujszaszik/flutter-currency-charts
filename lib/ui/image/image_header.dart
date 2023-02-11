import 'package:currency_charts/resources/dimens.dart';
import 'package:currency_charts/resources/sizes.dart';
import 'package:currency_charts/ui/image/image_asset.dart';
import 'package:currency_charts/ui/spacing/spaced_column.dart';
import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:flutter/material.dart';

Widget imageHeader({required String imageName, String? imageTitle}) {
  return SpacedColumn(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: Dimens.defaultPadding,
      elements: [
        verticalSpacer(),
        imageAsset(name: imageName, size: Sizes.headerImageSize),
        imageTitle != null ? _imageHeaderText(imageTitle) : Container()
      ]);
}

Text _imageHeaderText(String text) {
  return Text(text,
      style:
          const TextStyle(color: Colors.black, fontSize: Dimens.textSizeL));
}

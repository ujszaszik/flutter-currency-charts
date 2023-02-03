import 'package:currency_charts/ui/spacing/spacings.dart';
import 'package:flutter/material.dart';

class SpacedColumn extends Flex {
  SpacedColumn(
      {super.key,
      super.mainAxisAlignment,
      super.mainAxisSize,
      super.crossAxisAlignment,
      super.textDirection,
      super.verticalDirection,
      super.textBaseline,
      required this.elements,
      required this.spacing})
      : super(
            direction: Axis.vertical,
            children: spacedChildren(spacing: spacing, elements: elements));

  final double spacing;
  final List<Widget> elements;
}

List<Widget> spacedChildren(
    {required double spacing, required List<Widget> elements}) {
  return elements
      .map((elem) => Column(children: [elem, verticalSpacer(height: spacing)]))
      .toList();
}

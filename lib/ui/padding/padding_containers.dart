import 'package:currency_charts/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class _PaddingContainer extends SingleChildRenderObjectWidget {
  const _PaddingContainer({
    super.key,
    required this.padding,
    super.child,
  });

  final double padding;

  @override
  RenderPadding createRenderObject(BuildContext context) {
    return RenderPadding(
      padding: EdgeInsets.all(padding),
      textDirection: Directionality.maybeOf(context),
    );
  }
}

class DefaultPadding extends _PaddingContainer {
  const DefaultPadding(
      {super.key, super.padding = Dimens.defaultPadding, super.child});
}

class DoublePadding extends _PaddingContainer {
  const DoublePadding(
      {super.key, super.padding = Dimens.doublePadding, super.child});
}

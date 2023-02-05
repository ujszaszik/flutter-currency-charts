import 'package:currency_charts/resources/strings.dart';
import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text(Strings.emptyPageTitle)
        ],
      ),
    );
  }
}
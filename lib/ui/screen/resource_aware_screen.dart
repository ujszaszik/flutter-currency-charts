import 'package:currency_charts/data/network/resource.dart';
import 'package:currency_charts/ui/screen/error_screen.dart';
import 'package:currency_charts/ui/screen/loading_screen.dart';
import 'package:flutter/material.dart';

class ResourceAwareScreen<T> extends StatelessWidget {
  const ResourceAwareScreen(
      {Key? key, required this.stream, required this.mainScreen})
      : super(key: key);

  final Stream<Resource<T>> stream;
  final Function(T) mainScreen;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Resource<T>>(
      stream: stream,
      builder: (context, state) {
        if (!state.hasData || state.data is Loading) {
          return const LoadingScreen();
        } else if (state.data is Error) {
          return ErrorScreen(message: (state.data as Error).message);
        } else {
          return mainScreen((state.data as Success).data);
        }
      },
    );
  }
}

import 'package:currency_charts/data/network/resource.dart';

class ResourceCollector<T> {
  late Stream<Resource<T>> _source;
  late Function(T) _doOnSuccess;
  late Function(String) _doOnError;
  late Function _doOnLoading;

  ResourceCollector();

  onSource(Stream<Resource<T>> source) {
    _source = source;
  }

  onSuccess(Function(T) doOnSuccess) {
    _doOnSuccess = doOnSuccess;
  }

  onError(Function(String) doOnError) {
    _doOnError = doOnError;
  }

  onLoading(Function doOnLoading) {
    _doOnLoading = doOnLoading;
  }

  void collect() {
    _source.listen((event) {
      if (event is Success) {
        _doOnSuccess((event as Success).data);
      } else if (event is Error) {
        _doOnError((event as Error).message);
      } else if (event is Loading) {
        _doOnLoading();
      }
    });
  }
}

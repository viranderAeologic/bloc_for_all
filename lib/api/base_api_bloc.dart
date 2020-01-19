import 'dart:async';

import 'package:bloc_for_all/api/api_response.dart';

class BaseApiBloc<T> {
  StreamController _streamController = StreamController<ApiResponse<T>>.broadcast();

  StreamSink<ApiResponse<T>> get apiDataSink =>
      _streamController.sink;

  Stream<ApiResponse<T>> get apiDataSinkStream =>
      _streamController.stream;

  dispose() {
    _streamController?.close();
  }

  void startLoading(String message) {
    apiDataSink.add(ApiResponse.loading(message));
  }

  void addData(data) {
    apiDataSink.add(ApiResponse.completed(data));
  }

  void addError(e) {
    apiDataSink.add(ApiResponse.error(e));
  }
}
